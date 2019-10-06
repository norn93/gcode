import math

class gcode:
	def __init__(self, safe_z = 10, rapid_speed = 600, cut_speed = 100, tool_diameter = 3, name = "MY GCODE"):
		self.safe_z = safe_z
		self.rapid_speed = rapid_speed
		self.cut_speed = cut_speed
		self.line = 5
		self.speed = self.rapid_speed
		self.code = ["%",
		"O0000(" + name + ")",
		"(TOOL DIAMETER: " + str(float(tool_diameter)) + " )",
		"N1 G21; mm mode",
		"N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning",
		"N3 T212 M6; tool select, automatic tool changes",
		"N4 G0 G90 G54 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, feedrate 600 mm/min]",
		]
		self.tool_diameter = tool_diameter

	def rectangular_pocket(self, x1, x2, y1, y2, depth, depth_per_pass, overlap = 0.5, finishing_pass = 0.1):
		assert x2 > x1
		assert y2 > y1
		assert (x2 - x1) >= self.tool_diameter
		assert (y2 - y1) >= self.tool_diameter
		assert overlap >= 0 and overlap <= 1
		assert finishing_pass >= 0 and finishing_pass <= 1

		self.comment("Cutting rectangular pocket")

		center_x = (x2 + x1) / 2
		center_y = (y2 + y1) / 2

		depth_cuts = math.floor(depth/depth_per_pass)
		each_cut = depth/depth_cuts

		increment_size = self.tool_diameter * overlap

		finish_size = self.tool_diameter * finishing_pass

		bottom_left_x = x1 + self.tool_diameter / 2
		bottom_left_y = y1 + self.tool_diameter / 2

		bottom_right_x = x2 - self.tool_diameter / 2
		bottom_right_y = y1 + self.tool_diameter / 2

		top_right_x = x2 - self.tool_diameter / 2
		top_right_y = y2 - self.tool_diameter / 2

		top_left_x = x1 + self.tool_diameter / 2
		top_left_y = y2 - self.tool_diameter / 2

		d = 0
		while d > depth:

			self.safe()
			self.rapid(x = center_x, y = center_y)
			x = center_x
			y = center_y
			current_increment_size = increment_size
			self.rapid(z = 1)

			d -= each_cut

			# Cut the to the depth
			self.cut(z = str(d)[:5], comment = "Cutting to new depth")

			while not (x == bottom_left_x + finish_size and y == bottom_left_y + finish_size):

				# Cut upwards
				y = min(y2 - self.tool_diameter / 2 - finish_size, y + current_increment_size)
				self.cut(y = y)

				# Cut right
				x = min(x2 - self.tool_diameter / 2 - finish_size, x + current_increment_size)
				self.cut(x = x)

				current_increment_size += increment_size

				# Cut down
				y = max(y1 + self.tool_diameter / 2 + finish_size, y - current_increment_size)
				self.cut(y = y)

				# Cut left
				x = max(x1 + self.tool_diameter / 2 + finish_size, x - current_increment_size)
				self.cut(x = x)

				current_increment_size += increment_size

			# Cut around once
			self.cut(x = bottom_left_x, y = bottom_left_y)
			self.cut(x = top_left_x, y = top_left_y)
			self.cut(x = top_right_x, y = top_right_y)
			self.cut(x = bottom_right_x, y = bottom_right_y)
			self.cut(x = bottom_left_x, y = bottom_left_y)

		self.safe()

	def rectangular_profile(self, x1, x2, y1, y2, depth, depth_per_pass, finishing_pass = 0.1):
		assert x2 > x1
		assert y2 > y1
		assert (x2 - x1) >= self.tool_diameter
		assert (y2 - y1) >= self.tool_diameter
		assert finishing_pass >= 0 and finishing_pass <= 1

		self.comment("Cutting rectangular pocket")

		center_x = (x2 + x1) / 2
		center_y = (y2 + y1) / 2

		depth_cuts = math.floor(depth/depth_per_pass)
		each_cut = depth/depth_cuts

		finish_size = self.tool_diameter * finishing_pass

		bottom_left_x = x1 + self.tool_diameter / 2
		bottom_left_y = y1 + self.tool_diameter / 2

		bottom_right_x = x2 - self.tool_diameter / 2
		bottom_right_y = y1 + self.tool_diameter / 2

		top_right_x = x2 - self.tool_diameter / 2
		top_right_y = y2 - self.tool_diameter / 2

		top_left_x = x1 + self.tool_diameter / 2
		top_left_y = y2 - self.tool_diameter / 2

		d = 0
		while d > depth:

			self.safe()
			self.rapid(x = bottom_left_x, y = bottom_left_y)
			self.rapid(z = 1)

			d -= each_cut

			# Cut the to the depth
			self.cut(z = str(d)[:5], comment = "Cutting to new depth")

			# Cut around once
			self.cut(x = bottom_left_x + finish_size, y = bottom_left_y + finish_size)
			self.cut(x = top_left_x + finish_size, y = top_left_y - finish_size)
			self.cut(x = top_right_x - finish_size, y = top_right_y - finish_size)
			self.cut(x = bottom_right_x - finish_size, y = bottom_right_y + finish_size)
			self.cut(x = bottom_left_x - finish_size, y = bottom_left_y + finish_size)

			# Cut around last
			self.cut(x = bottom_left_x, y = bottom_left_y)
			self.cut(x = top_left_x, y = top_left_y)
			self.cut(x = top_right_x, y = top_right_y)
			self.cut(x = bottom_right_x, y = bottom_right_y)
			self.cut(x = bottom_left_x, y = bottom_left_y)

		self.safe()
				
	def comment(self, comment):
		self.code.append("( " + comment + " )")

	def end(self):
		self.comment("Done")
		self.write("M5", comment = "Turn off spindle")
		self.write("M30", comment = "End of program")
		self.code.append("%")

	def drill(self, x, y, depth):
		self.comment("Drilling hole")
		self.safe()
		self.rapid(x = x, y = y)
		self.rapid(z = 1)
		self.cut(z = depth, comment = "Drilling hole at (" + str(x) + ", " + str(y) + ")")
		self.safe()

	def rapid(self, x = "", y = "", z = "", comment = ""):
		line = ""
		if x != "":
			line += "X" + str(float(x)) + " "
		if y != "":
			line += "Y" + str(float(y)) + " "
		if z != "":
			line += "Z" + str(float(z)) + " "
		if self.speed != self.rapid_speed:
			line += "F" + str(float(self.rapid_speed))
			self.speed = self.rapid_speed
		self.write(line, comment)

	def cut(self, x = "", y = "", z = "", comment = ""):
		line = ""
		if x != "":
			line += "X" + str(float(x)) + " "
		if y != "":
			line += "Y" + str(float(y)) + " "
		if z != "":
			line += "Z" + str(float(z)) + " "
		if self.speed != self.cut_speed:
			line += "F" + str(float(self.cut_speed))
			self.speed = self.cut_speed
		self.write(line, comment)

	def safe(self):
		self.write("Z" + str(float(self.safe_z)) + " F" + str(float(self.rapid_speed)))

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