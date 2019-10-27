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
( Drilling hole at (61.045, 67.745) )
N7 Z10.0 F600.0
N8 X61.045 Y67.745 
N9 Z1.0 
N10 Z-2.0 F2.0
N11 Z10.0 F600.0
( Drilling hole at (71.944, 67.745) )
N12 Z10.0 F600.0
N13 X71.944 Y67.745 F600.0
N14 Z1.0 
N15 Z-2.0 F2.0
N16 Z10.0 F600.0
( Done )
N17 M5; Turn off spindle
N18 M30; End of program
%