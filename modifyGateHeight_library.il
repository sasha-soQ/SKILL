procedure(mGateHeight(libName)

	lib=ddGetObj(libName)
	allCellList = lib~>cells~>name
	count = 0

	foreach(cell allCellList
		dbcv = dbOpenCellViewByType(libName cell "layout" "" "a")
		boundary = dbShapeQuery(dbcv list("BOUNDARY" "drawing") (dbcv~>bBox))
		boundaryBBox = car(boundary~>bBox)
		
		xy_ll = car(boundaryBBox) 
		x_ll = car(xy_ll) 
		y_ll = cadr(xy_ll) 
			
		xy_ur = cadr(boundaryBBox) 
		x_ur = car(xy_ur) 
		y_ur = cadr(xy_ur)
		
		allGates = dbShapeQuery(dbcv list("Gate" "drawing") list(x_ll:y_ll x_ur:y_ur))
		
		foreach(gate allGates
			gateBtm = cdar(gate~>bBox)
			gateTop = cdadr(gate~>bBox)
			gateLeft = caar(gate~>bBox)
			gateRight = caadr(gate~>bBox)
			if(((gateBtm != -0.005) || (gateTop != 0.221)) then
				gate~>bBox = list(gateLeft:-0.005 gateRight:0.221)
			)
				
		)


		dbSave(dbcv)
		dbClose(dbcv)
		count++
		printf("Modifying gate height: %s done\n" cell)

	);;foreach cell
	printf("Total cells: %d\n" count)
)