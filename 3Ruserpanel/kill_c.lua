

local _KILL_TIME = 10000
local killTimeTimer = nil
function checkKill(element)
	if source == getPedOccupiedVehicle(getLocalPlayer()) and element and getElementType(element) == "vehicle" then 
		local player = getVehicleController(element)
		if player then
			if isTimer(killTimeTimer) then killTimer(killTimeTimer) end
			setElementData( getLocalPlayer(), "lastDamagedBy", player )
			killTimeTimer = setTimer( setElementData, _KILL_TIME, 1, getLocalPlayer(), "lastDamagedBy", nil )
		end
	end
end
addEventHandler( "onClientVehicleCollision", getRootElement(), checkKill)


local screenW, screenH = guiGetScreenSize()
		
function getProgress( addtick )
    local now = getTickCount()
    local elapsedTime = now - lastTick
    local duration = lastTick+addtick - lastTick
    local progress = elapsedTime / duration
    return progress
end

addEvent("renderKill", true)
addEventHandler("renderKill", getRootElement(), function(kogo)
kogo = kogo
lastTick = getTickCount()
function drawZabiles()
--screenW * screenW * 0.3243, screenH * screenH * 0.8281, screenW * 0.3367, screenH * 0.1198
		local interpolate = interpolateBetween(0,screenH * 0.8281,0,screenW * 0.3243,screenW * 0.3243,screenW * 0.3243, getProgress(300), "InOutQuad")
        dxDrawRectangle(screenW * 0.3243,screenH * 0.8281,interpolate,screenH * 0.1198, tocolor(0, 0, 0, 200), false)
        dxDrawText("You killed: "..kogo, screenW * 0.3243, screenH * 0.8281, screenW * 0.6611, screenH * 0.8698, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "bottom", false, false, false, true, false)
        dxDrawText("+10 POINTS +50 CASH", screenW * 0.3243, screenH * 0.8932, screenW * 0.6611, screenH * 0.9349, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "bottom", false, false, false, false, false)
end
addEventHandler("onClientRender", root, drawZabiles)
setTimer(function()
removeEventHandler("onClientRender", root, drawZabiles)
end, 3000, 1)
end)

addEvent("renderDie", true)
addEventHandler("renderDie", getRootElement(), function(kto)
kto = kto
lastTick = getTickCount()
function drawDie()
	local interpolate = interpolateBetween(0,screenH * 0.8281,0,screenW * 0.3243,screenW * 0.3243,screenW * 0.3243, getProgress(300), "InOutQuad")
        dxDrawRectangle(screenW * 0.3243, screenH * 0.8281, interpolate, screenH * 0.1198, tocolor(0, 0, 0, 200), false)
        dxDrawText("You died from: "..kto, screenW * 0.3243, screenH * 0.8281, screenW * 0.6611, screenH * 0.8698, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "bottom", false, false, false, true, false)
        dxDrawText("+5 POINTS", screenW * 0.3243, screenH * 0.8932, screenW * 0.6611, screenH * 0.9349, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "bottom", false, false, false, false, false)
end
addEventHandler("onClientRender", root, drawDie)
start = getTickCount()
setTimer(function()
removeEventHandler("onClientRender", root, drawDie)
end, 3000, 1)
end)