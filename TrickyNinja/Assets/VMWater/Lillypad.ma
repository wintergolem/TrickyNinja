//Maya ASCII 2014 scene
//Name: Lillypad.ma
//Last modified: Fri, May 30, 2014 01:02:56 PM
//Codeset: 1252
requires maya "2014";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014";
fileInfo "cutIdentifier" "201307170459-880822";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "education";
createNode transform -n "massout_level_20140410:polySurface4";
	setAttr ".rp" -type "double3" -165.7535400390625 -74.152290344238281 21.43213939666748 ;
	setAttr ".sp" -type "double3" -165.7535400390625 -74.152290344238281 21.43213939666748 ;
createNode mesh -n "massout_level_20140410:polySurfaceShape15" -p "massout_level_20140410:polySurface4";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:29]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000001490116119 0.50000001490116119 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 44 ".uvst[0].uvsp[0:43]" -type "float2" 0.81419128 0.26018503
		 0.86291039 0.34415168 0.7306779 0.33629084 0.75968301 0.21301991 0.6437515 0.30288237
		 0.70730197 0.1777916 0.56094331 0.26161233 0.60676485 0.11166945 0.88833058 0.45956174
		 0.70573175 0.4517009 0.63104737 0.4517009 0.5 0.4517009 0.85231566 0.62213695 0.67438018
		 0.64178944 0.61197329 0.64178944 0.5 0.64178944 0.82054335 0.69234765 0.65415663
		 0.80043387 0.60773659 0.80239964 0.5 0.82008636 0.74427682 0.78417516 0.68978047
		 0.83723533 0.60349989 0.87654036 0.5 0.88833058 0.18580872 0.26018503 0.24031699
		 0.21301991 0.2693221 0.33629084 0.13708964 0.34415168 0.29269207 0.1777916 0.35624257
		 0.30288237 0.39322925 0.11166945 0.43905079 0.26161233 0.29426232 0.4517009 0.11166945
		 0.45956174 0.36895266 0.4517009 0.32561982 0.64178944 0.14767843 0.62213695 0.38802671
		 0.64178944 0.34583747 0.80043387 0.17945665 0.69234765 0.39226341 0.80239964 0.31021956
		 0.83723533 0.25572318 0.78417516 0.39650011 0.87654036;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcol" yes;
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".ccls" -type "string" "colorSet1";
	setAttr ".clst[0].clsn" -type "string" "colorSet1";
	setAttr -s 120 ".clst[0].clsp[0:119]"  0 0.37099999 1 1 0 0.37099999 1
		 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999
		 1 1 0 0.37099999 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1
		 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1
		 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1
		 0 1 1 1 0 1 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999 1
		 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 0.37099999 1 1 0 0.37099999 1
		 1 0 0.37099999 1 1 0 0.37099999 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1
		 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1
		 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0
		 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1
		 1 1 0 1 1 1 0 1 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 0.37099999
		 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 0.37099999 1 1 0 0.37099999
		 1 1 0 0.37099999 1 1 0 0.37099999 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1
		 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1 0 1 1 1;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 44 ".vt[0:43]"  -165.75354004 -74.15229034 21.53377533 -165.75354004 -74.15229034 21.1337738
		 -165.75354004 -74.15229034 20.75858688 -165.75354004 -74.15229034 20.6149807 -165.14021301 -74.15229034 21.93677902
		 -165.24661255 -74.15229034 22.036027908 -165.34886169 -74.15229034 22.11015892 -165.54512024 -74.15229034 22.2492981
		 -165.04510498 -74.15229034 21.76008987 -165.30323792 -74.15229034 21.7766304 -165.47291565 -74.15229034 21.84693146
		 -165.63456726 -74.15229034 21.93377495 -164.9954834 -74.15229034 21.51723289 -165.35192871 -74.15229034 21.53377533
		 -165.49772644 -74.15229034 21.53377533 -165.06578064 -74.15229034 21.17512894 -165.41313171 -74.15229034 21.1337738
		 -165.53495789 -74.15229034 21.1337738 -165.12780762 -74.15229034 21.027385712 -165.4526062 -74.15229034 20.79994011
		 -165.54322815 -74.15229034 20.79580498 -165.27668762 -74.15229034 20.83415413 -165.3830719 -74.15229034 20.72249985
		 -165.55149841 -74.15229034 20.63979149 -166.36686707 -74.15229034 21.93677902 -166.26046753 -74.15229034 22.036027908
		 -166.15821838 -74.15229034 22.11015892 -165.96195984 -74.15229034 22.2492981 -166.4619751 -74.15229034 21.76008987
		 -166.20384216 -74.15229034 21.7766304 -166.034164429 -74.15229034 21.84693146 -165.87251282 -74.15229034 21.93377495
		 -166.51159668 -74.15229034 21.51723289 -166.15515137 -74.15229034 21.53377533 -166.0093536377 -74.15229034 21.53377533
		 -166.44129944 -74.15229034 21.17512894 -166.093948364 -74.15229034 21.1337738 -165.97212219 -74.15229034 21.1337738
		 -166.37927246 -74.15229034 21.027385712 -166.054473877 -74.15229034 20.79994011 -165.96385193 -74.15229034 20.79580498
		 -166.23039246 -74.15229034 20.83415413 -166.12400818 -74.15229034 20.72249985 -165.95558167 -74.15229034 20.63979149;
	setAttr -s 73 ".ed[0:72]"  0 1 0 1 2 0 2 3 0 4 5 0 4 8 0 5 6 0 5 9 1
		 6 7 0 6 10 1 7 11 0 8 9 1 8 12 0 9 10 1 9 13 1 10 11 1 10 14 1 11 0 0 12 13 1 12 15 0
		 13 14 1 13 16 1 14 0 1 14 17 1 15 16 1 15 18 0 16 17 1 16 19 1 17 1 1 17 20 1 18 19 1
		 18 21 0 19 20 1 19 22 1 20 2 1 20 23 1 21 22 0 22 23 0 23 3 0 24 25 0 24 28 0 25 26 0
		 25 29 1 26 27 0 26 30 1 27 31 0 28 29 1 28 32 0 29 30 1 29 33 1 30 31 1 30 34 1 31 0 0
		 32 33 1 32 35 0 33 34 1 33 36 1 34 0 1 34 37 1 35 36 1 35 38 0 36 37 1 36 39 1 37 1 1
		 37 40 1 38 39 1 38 41 0 39 40 1 39 42 1 40 2 1 40 43 1 41 42 0 42 43 0 43 3 0;
	setAttr -s 30 -ch 120 ".fc[0:29]" -type "polyFaces" 
		f 4 4 10 -7 -4
		mu 0 4 0 1 2 3
		mc 0 4 14 20 22 15
		f 4 6 12 -9 -6
		mu 0 4 3 2 4 5
		mc 0 4 16 23 26 17
		f 4 8 14 -10 -8
		mu 0 4 5 4 6 7
		mc 0 4 18 27 30 19
		f 4 11 17 -14 -11
		mu 0 4 1 8 9 2
		mc 0 4 21 32 34 24
		f 4 13 19 -16 -13
		mu 0 4 2 9 10 4
		mc 0 4 25 35 38 28
		f 4 15 21 -17 -15
		mu 0 4 4 10 11 6
		mc 0 4 29 39 0 31
		f 4 18 23 -21 -18
		mu 0 4 8 12 13 9
		mc 0 4 33 42 44 36
		f 4 20 25 -23 -20
		mu 0 4 9 13 14 10
		mc 0 4 37 45 48 40
		f 4 22 27 -1 -22
		mu 0 4 10 14 15 11
		mc 0 4 41 49 4 1
		f 4 24 29 -27 -24
		mu 0 4 12 16 17 13
		mc 0 4 43 52 54 46
		f 4 26 31 -29 -26
		mu 0 4 13 17 18 14
		mc 0 4 47 55 58 50
		f 4 28 33 -2 -28
		mu 0 4 14 18 19 15
		mc 0 4 51 59 8 5
		f 4 30 35 -33 -30
		mu 0 4 16 20 21 17
		mc 0 4 53 62 63 56
		f 4 32 36 -35 -32
		mu 0 4 17 21 22 18
		mc 0 4 57 64 65 60
		f 4 34 37 -3 -34
		mu 0 4 18 22 23 19
		mc 0 4 61 66 12 9
		f 4 38 41 -46 -40
		mu 0 4 24 25 26 27
		mc 0 4 67 68 75 73
		f 4 40 43 -48 -42
		mu 0 4 25 28 29 26
		mc 0 4 69 70 79 76
		f 4 42 44 -50 -44
		mu 0 4 28 30 31 29
		mc 0 4 71 72 83 80
		f 4 45 48 -53 -47
		mu 0 4 27 26 32 33
		mc 0 4 74 77 87 85
		f 4 47 50 -55 -49
		mu 0 4 26 29 34 32
		mc 0 4 78 81 91 88
		f 4 49 51 -57 -51
		mu 0 4 29 31 11 34
		mc 0 4 82 84 2 92
		f 4 52 55 -59 -54
		mu 0 4 33 32 35 36
		mc 0 4 86 89 97 95
		f 4 54 57 -61 -56
		mu 0 4 32 34 37 35
		mc 0 4 90 93 101 98
		f 4 56 0 -63 -58
		mu 0 4 34 11 15 37
		mc 0 4 94 3 6 102
		f 4 58 61 -65 -60
		mu 0 4 36 35 38 39
		mc 0 4 96 99 107 105
		f 4 60 63 -67 -62
		mu 0 4 35 37 40 38
		mc 0 4 100 103 111 108
		f 4 62 1 -69 -64
		mu 0 4 37 15 19 40
		mc 0 4 104 7 10 112
		f 4 64 67 -71 -66
		mu 0 4 39 38 41 42
		mc 0 4 106 109 116 115
		f 4 66 69 -72 -68
		mu 0 4 38 40 43 41
		mc 0 4 110 113 118 117
		f 4 68 2 -73 -70
		mu 0 4 40 19 23 43
		mc 0 4 114 11 13 119;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode groupId -n "massout_level_20140410:groupId159";
	setAttr ".ihi" 0;
