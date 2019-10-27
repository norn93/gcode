%
O0000(MY GCODE)
(TOOL DIAMETER: 3.0)
(CUT SPEED: 100.0)
(PLUNGE SPEED: 50.0)
N1 G21; mm mode
N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning
N3 T212 M6; tool select, automatic tool changes
N4 G0 G90 G54 X0.0 Y0.0 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, set feedrate]
N5 X1 Y1; Activate all the axes
N6 X0 Y0; Back to origin
( Cutting rectangular pocket from (5.7, 9) to (12.2, 55) )
( Making 2.0 depth cut(s) at 2.0mm per cut )
N7 Z10.0 F600.0
N8 X7.2 Y10.5 
N9 Z1.0 
N10 Z-2.0 F50.0; Cutting to new depth
N11 X7.2 Y10.5 F100.0
N12 Y53.5 
N13 X10.7 
N14 Y10.5 
N15 X7.2 
N16 Z10.0 F600.0
N17 X7.2 Y10.5 F600.0
N18 Z1.0 
N19 Z-4.0 F50.0; Cutting to new depth
N20 X7.2 Y10.5 F100.0
N21 Y53.5 
N22 X10.7 
N23 Y10.5 
N24 X7.2 
N25 Z10.0 F600.0
( Cutting rectangular pocket from (15.2, 10.5) to (26.7, 17) )
( Making 2.0 depth cut(s) at 2.0mm per cut )
N26 Z10.0 F600.0
N27 X16.7 Y12.0 F600.0
N28 Z1.0 
N29 Z-2.0 F50.0; Cutting to new depth
N30 X16.7 Y12.0 F100.0
N31 Y15.5 
N32 X25.2 
N33 Y12.0 
N34 X16.7 
N35 Z10.0 F600.0
N36 X16.7 Y12.0 F600.0
N37 Z1.0 
N38 Z-4.0 F50.0; Cutting to new depth
N39 X16.7 Y12.0 F100.0
N40 Y15.5 
N41 X25.2 
N42 Y12.0 
N43 X16.7 
N44 Z10.0 F600.0
( Cutting rectangular pocket from (40.2, 12) to (46.7, 42) )
( Making 2.0 depth cut(s) at 2.0mm per cut )
N45 Z10.0 F600.0
N46 X41.7 Y13.5 F600.0
N47 Z1.0 
N48 Z-2.0 F50.0; Cutting to new depth
N49 X41.7 Y13.5 F100.0
N50 Y40.5 
N51 X45.2 
N52 Y13.5 
N53 X41.7 
N54 Z10.0 F600.0
N55 X41.7 Y13.5 F600.0
N56 Z1.0 
N57 Z-4.0 F50.0; Cutting to new depth
N58 X41.7 Y13.5 F100.0
N59 Y40.5 
N60 X45.2 
N61 Y13.5 
N62 X41.7 
N63 Z10.0 F600.0
( Cutting rectangular pocket from (48.5, -1) to (59.5, 16.5) )
( Making 1.0 depth cut(s) at 2.0mm per cut )
( Outside finish size: 0.0mm )
( Making 2.0 side cut(s) at 2.0mm per cut )
N64 Z10.0 F600.0
N65 X54.0 Y4.5 F600.0
N66 Z1.0 
N67 Z-2.0 F50.0; Cutting to new depth
N68 X54.0 Y4.5 F100.0
N69 Y11.0 
N70 X54.0 
N71 Y4.5 
N72 X54.0 
N73 X52.0 Y2.5 
N74 Y13.0 
N75 X56.0 
N76 Y2.5 
N77 X52.0 
N78 X50.0 Y0.5 
N79 Y15.0 
N80 X58.0 
N81 Y0.5 
N82 X50.0 
N83 Z10.0 F600.0
( Cutting rectangular pocket from (73.5, -1) to (84.5, 16.5) )
( Making 1.0 depth cut(s) at 2.0mm per cut )
( Outside finish size: 0.0mm )
( Making 2.0 side cut(s) at 2.0mm per cut )
N84 Z10.0 F600.0
N85 X79.0 Y4.5 F600.0
N86 Z1.0 
N87 Z-2.0 F50.0; Cutting to new depth
N88 X79.0 Y4.5 F100.0
N89 Y11.0 
N90 X79.0 
N91 Y4.5 
N92 X79.0 
N93 X77.0 Y2.5 
N94 Y13.0 
N95 X81.0 
N96 Y2.5 
N97 X77.0 
N98 X75.0 Y0.5 
N99 Y15.0 
N100 X83.0 
N101 Y0.5 
N102 X75.0 
N103 Z10.0 F600.0
( Done )
N104 M5; Turn off spindle
N105 M30; End of program
%