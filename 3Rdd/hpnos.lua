local x,y = guiGetScreenSize()
local sX1 = x/1920
local sY1 = y/1080

function dxDrawEmptyRectangle(startX, startY, endX, endY, color, width, postGUI)
	dxDrawLine ( startX, startY, startX+endX, startY, color, width, postGUI )
	dxDrawLine ( startX, startY, startX, startY+endY, color, width, postGUI )
	dxDrawLine ( startX, startY+endY, startX+endX, startY+endY,  color, width, postGUI )
	dxDrawLine ( startX+endX, startY, startX+endX, startY+endY, color, width, postGUI )
end

function nitro()
	dxDrawEmptyRectangle(sX1*1638,sY1*1020,sX1*233,sY1*29,tocolor(255,255,255,255),2,true)
end
addEventHandler("onClientRender", getRootElement(), nitro)

addEventHandler("onClientRender", getRootElement(),
function()
	local playerVehicle = getPedOccupiedVehicle ( localPlayer )
	if playerVehicle then
		local vehicleHealth = getElementHealth ( playerVehicle ) / 10  -- Divide this by 10, as default the denominator is 1000
		
		dxDrawEmptyRectangle(sX1*1638,sY1*985,sX1*233,sY1*29,tocolor(255,255,255,255),2,true)
		dxDrawRectangle(sX1*1640, sY1*987, sX1*230*(math.floor(vehicleHealth)/100), sY1*26, tocolor(255, 0, 0,190), true) -- flat red
		dxDrawText("Health",sX1*1717, sY1*986, sX1*50, sY1*30,tocolor(255,255,255,255),sX1*1.8,"default-bold","left","top",false,false,true,true)
dxDrawText("3R DD 1.0 BETA",sX1*1730, sY1*75, sX1*50, sY1*30,tocolor(255,255,255,255),sX1*1.8,"default-bold","left","top",false,false,true,true)

	end
end
)