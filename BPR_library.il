procedure(mBPRs(libName)

	lib=ddGetObj(libName)
	cellList = lib~>cells~>name
	count = 0

	foreach(cell cellList 


		dbcv = dbOpenCellViewByType(libName cell "layout" "" "a")
		
		;;cv = geGetEditCellView()
		boundary = dbShapeQuery(dbcv list("BOUNDARY" "drawing") (dbcv~>bBox))
		boundaryBBox = car(boundary~>bBox)

		xy_ll = car(boundaryBBox) 
		x_ll = car(xy_ll) 
		y_ll = cadr(xy_ll) 

		xy_ur = cadr(boundaryBBox) 
		x_ur = car(xy_ur) 
		y_ur = cadr(xy_ur)
		
		v0Low = dbShapeQuery(dbcv list("V0" "drawing") list(x_ll:y_ll x_ur:y_ll))
		v0High = dbShapeQuery(dbcv list("V0" "drawing") list(x_ll:y_ur x_ur:y_ur))
		m1Low = dbShapeQuery(dbcv list("M1" "drawing") list(x_ll:y_ll x_ur:y_ll))
		m1High = dbShapeQuery(dbcv list("M1" "drawing") list(x_ll:y_ur x_ur:y_ur))
		VSS = dbShapeQuery(dbcv list("M1" "pin") car(m1Low~>bBox))
		VDD = dbShapeQuery(dbcv list("M1" "pin") car(m1High~>bBox))

		selectedV0 = append(v0Low v0High)
		selectedM1 = append(m1Low m1High)
		selectedPower = append(VSS VDD)
		selectedLayerSet = append(selectedV0 selectedM1)
		selectedLayerSet = append(selectedLayerSet selectedPower)

		;;geSelectFigs(selectedV0)
		;;geSelectFigs(selectedM1)
		;;geSelectFigs(selectedPower)


		foreach(obj selectedLayerSet
			;;print(obj~>lpp)
			;;print(car(obj~>lpp))
			string = strcat(car(obj~>lpp) cadr(obj~>lpp))
			;;print(string)
			case(string

				("V0drawing"
					;;print(type(list("V0" "drawing")))
					obj~>lpp = list("VBPR" "drawing")
					;;print(obj~>lpp)
				)
				("M1drawing"
					objBBox = obj~>bBox
					obj~>bBox = list(caar(objBBox):cadar(objBBox)-0.009 caadr(objBBox):cadadr(objBBox)+0.009)
					obj~>lpp = list("BPR" "drawing")
					;;print(obj~>lpp)
				)
				("M1pin"
					obj~>lpp = list("BPR" "pin")
					;;print(obj~>lpp)
				)
			);;case
		);;foreach obj
		
		dbSave(dbcv) 
		dbClose(dbcv)
		count++
		printf("Convert to BPR cell: %s done \n" cell)

	);;foreach cell
	printf("Total cells: %d\n" count)
)