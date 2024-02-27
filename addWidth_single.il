procedure(add_width()
	dbcv = geGetEditCellView()

	selectedLayerSet = dbcv~>shapes

	boundary = dbShapeQuery(dbcv list("BOUNDARY" "drawing") (dbcv~>bBox))
	boundaryBBox = car(boundary~>bBox)

	xy_ur = cadr(boundaryBBox) 
	x_ur = car(xy_ur) 
	y_ur = cadr(xy_ur)

	foreach(obj selectedLayerSet
		string = strcat(car(obj~>lpp) cadr(obj~>lpp))
		case(string
		
		
			("BPRdrawing"
				objBBox = obj~>bBox
				obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
			)
			("LIGdrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur+0.027  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
			("findrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur+0.027  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
			("GCutdrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur+0.027 && cadar(objBBox) == 0.086  then
					obj~>bBox = list(caar(objBBox)+0.054:cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				else if((caadr(objBBox) == x_ur+0.027) && (cadar(objBBox) != 0.086) then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
					)
				)
			)
			("BOUNDARYdrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
			("Nselectdrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
			("Pselectdrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
			("welldrawing"
				objBBox = obj~>bBox
				if(caadr(objBBox) == x_ur  then
					obj~>bBox = list(caar(objBBox):cadar(objBBox) caadr(objBBox)+0.054:cadadr(objBBox))
				)
			)
		 );;case
	);;foreach obj


	dbCreatePolygon(dbcv list("Gate" "drawing") list(x_ur+0.044:-0.005 x_ur+0.064:-0.005 x_ur+0.064:0.221 x_ur+0.044:0.221))

	printf("Add cell width: %s - %s done \n" dbcv~>libName dbcv~>cellName)
)