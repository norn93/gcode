from gcode import gcode

g = gcode()
g.drill(0, 0, -4)
g.drill(0, 70, -4)
g.drill(100, 70, -4)
g.drill(100, 0, -4)
g.rectangular_profile(5.7, 12.2, 9.5, 54.5, -4, 1)
g.rectangular_profile(15.7, 26.2, 10.5, 17, -4, 1)
g.rectangular_profile(40.2, 46.7, 12.5, 41.5, -4, 1)
g.rectangular_pocket(48.5, 59.5, -1, 16.5, -2, 1)
g.rectangular_pocket(73.5, 84.5, -1, 16.5, -2, 1)
g.end()
g.save("Acrylic_Top_pockets_and_drill.gcode")
