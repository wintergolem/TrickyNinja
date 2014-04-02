//Maya ASCII 2014 scene
//Name: naginata.ma
//Last modified: Thu, Mar 27, 2014 03:00:27 PM
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
createNode transform -n "naginata";
	setAttr ".sp" -type "double3" 2.3245294578089205e-016 3.4954678040932668e-016 -1.4432899320127035e-015 ;
createNode mesh -n "naginataShape" -p "naginata";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".db" yes;
createNode transformGeometry -n "transformGeometry3";
	setAttr ".txf" -type "matrix" 2.2204460492503131e-016 -1 0 0 1 2.2204460492503131e-016 0 0
		 0 0 1 0 0 0 0 1;
createNode transformGeometry -n "transformGeometry2";
	setAttr ".txf" -type "matrix" 0.77499082327937618 0 0 0 0 8.1606178863414489e-016 3.6752155672040354 0
		 0 -0.77499082327937618 1.7208253117559384e-016 0 -0.0074532831889960434 -0.0080103442577203095 0.95278582701732883 1;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 22 ".tk";
	setAttr ".tk[33]" -type "float3" -5.5511151e-017 0.016835039 0.10121761 ;
	setAttr ".tk[41]" -type "float3" 5.5511151e-017 0.11335859 0 ;
	setAttr ".tk[42]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[43]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[44]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[45]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[46]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[47]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[48]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[49]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[50]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[51]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[52]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[53]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[54]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[55]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[56]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[57]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[58]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[59]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[60]" -type "float3" 0 -0.017469058 0 ;
	setAttr ".tk[61]" -type "float3" 0 -0.017469058 0 ;
createNode polySplitRing -n "polySplitRing1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[40:59]";
	setAttr ".ix" -type "matrix" 0.76601781331986174 -0.063224512573378133 0.099147097051611011 0
		 -0.53298423403684525 -0.95545978529032805 3.5085942869445588 0 -0.03458248835330463 -0.74566770655461723 -0.20831346348259872 0
		 -0.21126381171136788 0.92130596499049044 0.34992605111617248 1;
	setAttr ".wt" 0.96798115968704224;
	setAttr ".dr" no;
	setAttr ".re" 49;
	setAttr ".sma" 29.999999999999996;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyCylinder -n "polyCylinder1";
	setAttr ".r" 0.032977774573010342;
	setAttr ".h" 0.70240874709430856;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
select -ne :time1;
	setAttr ".o" -5;
	setAttr ".unw" -5;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :initialShadingGroup;
	setAttr -s 6 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 2 ".s";
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
connectAttr "transformGeometry3.og" "naginataShape.i";
connectAttr "transformGeometry2.og" "transformGeometry3.ig";
connectAttr "polyTweak1.out" "transformGeometry2.ig";
connectAttr "polySplitRing1.out" "polyTweak1.ip";
connectAttr "polyCylinder1.out" "polySplitRing1.ip";
connectAttr "naginataShape.wm" "polySplitRing1.mp";
connectAttr "naginataShape.iog" ":initialShadingGroup.dsm" -na;
// End of naginata.ma
