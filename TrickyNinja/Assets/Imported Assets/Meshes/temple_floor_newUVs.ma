//Maya ASCII 2014 scene
//Name: temple_floor_newUVs.ma
//Last modified: Wed, May 21, 2014 10:28:58 AM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -n "temple_UVs";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 
		0 -smx 0 -at "long";
	setAttr ".t" -type "double3" 9.8353328704833984 10.707427024841309 -11.137324333190918 ;
	setAttr ".spt" -type "double3" 0 1.7763568394002505e-015 0 ;
	setAttr -k on ".MaxHandle" 1;
createNode transform -n "templeFloor" -p "temple_UVs";
	addAttr -is true -ci true -k true -sn "UDP3DSMAX" -ln "UDP3DSMAX" -dt "string";
	addAttr -is true -ci true -h true -k true -sn "MaxHandle" -ln "MaxHandle" -smn 0 
		-smx 0 -at "long";
	setAttr ".rp" -type "double3" -24.740016937255859 -7.4574251174926758 15.137327194213867 ;
	setAttr ".sp" -type "double3" -24.740016937255859 -7.4574251174926758 15.137327194213867 ;
	setAttr -k on ".UDP3DSMAX" -type "string" "MapChannel:1 = map1&cr;&lf;";
	setAttr -k on ".MaxHandle" 16;
createNode mesh -n "templeFloorShape" -p "templeFloor";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.39134171919718236 0.74684271216392517 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
createNode mesh -n "polySurfaceShape69" -p "templeFloor";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" -0.74986293911933899 0.50665030907839537 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 22 ".uvst[0].uvsp[0:21]" -type "float2" -0.75009179 0.48340756
		 -0.75009173 0.027480533 -0.74775851 0.027480518 -0.74775851 0.48340756 -0.95053148
		 0.48583829 -0.95053279 0.48350525 -0.71597391 0.027495999 -0.71597391 0.48342294
		 -0.54731762 0.027578151 -0.54731762 0.48350519 -0.95286578 0.48350525 -0.95286578
		 0.027578151 -0.95053267 0.027578181 -0.95053375 0.025245031 -0.78187633 0.48342288
		 -0.78187639 0.027495971 -0.78187531 0.4857561 -0.75009066 0.4857406 -0.75009173 0.48340744
		 -0.75009298 0.02514728 -0.75009179 0.027480459 -0.78187752 0.025162764;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 12 ".vt[0:11]"  -36.79020309 -7.45742512 15.13732719 38.56594849 -7.45742512 15.13732719
		 -36.79020309 -7.071797371 15.13732719 38.56594849 -7.071797371 15.13732719 -36.80634308 -7.071797371 -17.99178886
		 38.5498085 -7.071797371 -17.99178886 -36.80634308 -7.45742512 -17.99178886 38.5498085 -7.45742512 -17.99178886
		 38.56338882 -7.071797371 9.88392258 -36.79276276 -7.071797371 9.88392258 -36.79276276 -7.45742512 9.88392353
		 38.56338882 -7.45742512 9.88392353;
	setAttr -s 20 ".ed[0:19]"  0 1 0 1 3 0 3 2 0 2 0 0 3 8 0 8 9 0 9 2 0
		 4 5 0 5 7 0 7 6 0 6 4 0 10 11 0 11 1 0 0 10 0 11 8 0 9 10 0 8 5 0 4 9 0 6 10 0 7 11 0;
	setAttr -s 40 ".n[0:39]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 1.1751032e-009 0 0.99999994 1.1751031e-009 0 1 3.1307701e-010 0 1 3.1290742e-010
		 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 3.1290742e-010 0 -1 3.1307704e-010 0 -1 1.1751036e-009
		 0 -1 1.1751036e-009 0.99999982 -1.5064028e-005 -0.00048723866 0.99999988 -2.3887608e-006
		 -0.00048718418 0.99999988 -2.3887544e-006 -0.00048718421 0.99999982 -1.5064028e-005
		 -0.00048723866 -0.99999988 -1.1468868e-006 0.00048718418 -0.99999982 -7.2325092e-006
		 0.00048723866 -0.99999982 -7.2325092e-006 0.00048723866 -0.99999988 -1.1468836e-006
		 0.00048718421 0 1 3.1290742e-010 0 1 3.1307701e-010 0 1 1.5052033e-010 0 1 1.5052036e-010
		 -0.99999988 0 0.00048717397 -0.99999988 -1.1468868e-006 0.00048718418 -0.99999988
		 -1.1468836e-006 0.00048718421 -0.99999988 0 0.00048717397 0 -1 1.5052036e-010 0 -1
		 1.5052033e-010 0 -1 3.1307704e-010 0 -1 3.1290742e-010 0.99999988 -2.3887544e-006
		 -0.00048718421 0.99999988 -2.3887608e-006 -0.00048718418 0.99999988 0 -0.00048717397
		 0.99999988 0 -0.00048717397;
	setAttr -s 10 -ch 40 ".fc[0:9]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 -3 4 5 6
		mu 0 4 3 2 6 7
		f 4 7 8 9 10
		mu 0 4 10 11 12 5
		f 4 11 12 -1 13
		mu 0 4 14 15 1 0
		f 4 -13 14 -5 -2
		mu 0 4 20 15 21 19
		f 4 -14 -4 -7 15
		mu 0 4 14 18 17 16
		f 4 -6 16 -8 17
		mu 0 4 7 6 8 9
		f 4 18 -16 -18 -11
		mu 0 4 5 14 16 4
		f 4 -10 19 -12 -19
		mu 0 4 5 12 15 14
		f 4 -15 -20 -9 -17
		mu 0 4 21 15 12 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode polyTweakUV -n "polyTweakUV10";
	setAttr ".uopa" yes;
	setAttr -s 32 ".uvtk";
	setAttr ".uvtk[0]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[2]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[3]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[4]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[6]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[7]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[8]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[10]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[11]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[12]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[13]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[14]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[17]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[18]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[19]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[20]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[22]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[24]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[25]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[27]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[28]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[29]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[33]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[35]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[36]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[37]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[38]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[39]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[43]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[45]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[46]" -type "float2" 1.0003427 0 ;
	setAttr ".uvtk[47]" -type "float2" 1.0003427 0 ;
