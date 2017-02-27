function replaceTXD() 

txd = engineLoadTXD ( "cs_ebridge.txd" )
engineImportTXD(txd, 18450)
engineImportTXD(txd, 18449)


end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceTXD)