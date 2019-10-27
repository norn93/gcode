from gcode import gcode

g = gcode(material = "ACRYLIC")
g.drill(0, 0, -3.5)
g.circular_pocket(-7, 7, r = 5, depth = -4)
g.circular_profile(-7, -7, r = 5, depth = -4)
g.circular_profile(-7, -7, r = 5, depth = -4, inside = False)
g.rectangular_pocket(3, 13, -1.5, 8.5, depth = -3, relative_start_z = 0.5, finishing_pass = 0.05)
g.rectangular_profile(-20, 20, -20, 20, depth = -3)
g.end()
g.save("gcode/demo.gcode")