procedure(copy_cell(orig_libName dest_libName keyword)

	lib=ddGetObj(orig_libName)
	allCellList = lib~>cells~>name

	includeCellList = rexMatchList(keyword allCellList)

	foreach(cell includeCellList
		dbcv = dbOpenCellViewByType(orig_libName cell "layout" "" "a")
		dbCopyCellView(dbcv dest_libName cell "layout" nil nil t)
	);;foreach
)



procedure(copy_cellx(orig_libName dest_libName keyword exclude)

	lib=ddGetObj(orig_libName)
	allCellList = lib~>cells~>name

	includeCellList = rexMatchList(keyword allCellList)
	excludeCellList = rexMatchList(exclude allCellList)


	FinalCellList = setof(item, includeCellList, !member(item, excludeCellList))

	;;TmodCellList = rexMatchList("Tmod" ANDCellList)

	;;libCellList = rexMatchList("lib" allCellList)
	;;tapCellList = rexMatchList("tapC" allCellList)

	;;XlibCellList = setof(item, TmodCellList, !member(item, libCellList))
	;;AllTmodCellList = setof(item, XlibCellList, !member(item, tapCellList))


	foreach(cell FinalCellList
		dbcv = dbOpenCellViewByType(orig_libName cell "layout" "" "a")
		dbCopyCellView(dbcv dest_libName cell "layout" nil nil t)
	);;foreach
)