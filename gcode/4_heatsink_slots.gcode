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
( Cutting slot from (9.15, 18.5) to (9.15, 57.5) )
( Making 7.0 depth cut(s) at 0.286mm per cut )
N7 Z10.0 F600.0
N8 X9.15 Y18.5 
N9 Z0.1 
N10 Z-0.28 F2.0; Cutting to new depth
N11 X9.15 Y57.5 F50.0
N12 Z10.0 F600.0
N13 X9.15 Y18.5 F600.0
N14 Z-0.186 
N15 Z-0.57 F2.0; Cutting to new depth
N16 X9.15 Y57.5 F50.0
N17 Z10.0 F600.0
N18 X9.15 Y18.5 F600.0
N19 Z-0.471 
N20 Z-0.85 F2.0; Cutting to new depth
N21 X9.15 Y57.5 F50.0
N22 Z10.0 F600.0
N23 X9.15 Y18.5 F600.0
N24 Z-0.757 
N25 Z-1.14 F2.0; Cutting to new depth
N26 X9.15 Y57.5 F50.0
N27 Z10.0 F600.0
N28 X9.15 Y18.5 F600.0
N29 Z-1.043 
N30 Z-1.42 F2.0; Cutting to new depth
N31 X9.15 Y57.5 F50.0
N32 Z10.0 F600.0
N33 X9.15 Y18.5 F600.0
N34 Z-1.329 
N35 Z-1.71 F2.0; Cutting to new depth
N36 X9.15 Y57.5 F50.0
N37 Z10.0 F600.0
N38 X9.15 Y18.5 F600.0
N39 Z-1.614 
N40 Z-1.99 F2.0; Cutting to new depth
N41 X9.15 Y57.5 F50.0
N42 Z10.0 F600.0
N43 X9.15 Y18.5 F600.0
N44 Z-1.9 
N45 Z-2.28 F2.0; Cutting to new depth
N46 X9.15 Y57.5 F50.0
N47 Z10.0 F600.0
( Cutting slot from (19, 56.45) to (23.7, 56.45) )
( Making 7.0 depth cut(s) at 0.286mm per cut )
N48 Z10.0 F600.0
N49 X19.0 Y56.45 F600.0
N50 Z0.1 
N51 Z-0.28 F2.0; Cutting to new depth
N52 X23.7 Y56.45 F50.0
N53 Z10.0 F600.0
N54 X19.0 Y56.45 F600.0
N55 Z-0.186 
N56 Z-0.57 F2.0; Cutting to new depth
N57 X23.7 Y56.45 F50.0
N58 Z10.0 F600.0
N59 X19.0 Y56.45 F600.0
N60 Z-0.471 
N61 Z-0.85 F2.0; Cutting to new depth
N62 X23.7 Y56.45 F50.0
N63 Z10.0 F600.0
N64 X19.0 Y56.45 F600.0
N65 Z-0.757 
N66 Z-1.14 F2.0; Cutting to new depth
N67 X23.7 Y56.45 F50.0
N68 Z10.0 F600.0
N69 X19.0 Y56.45 F600.0
N70 Z-1.043 
N71 Z-1.42 F2.0; Cutting to new depth
N72 X23.7 Y56.45 F50.0
N73 Z10.0 F600.0
N74 X19.0 Y56.45 F600.0
N75 Z-1.329 
N76 Z-1.71 F2.0; Cutting to new depth
N77 X23.7 Y56.45 F50.0
N78 Z10.0 F600.0
N79 X19.0 Y56.45 F600.0
N80 Z-1.614 
N81 Z-1.99 F2.0; Cutting to new depth
N82 X23.7 Y56.45 F50.0
N83 Z10.0 F600.0
N84 X19.0 Y56.45 F600.0
N85 Z-1.9 
N86 Z-2.28 F2.0; Cutting to new depth
N87 X23.7 Y56.45 F50.0
N88 Z10.0 F600.0
( Cutting slot from (43.55, 31.5) to (43.55, 54.5) )
( Making 7.0 depth cut(s) at 0.286mm per cut )
N89 Z10.0 F600.0
N90 X43.55 Y31.5 F600.0
N91 Z0.1 
N92 Z-0.28 F2.0; Cutting to new depth
N93 X43.55 Y54.5 F50.0
N94 Z10.0 F600.0
N95 X43.55 Y31.5 F600.0
N96 Z-0.186 
N97 Z-0.57 F2.0; Cutting to new depth
N98 X43.55 Y54.5 F50.0
N99 Z10.0 F600.0
N100 X43.55 Y31.5 F600.0
N101 Z-0.471 
N102 Z-0.85 F2.0; Cutting to new depth
N103 X43.55 Y54.5 F50.0
N104 Z10.0 F600.0
N105 X43.55 Y31.5 F600.0
N106 Z-0.757 
N107 Z-1.14 F2.0; Cutting to new depth
N108 X43.55 Y54.5 F50.0
N109 Z10.0 F600.0
N110 X43.55 Y31.5 F600.0
N111 Z-1.043 
N112 Z-1.42 F2.0; Cutting to new depth
N113 X43.55 Y54.5 F50.0
N114 Z10.0 F600.0
N115 X43.55 Y31.5 F600.0
N116 Z-1.329 
N117 Z-1.71 F2.0; Cutting to new depth
N118 X43.55 Y54.5 F50.0
N119 Z10.0 F600.0
N120 X43.55 Y31.5 F600.0
N121 Z-1.614 
N122 Z-1.99 F2.0; Cutting to new depth
N123 X43.55 Y54.5 F50.0
N124 Z10.0 F600.0
N125 X43.55 Y31.5 F600.0
N126 Z-1.9 
N127 Z-2.28 F2.0; Cutting to new depth
N128 X43.55 Y54.5 F50.0
N129 Z10.0 F600.0