procedure(rename_add(libName suf)
	cell_list=ddGetObj(libName)~>cells~>name
	i=0
	while(i < length(cell_list)
		old_name=nth(i cell_list)
		new_name=strcat(old_name suf)
		old_cell=gdmCreateSpec(libName old_name  "layout" "" "CDBA")
		new_cell=gdmCreateSpec(libName new_name  "layout" "" "CDBA")
		ccpRename(old_cell new_cell t 'CCP_EXPAND_ALL  '  CCP_UPDATE_DESTLIB_ONLY)
		i++
	);while
);proc




procedure(rename_del(libName num)
	cell_list=ddGetObj(libName)~>cells~>name
	i=0
	while(i < length(cell_list)
		old_name=nth(i cell_list)
		new_name=substring(old_name 1 (strlen(old_name)-num))
		old_cell=gdmCreateSpec(libName old_name  "layout" "" "CDBA")
		new_cell=gdmCreateSpec(libName new_name  "layout" "" "CDBA")
		ccpRename(old_cell new_cell t 'CCP_EXPAND_ALL  '  CCP_UPDATE_DESTLIB_ONLY)
		i++
	);while
);proc