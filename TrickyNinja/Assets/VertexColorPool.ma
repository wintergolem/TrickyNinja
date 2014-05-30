//Maya ASCII 2014 scene
//Name: VertexColorPool.ma
//Last modified: Fri, May 30, 2014 11:44:09 AM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "education";
createNode transform -n "massout_level_20140410:river";
	setAttr ".t" -type "double3" 101.562755593294 -77.671194127747782 -126.09872442357658 ;
	setAttr ".s" -type "double3" 1.2910798665500562 1 3.3580419932954082 ;
createNode mesh -n "massout_level_20140410:riverShape" -p "massout_level_20140410:river";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 12 ".uvst[0].uvsp[0:11]" -type "float2" 0 0 0.74761981 0
		 0 1 0.74761981 1 0 0.15046331 0.74761981 0.14280534 0.39801893 0 0.20701663 1 0.37000394
		 0.14667331 0 0.32915151 0.74761975 0.31969625 0.33596176 0.32490253;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".ccls" -type "string" "colorSet1";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr -s 24 ".clst[0].clsp[0:23]"  0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1
		 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 1 0.1176 0.1176 1
		 1 0.1176 0.1176 1 1 0.1176 0.1176 1 1 0.1176 0.1176 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0
		 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 12 ".vt[0:11]"  -41.7118988 0 55.79293442 41.7118988 0 55.79293442
		 -41.7118988 0 -55.79293442 41.7118988 0 -55.79293442 -41.7118988 0 39.0033493042
		 41.7118988 -7.6293945e-006 39.85787201 2.70139313 0 55.79293442 -18.61177063 0 -55.79293442
		 -0.42469025 -7.6293945e-006 39.42626572 -41.7118988 0 19.064273834 41.7118988 -7.6293945e-006 20.11934662
		 -4.22331238 -7.6293945e-006 19.53840065;
	setAttr -s 17 ".ed[0:16]"  0 6 0 0 4 0 1 5 0 2 7 0 4 9 0 5 10 0 5 8 1
		 6 1 0 7 3 0 8 4 1 6 8 1 8 11 1 9 2 0 10 3 0 11 7 1 11 9 1 11 10 1;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 10 9 -2
		mu 0 4 0 6 8 4
		mc 0 4 0 8 12 4
		f 4 -10 11 15 -5
		mu 0 4 4 8 11 9
		mc 0 4 5 13 18 16
		f 4 -11 7 2 6
		mu 0 4 8 6 1 5
		mc 0 4 14 9 1 6
		f 4 -15 16 13 -9
		mu 0 4 7 11 10 3
		mc 0 4 11 19 17 3
		f 4 -16 14 -4 -13
		mu 0 4 9 11 7 2
		mc 0 4 20 21 10 2
		f 4 -17 -12 -7 5
		mu 0 4 10 11 8 5
		mc 0 4 22 23 15 7;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode displayLayer -n "layer3";
	setAttr ".do" 3;
createNode displayLayerManager -n "layerManager";
	setAttr -s 5 ".dli[1:4]"  1 2 0 3;
	setAttr -s 4 ".dli";
createNode materialInfo -n "massout_level_20140410:materialInfo17";
createNode shadingEngine -n "massout_level_20140410:lambert16SG";
	setAttr ".ihi" 0;
	setAttr -s 124 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 8 ".gn";
createNode lambert -n "massout_level_20140410:whitebox";
	setAttr ".c" -type "float3" 1 1 1 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 46 ".lnk";
	setAttr -s 46 ".slnk";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 46 ".st";
select -ne :initialShadingGroup;
	setAttr -s 11 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 10 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 45 ".s";
select -ne :defaultTextureList1;
	setAttr -s 18 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 27 ".u";
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "layer3.di" "massout_level_20140410:river.do";
connectAttr "layerManager.dli[4]" "layer3.id";
connectAttr "massout_level_20140410:lambert16SG.msg" "massout_level_20140410:materialInfo17.sg"
		;
connectAttr "massout_level_20140410:whitebox.msg" "massout_level_20140410:materialInfo17.m"
		;
connectAttr "massout_level_20140410:whitebox.oc" "massout_level_20140410:lambert16SG.ss"
		;
connectAttr "massout_level_20140410:pCubeShape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:waterfall_UVs1:Group1Shape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:cave1Shape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:riverShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape10.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape6.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape5.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape9.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape7.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_Shape8.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_5Shape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape6.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape10.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape9.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape8.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape7.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:peg_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:main_lower_crossbarShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_crossbar_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_crossbar_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_crossbar_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_crossbar_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:roof_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:roof_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:main_beam_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:cap_beam_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:subroof_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:roof_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:main_beam_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:sign_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:sign_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:main_pillar_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:main_pillar_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_cap_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_cap_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_pillar_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_pillar_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_pillar_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:torii:side_pillar_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:wallTag_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:wallTag_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:wallTag_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:small_shrine_spireShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:small_shrine_spire_baseShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:small_shrine_baseShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_joistsShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_pillarsShape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape5.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape12.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape11.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape13.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape14.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape5.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape6.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape9.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape10.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape8.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape7.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_post_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_post_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_post_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_post_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_rail_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_rail_1Shape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_support_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_support_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:railbase_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape5.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape12.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape11.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape13.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape14.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape3.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape5.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape6.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape9.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape10.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape8.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:stud_Shape7.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_support_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_post_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_post_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_cap_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_cap_Shape2.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:tall_post_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:short_post_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:top_rail_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_rail_1Shape.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_support_Shape4.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:mid_support_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "|massout_level_20140410:bridge2:railbase_Shape1.iog" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_edge_Shape1.iog.og[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_edge_Shape1.ciog.cog[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_edge_Shape2.iog.og[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:bridge2:bridge_edge_Shape2.ciog.cog[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:islandShape.iog.og[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:islandShape.ciog.cog[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:cave_floorShape1.iog.og[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:cave_floorShape1.ciog.cog[0]" "massout_level_20140410:lambert16SG.dsm"
		 -na;
connectAttr "massout_level_20140410:groupId141.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId142.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId144.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId145.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId147.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId148.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId150.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId151.msg" "massout_level_20140410:lambert16SG.gn"
		 -na;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "massout_level_20140410:lambert16SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "massout_level_20140410:lambert16SG.message" ":defaultLightSet.message";
connectAttr "massout_level_20140410:lambert16SG.pa" ":renderPartition.st" -na;
connectAttr "massout_level_20140410:whitebox.msg" ":defaultShaderList1.s" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"UV_test_1K_map\" \"fileTextureName\" \"C:\\\\Users\\\\pryan\\\\Box Sync\\\\UV test maps\\\\ash_uvgrid08.jpg\" 3084795623 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08.jpg\" \"sourceImages\"\n1\n\"file1\" \"fileTextureName\" \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" 2480704162 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of VertexColorPool.ma
