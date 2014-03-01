//Maya ASCII 2014 scene
//Name: naginata_collider.ma
//Last modified: Fri, Feb 28, 2014 11:55:58 AM
//Codeset: 1252
requires maya "2014";
requires -nodeType "HIKSolverNode" -nodeType "HIKRetargeterNode" -nodeType "HIKCharacterNode"
		 -nodeType "HIKSkeletonGeneratorNode" -nodeType "HIKControlSetNode" -nodeType "HIKEffectorFromCharacter"
		 -nodeType "HIKSK2State" -nodeType "HIKFK2State" -nodeType "HIKState2FK" -nodeType "HIKState2SK"
		 -nodeType "HIKState2GlobalSK" -nodeType "HIKEffector2State" -nodeType "HIKState2Effector"
		 -nodeType "HIKProperty2State" -nodeType "HIKPinning2State" -nodeType "ComputeGlobal"
		 -nodeType "ComputeLocal" -nodeType "HIKCharacterStateClient" -dataType "HIKCharacter"
		 -dataType "HIKCharacterState" -dataType "HIKEffectorState" -dataType "HIKPropertySetState"
		 "mayaHIK" "1.0_HIK_2013.2";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201303010241-864206";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "education";
createNode transform -n "naginata_collider";
	setAttr ".t" -type "double3" 0 1.547243595123291 0 ;
	setAttr ".rp" -type "double3" 0 -1.547243595123291 0 ;
	setAttr ".sp" -type "double3" 0 -1.547243595123291 0 ;
