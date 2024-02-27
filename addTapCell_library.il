procedure(add_tapCells(libName tapCellName)

	lib=ddGetObj(libName)
	allCellList = lib~>cells~>name

	tapCellList = rexMatchList("TAPCELL" allCellList)
	AddTapCellList = setof(item, allCellList, !member(item, tapCellList))

	tapCV = dbOpenCellViewByType(libName tapCellName "layout" "" "a")
	tapObj = (tapCV ~> shapes)
	count = 0

	foreach(cell AddTapCellList 
		destCV = dbOpenCellViewByType(libName cell "layout" "" "a")
		destBoundary = dbShapeQuery(destCV list("BOUNDARY" "drawing") (destCV~>bBox))
		destxy_ur = cadar(destBoundary~>bBox)
		destx_ur = car(destxy_ur)
		foreach(obj tapObj
			dbCopyShape(obj destCV list(destx_ur:0 "R0" 1.0))
		);;foreach obj

		dbSave(destCV)
		dbClose(destCV)
		count++
		printf("Adding tap cell: %s done\n" cell)

	);;foreach cell
	printf("Total cells: %d\n" count)
)