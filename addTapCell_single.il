procedure(add_tapCell(tapCellName)

	dbcv = geGetEditCellView()
	libName = dbcv~>libName

	tapCV = dbOpenCellViewByType(libName tapCellName "layout" "" "a")
	tapObj = (tapCV ~> shapes)

	destBoundary = dbShapeQuery(dbcv list("BOUNDARY" "drawing") (dbcv~>bBox))
	destxy_ur = cadar(destBoundary~>bBox)
	destx_ur = car(destxy_ur)
	foreach(obj tapObj
		dbCopyShape(obj dbcv list(destx_ur:0 "R0" 1.0))
	);;foreach obj

	printf("Adding tap cell: %s - %s done\n" libName dbcv~>cellName)
)