createNode mesh -n "naginata_colliderShape" -p "naginata_collider";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25 0.625 0.61406314 0.875 0.13593692 0.125 0.13593692
		 0.375 0.61406314 0.375 0.13593692 0.625 0.13593692 0.375 0.5 0.625 0.5 0.625 0.61406314
		 0.375 0.61406314 0.625 0.5 0.375 0.5 0.375 0.61406314 0.625 0.61406314 0.625 0.5
		 0.375 0.5 0.375 0.61406314 0.625 0.61406314 0.625 0.5 0.375 0.5 0.375 0.61406314
		 0.625 0.61406314 0.625 0.5 0.375 0.5 0.375 0.61406314 0.625 0.61406314;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 20 ".pt";
	setAttr ".pt[0]" -type "float3" 0 -0.79724354 0 ;
	setAttr ".pt[1]" -type "float3" 0 -0.79724354 0 ;
	setAttr ".pt[6]" -type "float3" 0 -0.79724354 0 ;
	setAttr ".pt[7]" -type "float3" 0 -0.79724354 0 ;
	setAttr ".pt[8]" -type "float3" 0 -1.0254227 0 ;
	setAttr ".pt[9]" -type "float3" 0 -1.0254227 0 ;
	setAttr ".pt[10]" -type "float3" 0 -1.0254227 0 ;
	setAttr ".pt[11]" -type "float3" 0 -1.0254227 0 ;
	setAttr ".pt[14]" -type "float3" 0 -0.84809393 0 ;
	setAttr ".pt[15]" -type "float3" 0 -0.84809393 0 ;
	setAttr ".pt[18]" -type "float3" 0 -0.92014295 0 ;
	setAttr ".pt[19]" -type "float3" 0 -0.92014295 0 ;
	setAttr ".pt[22]" -type "float3" 0 -0.93186814 0 ;
	setAttr ".pt[23]" -type "float3" 0 -0.93186814 0 ;
	setAttr ".pt[26]" -type "float3" 0 -0.93228716 0 ;
	setAttr ".pt[27]" -type "float3" 0 -0.93228716 0 ;
	setAttr ".pt[28]" -type "float3" 0 0.055566326 0 ;
	setAttr ".pt[29]" -type "float3" 0 0.055566326 0 ;
	setAttr ".pt[30]" -type "float3" 0 -0.83764881 0 ;
	setAttr ".pt[31]" -type "float3" 0 -0.83764881 0 ;
	setAttr -s 32 ".vt[0:31]"  -0.0625 -0.75 0.0625 0.0625 -0.75 0.0625
		 -0.0625 0.75 0.0625 0.0625 0.75 0.0625 -0.0625 0.75 -0.0625 0.0625 0.75 -0.0625 -0.0625 -0.75 -0.0625
		 0.0625 -0.75 -0.0625 0.0625 0.065621376 -0.0625 -0.0625 0.065621376 -0.0625 -0.0625 0.065621376 0.0625
		 0.0625 0.065621376 0.0625 -0.0625 -0.33131099 -2.00827384 0.0625 -0.33131099 -2.00827384
		 0.0625 -0.43534017 -2.00827384 -0.0625 -0.43534017 -2.00827384 0.0625 0.6658777 -0.44227412
		 -0.0625 0.6658777 -0.44227412 -0.0625 0.094771117 -0.44227412 0.0625 0.094771117 -0.44227412
		 0.0625 0.48387137 -0.94019508 -0.0625 0.48387137 -0.94019508 -0.0625 0.061275445 -0.94019508
		 0.0625 0.061275445 -0.94019508 0.0625 0.25409991 -1.35555589 -0.0625 0.25409991 -1.35555589
		 -0.0625 -0.044609889 -1.35555589 0.0625 -0.044609889 -1.35555589 0.0625 -0.066474184 -1.71298766
		 -0.0625 -0.066474184 -1.71298766 -0.0625 -0.25857586 -1.71298766 0.0625 -0.25857586 -1.71298766;
	setAttr -s 60 ".ed[0:59]"  0 1 0 2 3 0 4 5 1 6 7 0 0 10 0 1 11 0 2 4 0
		 3 5 0 4 9 1 5 8 1 6 0 0 7 1 0 8 7 0 9 6 0 8 9 0 10 2 0 9 10 1 11 3 0 10 11 1 11 8 1
		 4 17 0 5 16 0 12 13 0 8 19 0 13 14 0 9 18 0 14 15 0 12 15 0 16 20 0 17 21 0 16 17 1
		 18 22 0 17 18 1 19 23 0 18 19 1 19 16 1 20 24 0 21 25 0 20 21 1 22 26 0 21 22 1 23 27 0
		 22 23 1 23 20 1 24 28 0 25 29 0 24 25 1 26 30 0 25 26 1 27 31 0 26 27 1 27 24 1 28 13 0
		 29 12 0 28 29 1 30 15 0 29 30 1 31 14 0 30 31 1 31 28 1;
	setAttr -s 30 -ch 120 ".fc[0:29]" -type "polyFaces" 
		f 4 18 17 -2 -16
		mu 0 4 18 19 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 22 24 26 -28
		mu 0 4 20 21 22 23
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 19 -10 -8 -18
		mu 0 4 19 15 11 3
		f 4 16 15 6 8
		mu 0 4 16 18 2 13
		f 4 -15 12 -4 -14
		mu 0 4 17 14 7 6
		f 4 10 4 -17 13
		mu 0 4 12 0 18 16
		f 4 0 5 -19 -5
		mu 0 4 0 1 19 18
		f 4 -12 -13 -20 -6
		mu 0 4 1 10 15 19
		f 4 2 21 30 -21
		mu 0 4 4 5 24 25
		f 4 9 23 35 -22
		mu 0 4 5 14 27 24
		f 4 14 25 34 -24
		mu 0 4 14 17 26 27
		f 4 -9 20 32 -26
		mu 0 4 17 4 25 26
		f 4 -31 28 38 -30
		mu 0 4 25 24 28 29
		f 4 -33 29 40 -32
		mu 0 4 26 25 29 30
		f 4 -35 31 42 -34
		mu 0 4 27 26 30 31
		f 4 -36 33 43 -29
		mu 0 4 24 27 31 28
		f 4 -39 36 46 -38
		mu 0 4 29 28 32 33
		f 4 -41 37 48 -40
		mu 0 4 30 29 33 34
		f 4 -43 39 50 -42
		mu 0 4 31 30 34 35
		f 4 -44 41 51 -37
		mu 0 4 28 31 35 32
		f 4 -47 44 54 -46
		mu 0 4 33 32 36 37
		f 4 -49 45 56 -48
		mu 0 4 34 33 37 38
		f 4 -51 47 58 -50
		mu 0 4 35 34 38 39
		f 4 -52 49 59 -45
		mu 0 4 32 35 39 36
		f 4 -55 52 -23 -54
		mu 0 4 37 36 21 20
		f 4 -57 53 27 -56
		mu 0 4 38 37 20 23
		f 4 -59 55 -27 -58
		mu 0 4 39 38 23 22
		f 4 -60 57 -25 -53
		mu 0 4 36 39 22 21;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
select -ne :time1;
	setAttr ".o" -5;
	setAttr ".unw" -5;
select -ne :renderPartition;
	setAttr -s 4 ".st";
select -ne :initialShadingGroup;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "naginata_colliderShape.iog" ":initialShadingGroup.dsm" -na;
// End of naginata_collider.ma