createNode polySplitRing -n "polySplitRing3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[0]" "e[7]" "e[11]" "e[22]" "e[28]" "e[33]" "e[35]" "e[41]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 9.8353328704833984 10.70742702484131 -11.137324333190918 1;
	setAttr ".wt" 0.96183192729949951;
	setAttr ".dr" no;
	setAttr ".re" 28;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 5;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "polySplitRing2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 8 "e[0]" "e[2]" "e[5]" "e[7]" "e[9]" "e[11]" "e[22]" "e[26]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 9.8353328704833984 10.70742702484131 -11.137324333190918 1;
	setAttr ".wt" 0.037144113332033157;
	setAttr ".re" 2;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 5;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweakUV -n "polyTweakUV9";
	setAttr ".uopa" yes;
	setAttr -s 28 ".uvtk[0:27]" -type "float2" 0.038537171 0.49134991 0.7408613
		 -0.017987268 0.038537171 0.49134991 0.038537171 0.49134991 0.03853726 0.49134991
		 0.93993789 -0.4709076 0.03853723 0.49134991 0.038537171 0.49134991 0.03853726 0.49134994
		 0.77242953 -0.47082576 0.03853723 0.49134991 0.038537171 0.49134991 0.03853726 0.49134991
		 0.03853726 0.49134988 0.038537171 0.49134988 0.77242959 -0.018002616 0.83722138 -0.47085741
		 0.038537171 0.49134994 0.03853723 0.49134991 0.03853726 0.49134994 0.038537171 0.49134991
		 0.93993777 -0.01808426 0.038537171 0.49134991 0.83722138 -0.018034177 0.038537171
		 0.49134994 0.03853726 0.49134988 0.74086136 -0.47081056 0.03853723 0.49134994;
createNode polyMapCut -n "polyMapCut18";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[0]";
createNode polyMapSewMove -n "polyMapSewMove46";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6]" "e[17]" "e[20]";
createNode polyMapSewMove -n "polyMapSewMove45";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[7]";
createNode polyMapSewMove -n "polyMapSewMove44";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[4]" "e[16]" "e[21]";
createNode polyMapCut -n "polyMapCut17";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 5 "e[9]" "e[12:13]" "e[18:19]" "e[23]" "e[25]";
createNode polySplitRing -n "polySplitRing1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[16:19]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 9.8353328704833984 10.70742702484131 -11.137324333190918 1;
	setAttr ".wt" 0.61320209503173828;
	setAttr ".dr" no;
	setAttr ".re" 17;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 5;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode materialInfo -n "materialInfo8";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "temple_exterior";
