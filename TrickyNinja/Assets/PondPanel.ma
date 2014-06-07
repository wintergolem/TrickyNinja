//Maya ASCII 2014 scene
//Name: PondPanel.ma
//Last modified: Sun, Jun 01, 2014 05:05:32 PM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -n "pPlane5";
	setAttr ".t" -type "double3" 116.59278045640191 -77.384890100832962 6.960881819438935 ;
	setAttr ".r" -type "double3" 0 -101.76182395352545 0 ;
	setAttr ".s" -type "double3" 4.3761084786490656 2.8024684040060412 2.8024684040060412 ;
createNode mesh -n "pPlaneShape5" -p "pPlane5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".ccls" -type "string" "colorSet1";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".db" yes;
createNode mesh -n "polySurfaceShape2" -p "pPlane5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0.0019920319 0.0019920063
		 0.25099605 0.0019920063 0.25099605 0.33399737 0.0019920319 0.33399737 0.5 0.0019920063
		 0.5 0.33399737 0.25099605 0.66600263 0.0019920319 0.66600263 0.74900401 0.0019920063
		 0.74900401 0.33399737 0.5 0.66600263 0.25099605 0.99800795 0.0019920319 0.99800795
		 0.99800795 0.0019920063 0.99800795 0.33399737 0.74900401 0.66600263 0.5 0.99800795
		 0.99800795 0.66600263 0.74900401 0.99800795 0.99800795 0.99800795;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".ccls" -type "string" "colorSet1";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr -s 48 ".clst[0].clsp[0:47]"  1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1
		 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0
		 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 1
		 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0
		 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1
		 0 1 0 1 0 1 0 1 0 1 0 1;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 11 ".pt";
	setAttr ".pt[5]" -type "float3" 0 0 3.8042269 ;
	setAttr ".pt[6]" -type "float3" 0 0 -1.0392047 ;
	setAttr ".pt[7]" -type "float3" 0 0 -3.1049392 ;
	setAttr ".pt[8]" -type "float3" 0 0 -1.1403496 ;
	setAttr ".pt[9]" -type "float3" 0 0 3.8042269 ;
	setAttr ".pt[10]" -type "float3" 0 0 2.6330309 ;
	setAttr ".pt[11]" -type "float3" 0 0 -1.2265617 ;
	setAttr ".pt[12]" -type "float3" 0 0 -3.2922955 ;
	setAttr ".pt[13]" -type "float3" 0 0 -1.3277053 ;
	setAttr ".pt[14]" -type "float3" 0 0 2.6330309 ;
	setAttr -s 20 ".vt[0:19]"  -9.62429523 -2.1370228e-015 9.62429523 -4.81214714 -2.1370228e-015 9.62429523
		 0 -2.1370228e-015 9.62429523 4.81214809 -2.1370228e-015 9.62429523 9.62429523 -2.1370228e-015 9.62429523
		 -9.62429523 -7.1234094e-016 3.20809841 -4.81214714 -7.1234094e-016 3.20809841 0 -7.1234094e-016 3.20809841
		 4.81214809 -7.1234094e-016 3.20809841 9.62429523 -7.1234094e-016 3.20809841 -9.62429523 7.1234094e-016 -3.20809841
		 -4.81214714 7.1234094e-016 -3.20809841 0 7.1234094e-016 -3.20809841 4.81214809 7.1234094e-016 -3.20809841
		 9.62429523 7.1234094e-016 -3.20809841 -9.62429523 2.1370228e-015 -9.62429523 -4.81214714 2.1370228e-015 -9.62429523
		 0 2.1370228e-015 -9.62429523 4.81214809 2.1370228e-015 -9.62429523 9.62429523 2.1370228e-015 -9.62429523;
	setAttr -s 31 ".ed[0:30]"  0 1 0 0 5 0 1 2 0 1 6 1 2 3 0 2 7 1 3 4 0
		 3 8 1 4 9 0 5 6 1 5 10 0 6 7 1 6 11 1 7 8 1 7 12 1 8 9 1 8 13 1 9 14 0 10 11 1 10 15 0
		 11 12 1 11 16 1 12 13 1 12 17 1 13 14 1 13 18 1 14 19 0 15 16 0 16 17 0 17 18 0 18 19 0;
	setAttr -s 12 -ch 48 ".fc[0:11]" -type "polyFaces" 
		f 4 0 3 -10 -2
		mu 0 4 0 1 2 3
		mc 0 4 0 1 10 8
		f 4 2 5 -12 -4
		mu 0 4 1 4 5 2
		mc 0 4 2 3 14 11
		f 4 4 7 -14 -6
		mu 0 4 4 8 9 5
		mc 0 4 4 5 18 15
		f 4 6 8 -16 -8
		mu 0 4 8 13 14 9
		mc 0 4 6 7 22 19
		f 4 9 12 -19 -11
		mu 0 4 3 2 6 7
		mc 0 4 9 12 26 24
		f 4 11 14 -21 -13
		mu 0 4 2 5 10 6
		mc 0 4 13 16 30 27
		f 4 13 16 -23 -15
		mu 0 4 5 9 15 10
		mc 0 4 17 20 34 31
		f 4 15 17 -25 -17
		mu 0 4 9 14 17 15
		mc 0 4 21 23 38 35
		f 4 18 21 -28 -20
		mu 0 4 7 6 11 12
		mc 0 4 25 28 41 40
		f 4 20 23 -29 -22
		mu 0 4 6 10 16 11
		mc 0 4 29 32 43 42
		f 4 22 25 -30 -24
		mu 0 4 10 15 18 16
		mc 0 4 33 36 45 44
		f 4 24 26 -31 -26
		mu 0 4 15 17 19 18
		mc 0 4 37 39 47 46;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".db" yes;
createNode polyAutoProj -n "polyAutoProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -52.217599260973984 0 1.0176445455493806 1;
	setAttr ".s" -type "double3" 19.248590469360352 19.248590469360352 19.248590469360352 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode polyAutoProj -n "polyAutoProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -52.217599260973984 0 1.0176445455493806 1;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -52.217599260973984 0 1.0176445455493806 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -52.217594146728516 3.7252902984619141e-009 1.0176445245742798 ;
	setAttr ".ro" -type "double3" 95.061647367785085 -1.8000003480317437 -179.99999538705725 ;
	setAttr ".ps" -type "double2" 19.843705402936948 19.766321686957614 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 7 ".st";
select -ne :initialShadingGroup;
	setAttr -s 21 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 18 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 7 ".s";
select -ne :defaultTextureList1;
	setAttr -s 5 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 7 ".u";
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
connectAttr "polyAutoProj2.out" "pPlaneShape5.i";
connectAttr "polyAutoProj1.out" "polyAutoProj2.ip";
connectAttr "pPlaneShape5.wm" "polyAutoProj2.mp";
connectAttr "polyPlanarProj1.out" "polyAutoProj1.ip";
connectAttr "pPlaneShape5.wm" "polyAutoProj1.mp";
connectAttr "polySurfaceShape2.o" "polyPlanarProj1.ip";
connectAttr "pPlaneShape5.wm" "polyPlanarProj1.mp";
connectAttr "pPlaneShape5.iog" ":initialShadingGroup.dsm" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"UV_test_1K_map\" \"fileTextureName\" \"C:\\\\Users\\\\pryan\\\\Box Sync\\\\UV test maps\\\\ash_uvgrid08.jpg\" 3084795623 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08.jpg\" \"sourceImages\"\n1\n\"file1\" \"fileTextureName\" \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" 2480704162 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of PondPanel.ma
