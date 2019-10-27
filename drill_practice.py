from gcode import gcode

g = gcode(cut_speed = 50, plunge_speed = 2)
g.drill(0, 0, -3.5, start_z = 0.1)
g.end()
g.save("gcode/drill_practice_8.gcode")