createNode shadingEngine -n "massout_level_20140410:lambert22SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 2 ".gn";
createNode materialInfo -n "massout_level_20140410:materialInfo23";
createNode lambert -n "massout_level_20140410:lambert22";
createNode file -n "massout_level_20140410:file10";
	setAttr ".ftn" -type "string" "C:/Users/vinessam/Desktop/LillyTexture.tga";
createNode place2dTexture -n "massout_level_20140410:place2dTexture10";
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 51 ".lnk";
	setAttr -s 51 ".slnk";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 50 ".st";
select -ne :initialShadingGroup;
	setAttr -s 11 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 10 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 49 ".s";
select -ne :defaultTextureList1;
	setAttr -s 21 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 30 ".u";
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
connectAttr "massout_level_20140410:groupId159.id" "massout_level_20140410:polySurfaceShape15.iog.og[0].gid"
		;
connectAttr "massout_level_20140410:lambert22SG.mwc" "massout_level_20140410:polySurfaceShape15.iog.og[0].gco"
		;
connectAttr "massout_level_20140410:lambert22.oc" "massout_level_20140410:lambert22SG.ss"
		;
connectAttr "massout_level_20140410:polySurfaceShape2.iog.og[0]" "massout_level_20140410:lambert22SG.dsm"
		 -na;