createNode file -n "file4";
	setAttr ".ftn" -type "string" "C:/Users/Patrick/Box Sync/temple_exterior_d.tga";
createNode place2dTexture -n "place2dTexture5";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 7 ".lnk";
	setAttr -s 7 ".slnk";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 7 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
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
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "polyTweakUV10.out" "templeFloorShape.i";
connectAttr "polyTweakUV10.uvtk[0]" "templeFloorShape.uvst[0].uvtw";
connectAttr "polySplitRing3.out" "polyTweakUV10.ip";
connectAttr "polySplitRing2.out" "polySplitRing3.ip";
connectAttr "templeFloorShape.wm" "polySplitRing3.mp";
connectAttr "polyTweakUV9.out" "polySplitRing2.ip";
connectAttr "templeFloorShape.wm" "polySplitRing2.mp";
connectAttr "polyMapCut18.out" "polyTweakUV9.ip";
connectAttr "polyMapSewMove46.out" "polyMapCut18.ip";
connectAttr "polyMapSewMove45.out" "polyMapSewMove46.ip";
connectAttr "polyMapSewMove44.out" "polyMapSewMove45.ip";
connectAttr "polyMapCut17.out" "polyMapSewMove44.ip";
connectAttr "polySplitRing1.out" "polyMapCut17.ip";
connectAttr "polySurfaceShape69.o" "polySplitRing1.ip";
connectAttr "templeFloorShape.wm" "polySplitRing1.mp";
connectAttr "lambert4SG.msg" "materialInfo8.sg";
connectAttr "temple_exterior.msg" "materialInfo8.m";
connectAttr "file4.msg" "materialInfo8.t" -na;
connectAttr "temple_exterior.oc" "lambert4SG.ss";
connectAttr "roof_side_3Shape.iog" "lambert4SG.dsm" -na;
connectAttr "wall_top_2Shape.iog" "lambert4SG.dsm" -na;
connectAttr "templeFloorShape.iog" "lambert4SG.dsm" -na;
connectAttr "roofShape.iog" "lambert4SG.dsm" -na;
connectAttr "wall_top_3Shape.iog" "lambert4SG.dsm" -na;
connectAttr "roof_side_1Shape.iog" "lambert4SG.dsm" -na;
connectAttr "roof_front_1Shape.iog" "lambert4SG.dsm" -na;
connectAttr "temple_baseShape.iog" "lambert4SG.dsm" -na;
connectAttr "file4.oc" "temple_exterior.c";
connectAttr "place2dTexture5.c" "file4.c";
connectAttr "place2dTexture5.tf" "file4.tf";
connectAttr "place2dTexture5.rf" "file4.rf";
connectAttr "place2dTexture5.mu" "file4.mu";
connectAttr "place2dTexture5.mv" "file4.mv";
connectAttr "place2dTexture5.s" "file4.s";
connectAttr "place2dTexture5.wu" "file4.wu";
connectAttr "place2dTexture5.wv" "file4.wv";
connectAttr "place2dTexture5.re" "file4.re";
connectAttr "place2dTexture5.of" "file4.of";
connectAttr "place2dTexture5.r" "file4.ro";
connectAttr "place2dTexture5.n" "file4.n";
connectAttr "place2dTexture5.vt1" "file4.vt1";
connectAttr "place2dTexture5.vt2" "file4.vt2";
connectAttr "place2dTexture5.vt3" "file4.vt3";
connectAttr "place2dTexture5.vc1" "file4.vc1";
connectAttr "place2dTexture5.o" "file4.uv";
connectAttr "place2dTexture5.ofs" "file4.fs";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "temple_exterior.msg" ":defaultShaderList1.s" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"UV_test_1K_map\" \"fileTextureName\" \"C:\\\\Users\\\\pryan\\\\Box Sync\\\\UV test maps\\\\ash_uvgrid08.jpg\" 3084795623 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08.jpg\" \"sourceImages\"\n1\n\"file1\" \"fileTextureName\" \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" 2480704162 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of temple_floor_newUVs.ma
