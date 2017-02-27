---- Variables ----

isMapDDClient = false
mapNameDDClient = ""
local rankTable = {}
local sX,sY = guiGetScreenSize()

local timesFont = dxCreateFont("Bariol_Bold.otf",sY*(16/1080))
local timesFont1 = dxCreateFont("Bariol_Bold.otf",sY*(14/1080))
local fontTextotopwins = dxCreateFont("Bariol_Regular.otf",sY*(13/1080))
local fontTextotopwinsSmall = dxCreateFont("Bariol_Regular.otf",sY*(9/1080))

---- Tables ----

topwins = {
	anim = 360,
	size = {380,160,35,190,3},
	headerSize = 60,
	state = false,
	animState = "closed",
	tick = getTickCount()
}

---- Export mapInfo ----

function getMapNameInfo1(mapInfo)
  local infoMapClient = string.find(mapInfo.name, "[DD]", 1, true) or string.find(mapInfo.name, "=DD=", 1, true) or string.find(mapInfo.name, "DD", 1, true) --or mapInfo.modename == "Destruction derby"
  if infoMapClient then
	isMapDDClient = true
	mapNameDDClient = mapInfo.name
	topwins.state = true
  else
	isMapDDClient = false
	mapNameDDClient = ""
  end
end
addEvent("onClientMapStarting")
addEventHandler("onClientMapStarting", getRootElement(), getMapNameInfo1)

---- Sort Info Principal ----

function getTopWins()
	triggerServerEvent("onTopPlayerListRequest",localPlayer)
end
bindKey("F4","down",getTopWins)

addEvent("onClientReceiveTopListTable",true)
addEventHandler("onClientReceiveTopListTable",root,
function(t)
	rankTable = t
end
)

---- Draw the TopWins ----

function drawTopWins()
	if topwins.animState == "closed" then
		local tick = getTickCount() - topwins.tick
		local progress = tick/1000
		topwins.anim = interpolateBetween(0,0,0,390,0,0,progress,"InOutQuad")
	else
		local tick = getTickCount() - topwins.tick
		local progress = tick/1000
		topwins.anim = interpolateBetween(390,0,0,0,0,0,progress,"InOutQuad")
	end
	local clanColor = {239, 72, 54,255}
	local colorRectangle = {123,123,123,255}
	if topwins.state then
		triggerServerEvent("onTopPlayerListRequest",localPlayer)
		local sX = sX+topwins.anim
		dxDrawRectangle(sX-topwins.size[1]-10,(sY/2)-(topwins.size[4]),topwins.size[1],topwins.headerSize,tocolor(clanColor[1],clanColor[2],clanColor[3],200)) -- top rectangle
		dxDrawText("Top Wins for:",sX-topwins.size[1],(sY/2)-(210),sX-10,(sY/2)-(topwins.size[2])+(200/8),tocolor(255,255,255,255),1,timesFont,"left","center",true) -- top times for
		dxDrawText(mapNameDDClient,sX-topwins.size[1],(sY/2)-(topwins.size[2]),sX-10,(sY/2)-(topwins.size[2])+(200/8),tocolor(255,255,255,255),1,timesFont1,"left","center",true)
		
		for i,v in ipairs(rankTable) do 
			if v["playerName"] ~= "" then
				dxDrawRectangle(sX-topwins.size[1]-10,(sY/2)-(topwins.size[2])+(32*i+5*(i-1)),topwins.size[1],topwins.size[3],tocolor(colorRectangle[1],colorRectangle[2],colorRectangle[3],colorRectangle[4])) --rectangulo dos varios tempos
				dxDrawRectangle(sX-topwins.size[1]-10,(sY/2)-(topwins.size[2])+(32*i+5*(i-1)),topwins.size[5],topwins.size[3],tocolor(clanColor[1],clanColor[2],clanColor[3],clanColor[4])) --"linha" dos varios tempos do lado esquerdo
				
				dxDrawText("Top #"..i,sX-topwins.size[1]+(topwins.size[1]*0.03)-10,(sY/2)-(topwins.size[2])+(200/8)+((i-1)*20),sX-(topwins.size[1]*0.1)-10,(sY/2)-(topwins.size[2])+(40)+(32*i+22*(i-1)),tocolor(255,255,255,255),1,fontTextotopwins,"left","center",true,false,false,true) --posicoes
				dxDrawText(v["playerName"],sX-topwins.size[1]+(topwins.size[1]*0.03)+120,(sY/2)-(topwins.size[2])+(200/8)+((i-1)*20),sX-(topwins.size[1]*0.1)-10,(sY/2)-(topwins.size[2])+(40)+(32*i+22*(i-1)),tocolor(255,255,255,255),1,fontTextotopwins,"left","center",true,false,false,true) --posicoes
				dxDrawText(tostring(v["Value"]).."x",sX-topwins.size[1]+(topwins.size[1]*0.03)+75,(sY/2)-(topwins.size[2])+(200/8)+((i-1)*20),sX-(topwins.size[1]*0.1)-10,(sY/2)-(topwins.size[2])+(40)+(32*i+22*(i-1)),tocolor(255,255,255,255),1,fontTextotopwins,"left","center",true,false,false,true) --posicoes			
			
			--elseif (v["playerName"] == "") then
				--	dxDrawText("There are no wins on this map!",sX-topwins.size[1]+(topwins.size[1]*0.03)-10,(sY/2)-(topwins.size[2])+(200/8),sX-(topwins.size[1]*0.1)-10,(sY/2)-(topwins.size[2])+(72),tocolor(255,255,255,255),1,fontTextotopwins,"left","center",true,false,false,true) --posicoes
			end
		end
		
	end
end
addEventHandler("onClientRender",getRootElement(),drawTopWins)

---- Toggle Top Wins

function toggleTopWins()
	if topwins.animState == "open" then
		closeTopWins()
		killTimer(closeIt)
	else
		openTopWins()
		closeIt = setTimer(closeTopWins,5000,1)
	end
end
bindKey("F5","down",toggleTopWins)
addEvent("onClientMapStarting")
addEventHandler("onClientMapStarting", getRootElement(), toggleTopWins)

function openTopWins()
	if topwins.state and topwins.animState == "closed" then
		topwins.tick = getTickCount()
		topwins.animState = "open"
	end
end

function closeTopWins()
	if topwins.state and topwins.animState == "open" then
		topwins.tick = getTickCount()
		topwins.animState = "closed"
	end
end