connectAttr "massout_level_20140410:polySurfaceShape15.iog.og[0]" "massout_level_20140410:lambert22SG.dsm"
		 -na;
connectAttr "massout_level_20140410:groupId158.msg" "massout_level_20140410:lambert22SG.gn"
		 -na;
connectAttr "massout_level_20140410:groupId159.msg" "massout_level_20140410:lambert22SG.gn"
		 -na;
connectAttr "massout_level_20140410:lambert22SG.msg" "massout_level_20140410:materialInfo23.sg"
		;
connectAttr "massout_level_20140410:lambert22.msg" "massout_level_20140410:materialInfo23.m"
		;
connectAttr "massout_level_20140410:file10.msg" "massout_level_20140410:materialInfo23.t"
		 -na;
connectAttr "massout_level_20140410:file10.oc" "massout_level_20140410:lambert22.c"
		;
connectAttr "massout_level_20140410:file10.ot" "massout_level_20140410:lambert22.it"
		;
connectAttr "massout_level_20140410:place2dTexture10.c" "massout_level_20140410:file10.c"
		;
connectAttr "massout_level_20140410:place2dTexture10.tf" "massout_level_20140410:file10.tf"
		;
connectAttr "massout_level_20140410:place2dTexture10.rf" "massout_level_20140410:file10.rf"
		;
