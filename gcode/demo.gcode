%
O0000(MY GCODE)
(TOOL DIAMETER: 3.0)
(CUT SPEED: 100.0)
(PLUNGE SPEED: 50.0)
N1 G21; mm mode
N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning
N3 T1 M6; tool select, automatic tool changes
N4 G0 G90 G54 X0.0 Y0.0 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, set feedrate]
N5 X1 Y1; Activate all the axes
N6 X0 Y0; Back to origin
(MSG, Drilling hole at 0, 0 )
N7 G0 Z10.0 
N8 G0 X0.0 Y0.0 
N9 G0 Z1.0 
N10 G1 Z-3.5 F50.0
N11 G0 Z10.0 F600.0
(MSG, Cutting circular profile at -7, 7 of radius 5 )
(MSG, Making 2.0 depth cuts at 2.0mm per cut )
(MSG, Making 2.0 radius cuts at 1.75mm per cut )
N12 G0 Z10.0 
N13 G0 X-7.0 Y7.0 
N14 G0 Z1.0 
N15 G1 Z-2.0 F50.0; Cutting to new depth
N16 G1 Y5.25 F100.0
N17 G2 X-8.75 Y7.0 R1.75 F100.0
N18 G2 X-7.0 Y8.75 R1.75 F100.0
N19 G2 X-5.25 Y7.0 R1.75 F100.0
N20 G2 X-7.0 Y5.25 R1.75 F100.0
N21 G1 Y3.5 
N22 G2 X-10.5 Y7.0 R3.5 F100.0
N23 G2 X-7.0 Y10.5 R3.5 F100.0
N24 G2 X-3.5 Y7.0 R3.5 F100.0
N25 G2 X-7.0 Y3.5 R3.5 F100.0
N26 G0 Z10.0 F600.0
N27 G0 Z10.0 
N28 G0 X-7.0 Y7.0 
N29 G0 Z-1.0 
N30 G1 Z-4.0 F50.0; Cutting to new depth
N31 G1 Y5.25 F100.0
N32 G2 X-8.75 Y7.0 R1.75 F100.0
N33 G2 X-7.0 Y8.75 R1.75 F100.0
N34 G2 X-5.25 Y7.0 R1.75 F100.0
N35 G2 X-7.0 Y5.25 R1.75 F100.0
N36 G1 Y3.5 
N37 G2 X-10.5 Y7.0 R3.5 F100.0
N38 G2 X-7.0 Y10.5 R3.5 F100.0
N39 G2 X-3.5 Y7.0 R3.5 F100.0
N40 G2 X-7.0 Y3.5 R3.5 F100.0
N41 G0 Z10.0 F600.0
(MSG, Cutting circular profile at -7, -7 of radius 5 )
(MSG, Making 2.0 depth cuts at 2.0mm per cut )
N42 G0 Z10.0 
N43 G0 X-7.0 Y-10.5 
N44 G0 Z1.0 
N45 G1 Z-2.0 F50.0; Cutting to new depth
N46 G2 X-10.5 Y-7.0 R3.5 F100.0
N47 G2 X-7.0 Y-3.5 R3.5 F100.0
N48 G2 X-3.5 Y-7.0 R3.5 F100.0
N49 G2 X-7.0 Y-10.5 R3.5 F100.0
N50 G0 Z10.0 F600.0
N51 G0 X-7.0 Y-10.5 
N52 G0 Z-1.0 
N53 G1 Z-4.0 F50.0; Cutting to new depth
N54 G2 X-10.5 Y-7.0 R3.5 F100.0
N55 G2 X-7.0 Y-3.5 R3.5 F100.0
N56 G2 X-3.5 Y-7.0 R3.5 F100.0
N57 G2 X-7.0 Y-10.5 R3.5 F100.0
N58 G0 Z10.0 F600.0
(MSG, Cutting rectangular pocket from 3, -1.5 to 13, 8.5 )
(MSG, Making 2.0 depth cuts at 1.5mm per cut )
(MSG, Outside finish size: 0.15mm )
(MSG, Making 3.0 side cuts at 1.117mm per cut )
N59 G0 Z10.0 
N60 G0 X8.0 Y3.5 
N61 G0 Z0.5 
N62 G1 Z-1.5 F50.0; Cutting to new depth
N63 G1 X8.0 Y3.5 F100.0
N64 G1 Y3.5 
N65 G1 X8.0 
N66 G1 Y3.5 
N67 G1 X8.0 
N68 G1 X6.883 Y2.383 
N69 G1 Y4.617 
N70 G1 X9.117 
N71 G1 Y2.383 
N72 G1 X6.883 
N73 G1 X5.767 Y1.267 
N74 G1 Y5.733 
N75 G1 X10.233 
N76 G1 Y1.267 
N77 G1 X5.767 
N78 G1 X4.65 Y0.15 
N79 G1 Y6.85 
N80 G1 X11.35 
N81 G1 Y0.15 
N82 G1 X4.65 
N83 G1 X4.5 Y0.0 
N84 G1 Y7.0 
N85 G1 X11.5 
N86 G1 Y0.0 
N87 G1 X4.5 
N88 G0 Z10.0 F600.0
N89 G0 X8.0 Y3.5 
N90 G0 Z-1.0 
N91 G1 Z-3.0 F50.0; Cutting to new depth
N92 G1 X8.0 Y3.5 F100.0
N93 G1 Y3.5 
N94 G1 X8.0 
N95 G1 Y3.5 
N96 G1 X8.0 
N97 G1 X6.883 Y2.383 
N98 G1 Y4.617 
N99 G1 X9.117 
N100 G1 Y2.383 
N101 G1 X6.883 
N102 G1 X5.767 Y1.267 
N103 G1 Y5.733 
N104 G1 X10.233 
N105 G1 Y1.267 
N106 G1 X5.767 
N107 G1 X4.65 Y0.15 
N108 G1 Y6.85 
N109 G1 X11.35 
N110 G1 Y0.15 
N111 G1 X4.65 
N112 G1 X4.5 Y0.0 
N113 G1 Y7.0 
N114 G1 X11.5 
N115 G1 Y0.0 
N116 G1 X4.5 
N117 G0 Z10.0 F600.0
(MSG, Cutting rectangular pocket from -20, -20 to 20, 20 )
(MSG, Making 2.0 depth cuts at 1.5mm per cut )
N118 G0 Z10.0 
N119 G0 X-18.5 Y-18.5 
N120 G0 Z1.0 
N121 G1 Z-1.5 F50.0; Cutting to new depth
N122 G1 X-18.5 Y-18.5 F100.0
N123 G1 Y18.5 
N124 G1 X18.5 
N125 G1 Y-18.5 
N126 G1 X-18.5 
N127 G0 Z10.0 F600.0
N128 G0 X-18.5 Y-18.5 
N129 G0 Z-0.5 
N130 G1 Z-3.0 F50.0; Cutting to new depth
N131 G1 X-18.5 Y-18.5 F100.0
N132 G1 Y18.5 
N133 G1 X18.5 
N134 G1 Y-18.5 
N135 G1 X-18.5 
N136 G0 Z10.0 F600.0
(MSG, Done )
N137 M5; Turn off spindle
N138 M30; End of program
%