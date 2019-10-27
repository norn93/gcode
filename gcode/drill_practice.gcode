%
O0000(MY GCODE)
(TOOL DIAMETER: 3.0 )
N1 G21; mm mode
N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning
N3 T212 M6; tool select, automatic tool changes
N4 G0 G90 G54 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, feedrate 600 mm/min]
( Drilling hole )
N5 Z10.0 F600.0
N6 X0.0 Y0.0 
N7 Z0.1 
N8 Z-4.0 F1.0; Drilling hole at (0, 0)
N9 Z10.0 F600.0
( Done )
N10 M5; Turn off spindle
N11 M30; End of program
%