connectAttr "massout_level_20140410:place2dTexture10.mu" "massout_level_20140410:file10.mu"
		;
connectAttr "massout_level_20140410:place2dTexture10.mv" "massout_level_20140410:file10.mv"
		;
connectAttr "massout_level_20140410:place2dTexture10.s" "massout_level_20140410:file10.s"
		;
connectAttr "massout_level_20140410:place2dTexture10.wu" "massout_level_20140410:file10.wu"
		;
connectAttr "massout_level_20140410:place2dTexture10.wv" "massout_level_20140410:file10.wv"
		;
connectAttr "massout_level_20140410:place2dTexture10.re" "massout_level_20140410:file10.re"
		;
connectAttr "massout_level_20140410:place2dTexture10.of" "massout_level_20140410:file10.of"
		;
connectAttr "massout_level_20140410:place2dTexture10.r" "massout_level_20140410:file10.ro"
		;
connectAttr "massout_level_20140410:place2dTexture10.n" "massout_level_20140410:file10.n"
		;
connectAttr "massout_level_20140410:place2dTexture10.vt1" "massout_level_20140410:file10.vt1"
		;
connectAttr "massout_level_20140410:place2dTexture10.vt2" "massout_level_20140410:file10.vt2"
		;
connectAttr "massout_level_20140410:place2dTexture10.vt3" "massout_level_20140410:file10.vt3"
		;
connectAttr "massout_level_20140410:place2dTexture10.vc1" "massout_level_20140410:file10.vc1"
		;
connectAttr "massout_level_20140410:place2dTexture10.o" "massout_level_20140410:file10.uv"
		;
connectAttr "massout_level_20140410:place2dTexture10.ofs" "massout_level_20140410:file10.fs"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "massout_level_20140410:lambert22SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "massout_level_20140410:lambert22SG.message" ":defaultLightSet.message";
connectAttr "massout_level_20140410:lambert22SG.pa" ":renderPartition.st" -na;
connectAttr "massout_level_20140410:lambert22.msg" ":defaultShaderList1.s" -na;
connectAttr "massout_level_20140410:file10.msg" ":defaultTextureList1.tx" -na;
connectAttr "massout_level_20140410:place2dTexture10.msg" ":defaultRenderUtilityList1.u"
		 -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"UV_test_1K_map\" \"fileTextureName\" \"C:\\\\Users\\\\pryan\\\\Box Sync\\\\UV test maps\\\\ash_uvgrid08.jpg\" 3084795623 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08.jpg\" \"sourceImages\"\n1\n\"file1\" \"fileTextureName\" \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" 2480704162 \"C:/Users/pryan/Box Sync/UV test maps/ash_uvgrid08_2K.jpg\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of Lillypad.ma
