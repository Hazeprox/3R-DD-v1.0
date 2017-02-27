function replaceTXD() 

txd = engineLoadTXD ( "vgncarshade1.txd" )
engineImportTXD(txd, 8858)
engineImportTXD(txd, 8838)
engineImportTXD(txd, 16357)
engineImportTXD(txd, 8558)
engineImportTXD(txd, 8557)
engineImportTXD(txd, 18452)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceTXD)