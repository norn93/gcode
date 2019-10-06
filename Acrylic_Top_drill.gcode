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
N7 Z1.0 
N8 Z-4.0 F100.0; Drilling hole at (0, 0)
N9 Z10.0 F600.0
( Drilling hole )
N10 Z10.0 F600.0
N11 X0.0 Y70.0 F600.0
N12 Z1.0 
N13 Z-4.0 F100.0; Drilling hole at (0, 70)
N14 Z10.0 F600.0
( Drilling hole )
N15 Z10.0 F600.0
N16 X100.0 Y70.0 F600.0
N17 Z1.0 
N18 Z-4.0 F100.0; Drilling hole at (100, 70)
N19 Z10.0 F600.0
( Drilling hole )
N20 Z10.0 F600.0
N21 X100.0 Y0.0 F600.0
N22 Z1.0 
N23 Z-4.0 F100.0; Drilling hole at (100, 0)
N24 Z10.0 F600.0
( Done )
N25 M5; Turn off spindle
N26 M30; End of program
%