import math

MATERIALS = {
	"ALUMINUIM": {"cut_speed": 50, "plunge_speed": 2, "depth_per_pass": 0.3},
	"ACRYLIC": {"cut_speed": 100, "plunge_speed": 50, "depth_per_pass": 2.0}
}

class gcode:
	def __init__(self, safe_z = 10, material = "", rapid_speed = 600, cut_speed = "", plunge_speed = "", 
		depth_per_pass = "", tool_diameter = 3, name = "MY GCODE"):

		self.safe_z = safe_z
		self.line = 7
		self.rapid_speed = rapid_speed
		self.speed = self.rapid_speed
		self.tool_diameter = tool_diameter

		assert material in MATERIALS
		self.cut_speed = MATERIALS[material]["cut_speed"]
		self.plunge_speed = MATERIALS[material]["plunge_speed"]
		self.depth_per_pass = MATERIALS[material]["depth_per_pass"]

		if cut_speed != "": # Override
			self.cut_speed = cut_speed
		if plunge_speed != "": # Override
			self.plunge_speed = plunge_speed
		if depth_per_pass != "": # Override
			self.depth_per_pass = depth_per_pass

		self.code = ["%",
		"O0000(" + name + ")",
		"(TOOL DIAMETER: " + str(float(self.tool_diameter)) + ")",
		"(CUT SPEED: " + str(float(self.cut_speed)) + ")",
		"(PLUNGE SPEED: " + str(float(self.plunge_speed)) + ")",
		"N1 G21; mm mode",
		"N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning",
		"N3 T1 M6; tool select, automatic tool changes",
		"N4 G0 G90 G54 X0.0 Y0.0 Z" + str(float(self.safe_z)) + " A0 S3000 M3 F" + str(self.rapid_speed) + "; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, set feedrate]",
		"N5 X0.1 Y0.1; Activate all the axes",
		"N6 X0 Y0; Back to origin"]

		self.x = 0
		self.y = 0
		self.z = self.safe_z

	def rectangular_pocket(self, x1, x2, y1, y2, depth, relative_start_z = "", depth_per_pass = "", overlap = 0.6, finishing_pass = 0.0):
		assert x2 > x1
		assert y2 > y1
		assert (x2 - x1) >= self.tool_diameter
		assert (y2 - y1) >= self.tool_diameter
		assert overlap >= 0 and overlap <= 1
		assert finishing_pass >= 0 and finishing_pass <= 1

		if depth_per_pass == "":
			depth_per_pass = self.depth_per_pass

		assert depth_per_pass > 0

		self.comment("Cutting rectangular pocket from " + str(x1) + ", " + str(y1) + " to " + str(x2) + ", " + str(y2))

		depth_cuts = -int(math.floor(depth/depth_per_pass))
		each_depth_cut = -depth/depth_cuts

		self.comment("Making " + pretty_number(depth_cuts) + " depth cuts at " + pretty_number(each_depth_cut) + "mm per cut")

		increment_size = self.tool_diameter * (1 - overlap)
		finish_size = self.tool_diameter * finishing_pass

		self.comment("Outside finish size: " + pretty_number(finish_size) + "mm")

		width = x2 - x1 - self.tool_diameter - finish_size * 2
		height = y2 - y1 - self.tool_diameter - finish_size * 2
		side_cuts = int(math.ceil(min(width, height) / 2 / increment_size))
		each_side_cut = min(width, height) / 2 / side_cuts

		self.comment("Making " + pretty_number(side_cuts) + " side cuts at " + pretty_number(each_side_cut) + "mm per cut")

		if relative_start_z == "":
			relative_start_z = min(self.safe_z, self.plunge_speed / 60 * 5)

		self.comment("Setting relative safe Z as " + pretty_number(relative_start_z))

		# Get the absolute max limits
		absolute_left = x1 + self.tool_diameter / 2
		absolute_right = x2 - self.tool_diameter / 2
		absolute_down = y1 + self.tool_diameter / 2
		absolute_up = y2 - self.tool_diameter / 2

		# Calculate all the rectangles we need to cut
		rects = []
		for side_cut in range(side_cuts + 1):
			left = absolute_left + side_cut * each_side_cut + finish_size
			right = absolute_right - side_cut * each_side_cut - finish_size
			down = absolute_down + side_cut * each_side_cut + finish_size
			up = absolute_up - side_cut * each_side_cut - finish_size
			rects.append([left, right, down, up])
		rects.reverse() # Reverse the order to cut from inside out

		d = 0
		#while round(d, 3) > round(depth, 3):
		for depth_cut in range(depth_cuts):

			for i, rect in enumerate(rects):
				left = rect[0]
				right = rect[1]
				down = rect[2]
				up = rect[3]

				# For the first point:
				if i == 0:
					self.safe()
					self.rapid(x = left, y = down)
					self.rapid(z = d + relative_start_z)

					d -= each_depth_cut

					# Cut the to the depth
					self.cut(z = round(d, 3), comment = "Cutting to new depth")
				
				self.cut(x = left, y = down)
				self.cut_rectangle_from_bottom_left(left, right, down, up)

			# Cut around last
			if finish_size != 0:
				self.cut(x = absolute_left, y = absolute_down)
				self.cut_rectangle_from_bottom_left(absolute_left, absolute_right, absolute_down, absolute_up)

		self.safe()

	def rectangular_profile(self, x1, x2, y1, y2, depth, relative_start_z = "", depth_per_pass = "", finishing_pass = 0, inside = True):

		assert x2 > x1
		assert y2 > y1
		assert (x2 - x1) >= self.tool_diameter
		assert (y2 - y1) >= self.tool_diameter
		assert finishing_pass >= 0 and finishing_pass <= 1

		if depth_per_pass == "":
			depth_per_pass = self.depth_per_pass

		assert depth_per_pass > 0

		self.comment("Cutting rectangular pocket from " + str(x1) + ", " + str(y1) + " to " + str(x2) + ", " + str(y2))

		depth_cuts = -math.floor(depth/depth_per_pass)
		each_depth_cut = -depth/depth_cuts

		self.comment("Making " + pretty_number(depth_cuts) + " depth cuts at " + pretty_number(each_depth_cut) + "mm per cut")

		if relative_start_z == "":
			relative_start_z = min(self.safe_z, self.plunge_speed / 60 * 5)

		self.comment("Setting relative safe Z as " + pretty_number(relative_start_z))

		inside = (2 * inside - 1)
		finish_size = self.tool_diameter * finishing_pass * inside

		absolute_left = x1 + self.tool_diameter / 2 * inside
		absolute_down = y1 + self.tool_diameter / 2 * inside
		absolute_right = x2 - self.tool_diameter / 2 * inside
		absolute_up = y2 - self.tool_diameter / 2 * inside

		d = 0
		while d > depth:

			self.safe()
			self.rapid(x = absolute_left + finish_size, y = absolute_down + finish_size)
			self.rapid(z = d + relative_start_z)

			d -= each_depth_cut

			# Cut the to the depth
			self.cut(z = str(d)[:5], comment = "Cutting to new depth")

			if finish_size != 0:
				# Cut around once
				self.cut_rectangle_from_bottom_left(absolute_left + finish_size, absolute_right - finish_size,
					absolute_down + finish_size, absolute_up - finish_size)

			# Cut around last
			self.cut(x = absolute_left, y = absolute_down)
			self.cut_rectangle_from_bottom_left(absolute_left, absolute_right, absolute_down, absolute_up)

		self.safe()

	def circular_profile(self, cx, cy, r, depth, relative_start_z = "", depth_per_pass = "", finishing_pass = 0, inside = True):

		assert r > self.tool_diameter / 2
		assert finishing_pass >= 0 and finishing_pass <= 1

		if depth_per_pass == "":
			depth_per_pass = self.depth_per_pass

		assert depth_per_pass > 0

		self.comment("Cutting circular profile at " + str(cx) + ", " + str(cy) + " of radius " + str(r))

		depth_cuts = -math.floor(depth/depth_per_pass)
		each_depth_cut = -depth/depth_cuts

		self.comment("Making " + pretty_number(depth_cuts) + " depth cuts at " + pretty_number(each_depth_cut) + "mm per cut")

		if relative_start_z == "":
			relative_start_z = min(self.safe_z, self.plunge_speed / 60 * 5)

		self.comment("Setting relative safe Z as " + pretty_number(relative_start_z))

		if inside:
			cut_radius = r - self.tool_diameter / 2 - self.tool_diameter * finishing_pass
			absolute_cut_radius = r - self.tool_diameter / 2 
		else:
			cut_radius = r + self.tool_diameter / 2 + self.tool_diameter * finishing_pass
			absolute_cut_radius = r + self.tool_diameter / 2

		d = 0
		while d > depth:
			self.safe()
			self.rapid(x = cx, y = cy - cut_radius)
			self.rapid(z = d + relative_start_z)

			d -= each_depth_cut

			# Cut the to the depth
			self.cut(z = str(d)[:5], comment = "Cutting to new depth")

			if finishing_pass != 0:

				self.cut_arc(cx - cut_radius, cy, cut_radius)
				self.cut_arc(cx, cy + cut_radius, cut_radius)
				self.cut_arc(cx + cut_radius, cy, cut_radius)
				self.cut_arc(cx, cy - cut_radius, cut_radius)

			self.cut_arc(cx - absolute_cut_radius, cy, absolute_cut_radius)
			self.cut_arc(cx, cy + absolute_cut_radius, absolute_cut_radius)
			self.cut_arc(cx + absolute_cut_radius, cy, absolute_cut_radius)
			self.cut_arc(cx, cy - absolute_cut_radius, absolute_cut_radius)

		self.safe()

	def circular_pocket(self, cx, cy, r, depth, relative_start_z = "", depth_per_pass = "", overlap = 0.6, finishing_pass = 0):

		assert r > self.tool_diameter / 2
		assert overlap >= 0 and overlap <= 1
		assert finishing_pass >= 0 and finishing_pass <= 1

		if depth_per_pass == "":
			depth_per_pass = self.depth_per_pass

		assert depth_per_pass > 0

		self.comment("Cutting circular profile at " + str(cx) + ", " + str(cy) + " of radius " + str(r))

		depth_cuts = -math.floor(depth/depth_per_pass)
		each_depth_cut = -depth/depth_cuts

		self.comment("Making " + pretty_number(depth_cuts) + " depth cuts at " + pretty_number(each_depth_cut) + "mm per cut")

		increment_size = self.tool_diameter * (1 - overlap)
		finish_size = self.tool_diameter * finishing_pass

		cut_radius = r - self.tool_diameter / 2 - self.tool_diameter * finishing_pass
		absolute_cut_radius = r - self.tool_diameter / 2 

		self.comment("Finish radius: " + pretty_number(absolute_cut_radius) + "mm")

		side_cuts = int(math.ceil(cut_radius / 2 / increment_size))
		each_side_cut = cut_radius / side_cuts

		self.comment("Making " + pretty_number(side_cuts) + " radius cuts at " + pretty_number(each_side_cut) + "mm per cut")

		if relative_start_z == "":
			relative_start_z = min(self.safe_z, self.plunge_speed / 60 * 5)

		self.comment("Setting relative safe Z as " + pretty_number(relative_start_z))

		d = 0
		for depth_cut in range(depth_cuts):

			s = each_side_cut
			
			for i, side in enumerate(range(side_cuts)):

				# For the first point:
				if i == 0:

					self.safe()
					self.rapid(x = cx, y = cy)
					self.rapid(z = d + relative_start_z)

					d -= each_depth_cut

					# Cut the to the depth
					self.cut(z = round(d, 3), comment = "Cutting to new depth")

				self.cut(y = cy - s)
				self.cut_arc(cx - s, cy, s)
				self.cut_arc(cx, cy + s, s)
				self.cut_arc(cx + s, cy, s)
				self.cut_arc(cx, cy - s, s)

				s += each_side_cut

			# Finnally, if we are doing a finish
			if finishing_pass != 0:
				self.cut(y = cy - absolute_cut_radius)
				self.cut_arc(cx - absolute_cut_radius, cy, absolute_cut_radius)
				self.cut_arc(cx, cy + absolute_cut_radius, absolute_cut_radius)
				self.cut_arc(cx + absolute_cut_radius, cy, absolute_cut_radius)
				self.cut_arc(cx, cy - absolute_cut_radius, absolute_cut_radius)

			self.safe()

	def slot(self, x1, x2, y1, y2, depth, relative_start_z = 1):

		depth_per_pass = self.depth_per_pass

		assert depth_per_pass > 0

		self.comment("Cutting slot from " + str(x1) + ", " + str(y1) + " to " + str(x2) + ", " + str(y2))

		depth_cuts = -math.floor(depth/depth_per_pass)
		each_depth_cut = -depth/depth_cuts

		self.comment("Making " + pretty_number(depth_cuts) + " depth cuts at " + pretty_number(each_depth_cut) + "mm per cut")

		d = 0
		while d > depth:
			self.safe()
			self.rapid(x = x1, y = y1)
			self.rapid(z = d + relative_start_z)

			d -= each_depth_cut

			# Cut the to the depth
			self.cut(z = str(d)[:5], comment = "Cutting to new depth")

			self.cut(x = x2, y = y2)

		self.safe()


	def cut_rectangle_from_bottom_left(self, x1, x2, y1, y2):
		self.cut(y = y2)
		self.cut(x = x2)
		self.cut(y = y1)
		self.cut(x = x1)

	def cut_circle_from_bottom(self, x, y, j):
		pass

	def drill(self, x, y, depth, relative_start_z = ""):
		self.comment("Drilling hole at (" + str(x) + ", " + str(y) + ")")

		if relative_start_z == "":
			relative_start_z = min(self.safe_z, self.plunge_speed / 60 * 5)

		self.comment("Setting relative safe Z as " + pretty_number(relative_start_z))

		self.safe()
		self.rapid(x = x, y = y)
		self.rapid(z = relative_start_z)
		self.cut(z = depth)
		self.safe()

	def comment(self, comment):
		comment = comment.replace("(", "")
		comment = comment.replace(")", "")
		self.code.append("(MSG, " + comment + " )")

	def end(self):
		self.comment("Done")
		self.write("M5", comment = "Turn off spindle")
		self.write("M30", comment = "End of program")
		self.code.append("%")

	def cut_arc(self, x = "", y = "", r = "", comment = ""):
		assert x != "" or y != ""
		assert r != ""

		speed = self.cut_speed
		line = "G2 "
		if x != "":
			line += "X" + pretty_number(x) + " "
		if y != "":
			line += "Y" + pretty_number(y) + " "
		line += "R" + pretty_number(r) + " "
		line += "F" + pretty_number(speed)
		self.write(line, comment)

	def safe(self):
		self.rapid(z = pretty_number(self.safe_z))

	def rapid(self, x = "", y = "", z = "", comment = ""):
		line = "G0 "
		speed = self.rapid_speed
		if x != "":
			line += "X" + pretty_number(x) + " "
			self.x = x
		if y != "":
			line += "Y" + pretty_number(y) + " "
			self.y = y
		if z != "":
			line += "Z" + pretty_number(z) + " "
			self.z = z
		if speed != self.speed:
			line += "F" + pretty_number(speed)
			self.speed = speed
		self.write(line, comment)

	def cut(self, x = "", y = "", z = "", comment = ""):
		line = "G1 "
		speed = 0
		if x != "":
			line += "X" + pretty_number(x) + " "
			speed = self.cut_speed
			self.x = x
		if y != "":
			line += "Y" + pretty_number(y) + " "
			speed = self.cut_speed
			self.y = y
		if z != "":
			line += "Z" + pretty_number(z) + " "
			speed = self.plunge_speed
			self.z = z
		if speed != self.speed:
			line += "F" + pretty_number(speed)
			self.speed = speed
		self.write(line, comment)

	def write(self, code, comment = ""):
		if comment:
			line = "N" + str(self.line) + " " + code + "; " + comment
		else:
			line = "N" + str(self.line) + " " + code
		self.line += 1
		self.code.append(line)

	def save(self, filename = "output.gcode"):
		with open(filename, "w+") as f:
			f.write("\n".join(self.code))
		print("Written to:", filename)

def pretty_number(n):
	return str(round(float(n), 3))