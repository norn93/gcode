%
O0000(MY GCODE)
(TOOL DIAMETER: 3.0)
(CUT SPEED: 50.0)
(PLUNGE SPEED: 2.0)
N1 G21; mm mode
N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning
N3 T212 M6; tool select, automatic tool changes
N4 G0 G90 G54 X0.0 Y0.0 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, set feedrate]
N5 X1 Y1; Activate all the axes
N6 X0 Y0; Back to origin
( Drilling hole )
N7 Z10.0 F600.0
N8 X0.0 Y0.0 
N9 Z0.1 
N10 Z-3.5 F2.0; Drilling hole at (0, 0)
N11 Z10.0 F600.0
( Done )
N12 M5; Turn off spindle
N13 M30; End of program
%