--####################################################################
--##																##
--##																##
--##		*An0n-'s notifications V1.0								##
--##																##
--## 		This resource can only be used with						##
--##		scripts made by *An0n-.									##
--##		People who bought this resource also					##
--##		have rights to use it.									##
--## 																##
--##		For any help with the resource 							##
--##		Please contact the author:								##
--##																##
--##		Skype: joao-ferreira123								    ##
--##		InGame(MTA): *An0n-										##
--## 																##
--##		This resource is at creative common license:			##
--##		http://creativecommons.org/licenses/by-nc-nd/3.0/		##
--##																##
--##																##
--####################################################################


local sX,sY = guiGetScreenSize()

local notification = {
	tick = getTickCount(),
	active = {},
	maxX = sX*0.2,
	timeVisible = 3500,
	font = "default-bold",
	titleFontY = sY/750,
	infoFontY = sY/900,
}


function createNotification1(titleLabel,detailsText,backgroundRed,backgroundGreen,backgroundBlue)
	notification.tick = getTickCount()
	local notificationTable = {}
	notificationTable.title = titleLabel
	notificationTable.text = detailsText
	notificationTable.picture = infoPicture or false
	notificationTable.colors = {backgroundRed or 0,backgroundGreen or 0,backgroundBlue or 0}
	notificationTable.alpha = 60
	notificationTable.posX = sX-notification.maxX - sX*0.02
	notificationTable.posY = #notification.active + 1
	notificationTable.toPosY = #notification.active + 1
	notificationTable.tick = getTickCount()
	
	local removeHexMessage = string.gsub ( detailsText, '#%x%x%x%x%x%x', '' )
	local textWidthScale = math.ceil((dxGetTextWidth(removeHexMessage,notification.infoFontY,notification.font)+sX*0.04)/notification.maxX)
	local titleTextWidth = math.ceil((dxGetTextWidth(titleLabel,notification.titleFontY,notification.font)+sX*0.04)/notification.maxX)
	local titleFontHeight = dxGetFontHeight(notification.titleFontY,notification.font)+sY*0.01
	local fontHeight = dxGetFontHeight(notification.infoFontY,notification.font)+sY*0.01
	local sizeY = fontHeight*textWidthScale
	notificationTable.sizeY = sizeY
	notificationTable.titleY = titleTextWidth
	notificationTable.sizeX = math.min(math.max(dxGetTextWidth(removeHexMessage,notification.infoFontY,notification.font)+sX*0.02,dxGetTextWidth(titleLabel,notification.titleFontY,notification.font)+sX*0.02),notification.maxX)
	notificationTable.posX = sX-notificationTable.sizeX - sX*0.41
	table.insert(notification.active,notificationTable)
end

function renderNotifacations1()
	if #notification.active ~= 0 then
		local lastPos = sY*0.85
		for i,nData in pairs(notification.active) do
			lastPos = lastPos + sY*0.005 + nData.sizeY
		end
		for i,nData in pairs(notification.active) do
			local tick = getTickCount() - nData.tick
			lastPos = lastPos - sY*0.005 - nData.sizeY
			local sTick =getTickCount() - notification.tick
			local progress = sTick/1000
			nData.posY = interpolateBetween(nData.posY,0,0,lastPos,0,0,progress,"Linear")
			if tick < 1000 then
				local progress = tick/1000
				if progress>=1 then progress = 1 end
				local alpha = interpolateBetween(0,0,0,1,0,0,progress,"Linear")
				dxDrawRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(0,0,0,nData.alpha*alpha),true)
				dxDrawEmptyRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],255*alpha),3,true)
				dxDrawText(nData.text,nData.posX,nData.posY+nData.titleY,nData.posX+nData.sizeX,nData.posY+nData.sizeY,tocolor(255,255,255,255*alpha),notification.infoFontY,notification.font,"center","center",true,true,true,true)
			elseif tick >= 1000 and tick < notification.timeVisible then
				local alpha = 1
				dxDrawRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(0,0,0,nData.alpha*alpha),true)
				dxDrawEmptyRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],255*alpha),3,true)
				dxDrawText(nData.text,nData.posX,nData.posY+nData.titleY,nData.posX+nData.sizeX,nData.posY+nData.sizeY,tocolor(255,255,255,255*alpha),notification.infoFontY,notification.font,"center","center",true,true,true,true)
			elseif tick >= notification.timeVisible and tick< notification.timeVisible + 1000 then
				local progress = (tick-notification.timeVisible)/1000
				if progress>=1 then progress = 1 end
				local alpha = interpolateBetween(1,0,0,0,0,0,progress,"Linear")
				dxDrawRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(0,0,0,nData.alpha*alpha),true)
				dxDrawEmptyRectangle(nData.posX,nData.posY,nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],255*alpha),3,true)
				dxDrawText(nData.text,nData.posX,nData.posY+nData.titleY,nData.posX+nData.sizeX,nData.posY+nData.sizeY,tocolor(255,255,255,255*alpha),notification.infoFontY,notification.font,"center","center",true,true,true,true)
			else
				table.remove(notification.active,i)
			end
		end
	end
end

function protection1()
  addEventHandler("onClientRender", getRootElement(), renderNotifacations1)
end
addEventHandler("onClientResourceStart", resourceRoot, protection1)