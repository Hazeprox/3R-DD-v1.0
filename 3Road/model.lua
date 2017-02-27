function replaceModel() 
  txd = engineLoadTXD("vgsehseing1.txd", 8558 , 8557 )
  engineImportTXD(txd, 8558 , 8557)
  txd = engineLoadTXD("vgsehseing1.txd", 3458 , 3458 )
  engineImportTXD(txd, 3458 , 3458)
  txd = engineLoadTXD("ddcramp.txd", 1634 , 1634 )
  engineImportTXD(txd, 1634 , 1634)
  txd = engineLoadTXD("ddcramp.txd", 1634 , 1634 )
  engineImportTXD(txd, 1634 , 1634)


end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )