procedure(mBPR()
	dbcv = geGetEditCellView()

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

	foreach(obj selectedLayerSet
		string = strcat(car(obj~>lpp) cadr(obj~>lpp))
		case(string

			("V0drawing"
				obj~>lpp = list("VBPR" "drawing")
			)
			("M1drawing"
				objBBox = obj~>bBox
				obj~>bBox = list(caar(objBBox):cadar(objBBox)-0.009 caadr(objBBox):cadadr(objBBox)+0.009)
				obj~>lpp = list("BPR" "drawing")
			)
			("M1pin"
				obj~>lpp = list("BPR" "pin")
			)
		 );;case
	);;foreach obj

	printf("Convert to BPR cell: %s - %s done \n" dbcv~>libName dbcv~>cellName)
	)