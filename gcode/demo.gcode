%
O0000(MY GCODE)
(TOOL DIAMETER: 3.0)
(CUT SPEED: 100.0)
(PLUNGE SPEED: 50.0)
N1 G21; mm mode
N2 G0 G17 G40 G49 G80 G90; rapid, use XY plane, tool radius/length compensation off, cancel canned cycles, absolute positioning
N3 T1 M6; tool select, automatic tool changes
N4 G0 G90 G54 X0.0 Y0.0 Z10.0 A0 S3000 M3 F600; Fixed cycle (roughing), use work coordinate system, move to first coordinate, don't use A axis, spindle speed 3000 rpm, spindle on, set feedrate]
N5 X0.1 Y0.1; Activate all the axes
N6 X0 Y0; Back to origin
(MSG, Drilling hole at 0, 0 )
N7 G0 Z10.0 
N8 G0 X0.0 Y0.0 
N9 G0 Z1.0 
N10 G1 Z-3.5 F50.0
N11 G0 Z10.0 F600.0
(MSG, Cutting circular profile at -7, 7 of radius 4 )
(MSG, Making 2.0 depth cuts at 2.0mm per cut )
(MSG, Making 2.0 radius cuts at 1.25mm per cut )
N12 G0 Z10.0 
N13 G0 X-7.0 Y7.0 
N14 G0 Z1.0 
N15 G1 Z-2.0 F50.0; Cutting to new depth
N16 G1 Y5.75 F100.0
N17 G2 X-8.25 Y7.0 R1.25 F100.0
N18 G2 X-7.0 Y8.25 R1.25 F100.0
N19 G2 X-5.75 Y7.0 R1.25 F100.0
N20 G2 X-7.0 Y5.75 R1.25 F100.0
N21 G1 Y4.5 
N22 G2 X-9.5 Y7.0 R2.5 F100.0
N23 G2 X-7.0 Y9.5 R2.5 F100.0
N24 G2 X-4.5 Y7.0 R2.5 F100.0
N25 G2 X-7.0 Y4.5 R2.5 F100.0
N26 G0 Z10.0 F600.0
N27 G0 Z10.0 
N28 G0 X-7.0 Y7.0 
N29 G0 Z-1.0 
N30 G1 Z-4.0 F50.0; Cutting to new depth
N31 G1 Y5.75 F100.0
N32 G2 X-8.25 Y7.0 R1.25 F100.0
N33 G2 X-7.0 Y8.25 R1.25 F100.0
N34 G2 X-5.75 Y7.0 R1.25 F100.0
N35 G2 X-7.0 Y5.75 R1.25 F100.0
N36 G1 Y4.5 
N37 G2 X-9.5 Y7.0 R2.5 F100.0
N38 G2 X-7.0 Y9.5 R2.5 F100.0
N39 G2 X-4.5 Y7.0 R2.5 F100.0
N40 G2 X-7.0 Y4.5 R2.5 F100.0
N41 G0 Z10.0 F600.0
(MSG, Cutting circular profile at -10, -10 of radius 4 )
(MSG, Making 2.0 depth cuts at 2.0mm per cut )
N42 G0 Z10.0 
N43 G0 X-10.0 Y-12.5 
N44 G0 Z1.0 
N45 G1 Z-2.0 F50.0; Cutting to new depth
N46 G2 X-12.5 Y-10.0 R2.5 F100.0
N47 G2 X-10.0 Y-7.5 R2.5 F100.0
N48 G2 X-7.5 Y-10.0 R2.5 F100.0
N49 G2 X-10.0 Y-12.5 R2.5 F100.0
N50 G0 Z10.0 F600.0
N51 G0 X-10.0 Y-12.5 
N52 G0 Z-1.0 
N53 G1 Z-4.0 F50.0; Cutting to new depth
N54 G2 X-12.5 Y-10.0 R2.5 F100.0
N55 G2 X-10.0 Y-7.5 R2.5 F100.0
N56 G2 X-7.5 Y-10.0 R2.5 F100.0
N57 G2 X-10.0 Y-12.5 R2.5 F100.0
N58 G0 Z10.0 F600.0
(MSG, Cutting circular profile at -10, -10 of radius 5 )
(MSG, Making 2.0 depth cuts at 2.0mm per cut )
N59 G0 Z10.0 
N60 G0 X-10.0 Y-16.5 
N61 G0 Z1.0 
N62 G1 Z-2.0 F50.0; Cutting to new depth
N63 G2 X-16.5 Y-10.0 R6.5 F100.0
N64 G2 X-10.0 Y-3.5 R6.5 F100.0
N65 G2 X-3.5 Y-10.0 R6.5 F100.0
N66 G2 X-10.0 Y-16.5 R6.5 F100.0
N67 G0 Z10.0 F600.0
N68 G0 X-10.0 Y-16.5 
N69 G0 Z-1.0 
N70 G1 Z-4.0 F50.0; Cutting to new depth
N71 G2 X-16.5 Y-10.0 R6.5 F100.0
N72 G2 X-10.0 Y-3.5 R6.5 F100.0
N73 G2 X-3.5 Y-10.0 R6.5 F100.0
N74 G2 X-10.0 Y-16.5 R6.5 F100.0
N75 G0 Z10.0 F600.0
(MSG, Cutting rectangular pocket from 3, 3 to 11, 11 )
(MSG, Making 2.0 depth cuts at 1.5mm per cut )
(MSG, Outside finish size: 0.15mm )
(MSG, Making 2.0 side cuts at 1.175mm per cut )
(MSG, Setting relative safe Z as 0.5 )
N76 G0 Z10.0 
N77 G0 X7.0 Y7.0 
N78 G0 Z0.5 
N79 G1 Z-1.5 F50.0; Cutting to new depth
N80 G1 X7.0 Y7.0 F100.0
N81 G1 Y7.0 
N82 G1 X7.0 
N83 G1 Y7.0 
N84 G1 X7.0 
N85 G1 X5.825 Y5.825 
N86 G1 Y8.175 
N87 G1 X8.175 
N88 G1 Y5.825 
N89 G1 X5.825 
N90 G1 X4.65 Y4.65 
N91 G1 Y9.35 
N92 G1 X9.35 
N93 G1 Y4.65 
N94 G1 X4.65 
N95 G1 X4.5 Y4.5 
N96 G1 Y9.5 
N97 G1 X9.5 
N98 G1 Y4.5 
N99 G1 X4.5 
N100 G0 Z10.0 F600.0
N101 G0 X7.0 Y7.0 
N102 G0 Z-1.0 
N103 G1 Z-3.0 F50.0; Cutting to new depth
N104 G1 X7.0 Y7.0 F100.0
N105 G1 Y7.0 
N106 G1 X7.0 
N107 G1 Y7.0 
N108 G1 X7.0 
N109 G1 X5.825 Y5.825 
N110 G1 Y8.175 
N111 G1 X8.175 
N112 G1 Y5.825 
N113 G1 X5.825 
N114 G1 X4.65 Y4.65 
N115 G1 Y9.35 
N116 G1 X9.35 
N117 G1 Y4.65 
N118 G1 X4.65 
N119 G1 X4.5 Y4.5 
N120 G1 Y9.5 
N121 G1 X9.5 
N122 G1 Y4.5 
N123 G1 X4.5 
N124 G0 Z10.0 F600.0
(MSG, Cutting rectangular pocket from 6, -14 to 14, -6 )
(MSG, Making 2.0 depth cuts at 1.5mm per cut )
N125 G0 Z10.0 
N126 G0 X7.5 Y-12.5 
N127 G0 Z1.0 
N128 G1 Z-1.5 F50.0; Cutting to new depth
N129 G1 X7.5 Y-12.5 F100.0
N130 G1 Y-7.5 
N131 G1 X12.5 
N132 G1 Y-12.5 
N133 G1 X7.5 
N134 G0 Z10.0 F600.0
N135 G0 X7.5 Y-12.5 
N136 G0 Z-0.5 
N137 G1 Z-3.0 F50.0; Cutting to new depth
N138 G1 X7.5 Y-12.5 F100.0
N139 G1 Y-7.5 
N140 G1 X12.5 
N141 G1 Y-12.5 
N142 G1 X7.5 
N143 G0 Z10.0 F600.0
(MSG, Cutting rectangular pocket from 5, -15 to 15, -5 )
(MSG, Making 2.0 depth cuts at 1.5mm per cut )
N144 G0 Z10.0 
N145 G0 X3.5 Y-16.5 
N146 G0 Z1.0 
N147 G1 Z-1.5 F50.0; Cutting to new depth
N148 G1 X3.5 Y-16.5 F100.0
N149 G1 Y-3.5 
N150 G1 X16.5 
N151 G1 Y-16.5 
N152 G1 X3.5 
N153 G0 Z10.0 F600.0
N154 G0 X3.5 Y-16.5 
N155 G0 Z-0.5 
N156 G1 Z-3.0 F50.0; Cutting to new depth
N157 G1 X3.5 Y-16.5 F100.0
N158 G1 Y-3.5 
N159 G1 X16.5 
N160 G1 Y-16.5 
N161 G1 X3.5 
N162 G0 Z10.0 F600.0
(MSG, Done )
N163 M5; Turn off spindle
N164 M30; End of program
%