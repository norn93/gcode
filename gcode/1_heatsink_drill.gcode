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
( Drilling hole at (0, 0) )
N7 Z10.0 F600.0
N8 X0.0 Y0.0 
N9 Z1.0 
N10 Z-3.5 F2.0
N11 Z10.0 F600.0
( Drilling hole at (10.5, 4) )
N12 Z10.0 F600.0
N13 X10.5 Y4.0 F600.0
N14 Z1.0 
N15 Z-3.5 F2.0
N16 Z10.0 F600.0
( Drilling hole at (10.5, 66) )
N17 Z10.0 F600.0
N18 X10.5 Y66.0 F600.0
N19 Z1.0 
N20 Z-3.5 F2.0
N21 Z10.0 F600.0
( Drilling hole at (0, 70) )
N22 Z10.0 F600.0
N23 X0.0 Y70.0 F600.0
N24 Z1.0 
N25 Z-3.5 F2.0
N26 Z10.0 F600.0
( Drilling hole at (100, 70) )
N27 Z10.0 F600.0
N28 X100.0 Y70.0 F600.0
N29 Z1.0 
N30 Z-3.5 F2.0
N31 Z10.0 F600.0
( Drilling hole at (89.5, 66) )
N32 Z10.0 F600.0
N33 X89.5 Y66.0 F600.0
N34 Z1.0 
N35 Z-3.5 F2.0
N36 Z10.0 F600.0
( Drilling hole at (89.5, 4) )
N37 Z10.0 F600.0
N38 X89.5 Y4.0 F600.0
N39 Z1.0 
N40 Z-3.5 F2.0
N41 Z10.0 F600.0
( Drilling hole at (100, 0) )
N42 Z10.0 F600.0
N43 X100.0 Y0.0 F600.0
N44 Z1.0 
N45 Z-3.5 F2.0
N46 Z10.0 F600.0
( Done )
N47 M5; Turn off spindle
N48 M30; End of program
%