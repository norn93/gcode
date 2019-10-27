from gcode import gcode

g = gcode(material = "ACRYLIC")
g.drill(0, 0, -4)
g.drill(0, 70, -4)
g.drill(100, 70, -4)
g.drill(100, 0, -4)
g.end()
g.save("gcode/Acrylic_Top_drill.gcode")

g = gcode(material = "ACRYLIC")
g.drill(0, 69, -4)
g.drill(100, 69, -4)
g.end()
g.save("gcode/Acrylic_Top_drill2.gcode")

g = gcode(material = "ACRYLIC")
g.rectangular_profile(5.7, 12.2, 9, 55, -4)
g.rectangular_profile(15.2, 26.7, 10.5, 17, -4)
g.rectangular_profile(40.2, 46.7, 12, 42, -4)
g.rectangular_pocket(48.5, 59.5, -1, 16.5, -2, overlap = 0.2)
g.rectangular_pocket(73.5, 84.5, -1, 16.5, -2, overlap = 0.2)
g.end()
g.save("gcode/Acrylic_Top_pockets.gcode")
