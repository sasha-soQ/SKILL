;;;;Setting bindkeys:
;;bindkey1: key 9 for display

hiSetBindKey("Layout" "<Key>9" "layerSet_1()")
procedure(layerSet_1()
	leSetEntryLayer(list("Gate" "drawing"))
	leSetAllLayerVisible( nil )
	leSetLayerVisible( list("Gate") t )
		leSetLayerVisible( list("Active" "drawing") t )
		leSetLayerVisible( list("SDT" "drawing") t )
		leSetLayerVisible( list("LISD" "drawing") t )
		leSetLayerVisible( list("LIG" "drawing") t )
		leSetLayerVisible( list("V0" "drawing") t )
		leSetLayerVisible( list("M1" "drawing") t )
		leSetLayerVisible( list("M1" "pin") t )    
		leSetLayerVisible( list("BOUNDARY" "drawing") t )       
		leSetLayerVisible( list("M2" "drawing") t )   
		leSetLayerVisible( list("M2" "pin") t )   
		leSetLayerVisible( list("V1" "drawing") t )

                leSetLayerSelectable( list("Gate" "drawing") t )
		leSetLayerSelectable( list("SDT" "drawing") t )
		leSetLayerSelectable( list("LISD" "drawing") t )
		leSetLayerSelectable( list("LIG" "drawing") t )
		leSetLayerSelectable( list("V0" "drawing") t )
		leSetLayerSelectable( list("M1" "drawing") t )
		leSetLayerSelectable( list("M1" "pin") t )    
		leSetLayerSelectable( list("BOUNDARY" "drawing") t )       
		leSetLayerSelectable( list("M2" "drawing") t )   
		leSetLayerSelectable( list("M2" "pin") t )   
		leSetLayerSelectable( list("V1" "drawing") t )

	hiRedraw( )
	printf("\n All CPS6L_BPR layers required up to M2 are set to visible. \n ")
 )



;;bindkey2: key 1 all except Gcut

hiSetBindKey("Layout" "<Key>1" "layerSet_2()")
procedure(layerSet_2()
        leSetEntryLayer(list("Gate" "drawing"))
        leSetAllLayerVisible( nil )
        leSetLayerVisible( list("Gate") t )
                leSetLayerVisible( list("well" "drawing") t )
                leSetLayerVisible( list("well" "pin") t )
                leSetLayerVisible( list("Nselect" "drawing") t )
                leSetLayerVisible( list("Pselect" "drawing") t )
                leSetLayerVisible( list("P_SUB" "pin") t )
                leSetLayerVisible( list("fin" "drawing") t )
                leSetLayerVisible( list("Active" "drawing") t )
                leSetLayerVisible( list("SDT" "drawing") t )
                leSetLayerVisible( list("LISD" "drawing") t )
                leSetLayerVisible( list("LIG" "drawing") t )
                leSetLayerVisible( list("V0" "drawing") t )
                leSetLayerVisible( list("M1" "drawing") t )
                leSetLayerVisible( list("M1" "pin") t )
                leSetLayerVisible( list("BOUNDARY" "drawing") t )
                leSetLayerVisible( list("M2" "drawing") t )
                leSetLayerVisible( list("M2" "pin") t )
                leSetLayerVisible( list("V1" "drawing") t )
                leSetLayerVisible( list("BPR" "drawing") t )
                leSetLayerVisible( list("BPR" "pin") t )
                leSetLayerVisible( list("VBPR" "drawing") t )


                leSetLayerSelectable( list("Gate" "drawing") t )
                leSetLayerSelectable( list("well" "drawing") t )
                leSetLayerSelectable( list("well" "pin") t )
                leSetLayerSelectable( list("Nselect" "drawing") t )
                leSetLayerSelectable( list("Pselect" "drawing") t )
                leSetLayerSelectable( list("P_SUB" "pin") t )
                leSetLayerSelectable( list("fin" "drawing") t )
                leSetLayerSelectable( list("Active" "drawing") t )
                leSetLayerSelectable( list("SDT" "drawing") t )
                leSetLayerSelectable( list("LISD" "drawing") t )
                leSetLayerSelectable( list("LIG" "drawing") t )
                leSetLayerSelectable( list("V0" "drawing") t )
                leSetLayerSelectable( list("M1" "drawing") t )
                leSetLayerSelectable( list("M1" "pin") t )
                leSetLayerSelectable( list("BOUNDARY" "drawing") t )
                leSetLayerSelectable( list("M2" "drawing") t )
                leSetLayerSelectable( list("M2" "pin") t )
                leSetLayerSelectable( list("V1" "drawing") t )
                leSetLayerSelectable( list("BPR" "drawing") t )
                leSetLayerSelectable( list("BPR" "pin") t )
                leSetLayerSelectable( list("VBPR" "drawing") t )

        hiRedraw( )
        printf("\n All CPS6L_BPR layers required up to M2 are set to visible. \n ")
);;procedure


;;bindkey3: key 5 drawing

hiSetBindKey("Layout" "<Key>5" "layerSet_3()")
procedure(layerSet_3()
        leSetEntryLayer(list("Gate" "drawing"))
        leSetAllLayerVisible( nil )
	leSetAllLayerSelectable( nil )
        leSetLayerVisible( list("Gate") t )
                leSetLayerVisible( list("SDT" "drawing") t )
                leSetLayerVisible( list("LISD" "drawing") t )
                leSetLayerVisible( list("LIG" "drawing") t )
                leSetLayerVisible( list("V0" "drawing") t )
                leSetLayerVisible( list("M1" "drawing") t )
                leSetLayerVisible( list("M1" "pin") t )
                leSetLayerVisible( list("M2" "drawing") t )
                leSetLayerVisible( list("M2" "pin") t )
                leSetLayerVisible( list("V1" "drawing") t )


                leSetLayerSelectable( list("LISD" "drawing") t )
                leSetLayerSelectable( list("LIG" "drawing") t )
                leSetLayerSelectable( list("V0" "drawing") t )
                leSetLayerSelectable( list("M1" "drawing") t )
                leSetLayerSelectable( list("M1" "pin") t )
                leSetLayerSelectable( list("M2" "drawing") t )
                leSetLayerSelectable( list("M2" "pin") t )
                leSetLayerSelectable( list("V1" "drawing") t )

        hiRedraw( )
        printf("\n All CPS6L_BPR layers required up to M2 are set to visible. \n ")
);;procedure