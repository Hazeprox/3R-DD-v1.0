--####################################################################
--##																##
--##																##
--##		Xiti's directX library V2.0 Stable						##
--##																##
--## 		This resource can only be used with						##
--##		scripts made by Xiti.									##
--##		People who bought this resource also					##
--##		have rights to use it.									##
--## 																##
--##		For any help with the resource 							##
--##		Please contact the author:								##
--##																##
--##		Skype: mateusz331169									##
--##		InGame(MTA): ~X!ti#										##
--## 																##
--##		This resource is at creative common license:			##
--##		http://creativecommons.org/licenses/by-nc-nd/3.0/		##
--##																##
--##																##
--####################################################################

--####################################################################
--##		Configuration											##
--####################################################################

dxLib = {
	imageURL = "img/",
	globalAlpha = 1,
	font = "default-bold"
}

--####################################################################
--##		dxLib Events											##
--####################################################################

addEvent("onDxLibButtonClick",true)
addEvent("onDxLibEditChange",true)
addEvent("onDxLibGridlistClick",true)
addEvent("onDxLibScrollMouse",true)

--####################################################################
--##		Main Functions											##
--####################################################################

local sX,sY = guiGetScreenSize()

function dxDrawEmptyRectangle(startX, startY, endX, endY, color, width, postGUI)
	dxDrawLine ( startX, startY, startX+endX, startY, color, width, postGUI )
	dxDrawLine ( startX, startY, startX, startY+endY, color, width, postGUI )
	dxDrawLine ( startX, startY+endY, startX+endX, startY+endY,  color, width, postGUI )
	dxDrawLine ( startX+endX, startY, startX+endX, startY+endY, color, width, postGUI )
end

function dxLibCreateButton(buttonElement,positionX,positionY,sizeX,sizeY,buttonLabel,labelSize,red,green,blue,lR,lG,lB,alpha,postGUI,coloredLabel)
	if not getElementData(buttonElement,"dxButtonCreate") then
		setElementData(buttonElement,"dxButtonCreate",true,false)
		setElementData(buttonElement,"dxButtonHover",false,false)
		setElementData(buttonElement,"dxButtonClick",false,false)
		return
	end
	setElementData(buttonElement,"dxButtonLabel",tostring(buttonLabel),false)
	setElementData(buttonElement,"dxButtonHover",false,false)
	local scaleX = sizeX/932
	if isCursorHover(positionX,positionY,sizeX,sizeY) and not getElementData(buttonElement,"dxButtonClick") then
		setElementData(buttonElement,"dxButtonHover",true,false)
		dxDrawImageSection(positionX-25*scaleX+sizeX,positionY,25*scaleX,sizeY,0,0,25,174,dxLib.imageURL.."button.png",180,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		dxDrawImageSection(positionX,positionY,25*scaleX,sizeY,907,0,25,174,dxLib.imageURL.."button.png",180,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		dxDrawImageSection(positionX+25*scaleX,positionY,sizeX-50*scaleX,sizeY,26,0,1,174,dxLib.imageURL.."button.png",180,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX+1,positionY+sizeY+2,tocolor(0,0,0,alpha*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
		dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX,positionY+sizeY,tocolor(lR,lG,lB,alpha*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
	else
		dxDrawImageSection(positionX,positionY,25*scaleX,sizeY,0,0,25,174,dxLib.imageURL.."button.png",0,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		dxDrawImageSection(positionX-25*scaleX+sizeX,positionY,25*scaleX,sizeY,907,0,25,174,dxLib.imageURL.."button.png",0,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		dxDrawImageSection(positionX+25*scaleX,positionY,sizeX-50*scaleX,sizeY,26,0,1,174,dxLib.imageURL.."button.png",0,0,0,tocolor(red,green,blue,alpha*dxLib.globalAlpha),postGUI)
		if not getElementData(buttonElement,"dxButtonClick") then
			dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX+1,positionY+sizeY+2,tocolor(0,0,0,alpha*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
			dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX,positionY+sizeY,tocolor(lR,lG,lB,alpha*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
		else
			dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX+1,positionY+sizeY+2,tocolor(0,0,0,alpha/1.2*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
			dxDrawText(buttonLabel,positionX,positionY,positionX+sizeX,positionY+sizeY,tocolor(lR,lG,lB,alpha/1.2*dxLib.globalAlpha),labelSize,dxLib.font,"center","center",true,false,postGUI,coloredLabel or false)
		end
	end
	setElementData(buttonElement,"dxButtonClick",false,false)
end


function dxLibCreateGridlist(gridlistElement,gridlistData,positionX,positionY,sizeX,sizeY,fontSize,emptyString,colorRed,colorGreen,colorBlue,alphaGridlist,coloredLabels,postGUI)
	if not getElementData(gridlistElement,"dxGridlistCreate") then
		setElementData(gridlistElement,"dxGridlistCreate",true,false)
		setElementData(gridlistElement,"dxGridlistScroll",0,false)
		setElementData(gridlistElement,"dxGridlistScrollTo",0,false)
		setElementData(gridlistElement,"dxGridlistSelected",0,false)
		setElementData(gridlistElement,"dxGridlistDataCount",1,false)
		setElementData(gridlistElement,"dxGridlistHover",false,false)
		setElementData(gridlistElement,"dxGridlistDataHover",false,false)
		setElementData(gridlistElement,"dxGridlistTick",getTickCount(),false)
		setElementData(gridlistElement,"dxGridlistScrollHover",false,false)
		setElementData(gridlistElement,"dxGridlistScrollClicked",false,false)
		setElementData(gridlistElement,"dxGridlistDatatable",gridlistData,false)
		local renderTarget = dxCreateRenderTarget(sizeX,sizeY,true)
		setElementData(gridlistElement,"dxGridlistRenderTarget",renderTarget,false)
		return
	end
	if type(gridlistData) == "table" then
		local dataCount = getElementData(gridlistElement,"dxGridlistDataCount")
		if dataCount ~= #gridlistData then
			setElementData(gridlistElement,"dxGridlistDataCount",#gridlistData,false)
			setElementData(gridlistElement,"dxGridlistDatatable",gridlistData,false)
		end
		if getElementData(gridlistElement,"dxGridlistSelected") > #gridlistData then
			setElementData(gridlistElement,"dxGridlistSelected",0,false)
		end
	else
		outputDebugString("dxLib: Data for gridlist must be a table value!")
		return
	end
	setElementData(gridlistElement,"dxGridlistHover",false,false)
	if isCursorHover(positionX,positionY,sizeX,sizeY) then
		setElementData(gridlistElement,"dxGridlistHover",true,false)
	end
	local renderTarget = getElementData(gridlistElement,"dxGridlistRenderTarget")
	if renderTarget then
		local rowSize = dxGetFontHeight(fontSize,dxLib.font)+10
		local gridlistTick = getElementData(gridlistElement,"dxGridlistTick")
		local scroll = getElementData(gridlistElement,"dxGridlistScroll")
		local scrollTo = getElementData(gridlistElement,"dxGridlistScrollTo")
		local visibleRows = sizeY/rowSize
		if #gridlistData*rowSize > sizeY then
			if scrollTo < 0 then
				scrollTo = 0
				setElementData(gridlistElement,"dxGridlistScrollTo",0,false)
			elseif scrollTo > #gridlistData-visibleRows then
				scrollTo = #gridlistData-visibleRows
				setElementData(gridlistElement,"dxGridlistScrollTo",#gridlistData-visibleRows,false)
			end
			if scroll ~= scrollTo then
				local tick = getTickCount() - gridlistTick
				local progress = tick/500
				if progress >= 1 then progress = 1 end
				scroll = interpolateBetween(scroll,0,0,scrollTo,0,0,progress,"Linear")
				setElementData(gridlistElement,"dxGridlistScroll",scroll,false)
			end
		else
			scroll = 0
			setElementData(gridlistElement,"dxGridlistScroll",0,false)
			setElementData(gridlistElement,"dxGridlistScrollTo",0,false)
		end
		local scrollPosition = rowSize*scroll
		dxSetRenderTarget(renderTarget)
		dxDrawRectangle(0,0,sizeX,sizeY,tocolor(14,15,15,160))
		setElementData(gridlistElement,"dxGridlistDataHover",false,false)
		local selectedRow = getElementData(gridlistElement,"dxGridlistSelected")
		if #gridlistData ~= 0 then
			for id,dataPart in pairs(gridlistData) do
				if (positionY+(rowSize*(id-1))-scrollPosition)>=positionY-rowSize and (positionY+(rowSize*(id-1))-scrollPosition)<=positionY+sizeY+rowSize then
					if isCursorHover(positionX,positionY+(rowSize*(id-1))-scrollPosition,sizeX,rowSize) and getElementData(gridlistElement,"dxGridlistHover") then
						setElementData(gridlistElement,"dxGridlistDataHover",id,false)
						if selectedRow == id then
							dxDrawRectangle(0,rowSize*(id-1)-scrollPosition,sizeX,rowSize,tocolor(colorRed,colorGreen,colorBlue,220),false)
							dxDrawText(tostring(dataPart),5,rowSize*(id-1)+5-scrollPosition,sizeX,rowSize*id-5-scrollPosition,tocolor(255,255,255,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
						else
							dxDrawRectangle(0,rowSize*(id-1)-scrollPosition,sizeX,rowSize,tocolor(50,50,50,200),false)
							dxDrawText(tostring(dataPart),5,rowSize*(id-1)+5-scrollPosition,sizeX,rowSize*id-5-scrollPosition,tocolor(255,255,255,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
						end
					else
						if selectedRow == id then
							dxDrawRectangle(0,rowSize*(id-1)-scrollPosition,sizeX,rowSize,tocolor(colorRed,colorGreen,colorBlue,200),false)
							dxDrawText(tostring(dataPart),5,rowSize*(id-1)+5-scrollPosition,sizeX,rowSize*id-5-scrollPosition,tocolor(255,255,255,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
						else
							dxDrawRectangle(0,rowSize*(id-1)-scrollPosition,sizeX,rowSize,tocolor(20,20,20,150),false)
							dxDrawText(tostring(dataPart),5,rowSize*(id-1)+5-scrollPosition,sizeX,rowSize*id-5-scrollPosition,tocolor(255,255,255,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
						end
					end
				end
			end
		else
			dxDrawText(tostring(emptyString),6,4,sizeX,rowSize-5,tocolor(0,0,0,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
			dxDrawText(tostring(emptyString),5,5,sizeX,rowSize-5,tocolor(200,15,15,255),fontSize,dxLib.font,"left","center",true,false,false,coloredLabels or false)
		end
		dxSetRenderTarget()
		dxDrawImage(positionX,positionY,sizeX,sizeY,renderTarget,0,0,0,tocolor(255,255,255,alphaGridlist or 255),postGUI or false)
		dxDrawLine(positionX,positionY,positionX+sizeX,positionY,tocolor(0,0,0,alphaGridlist or 255),1,postGUI or false)
		dxDrawLine(positionX,positionY+sizeY,positionX+sizeX,positionY+sizeY,tocolor(0,0,0,alphaGridlist or 255),1,postGUI or false)
		dxDrawLine(positionX+sizeX,positionY,positionX+sizeX,positionY+sizeY,tocolor(0,0,0,alphaGridlist or 255),1,postGUI or false)
		dxDrawLine(positionX,positionY,positionX,positionY+sizeY,tocolor(0,0,0,alphaGridlist or 255),1,postGUI or false)
		local scrollBar = {}
		if #gridlistData*rowSize > sizeY then
			scrollBar.size = (sizeY-(sizeY/3))/(#gridlistData-visibleRows)
			if scrollBar.size<=sizeY/8 then
				scrollBar.size = sizeY/8
			end
			scrollBar.position = ((sizeY-scrollBar.size)/(#gridlistData-visibleRows))*scroll
			dxDrawRectangle(positionX+sizeX+1,positionY,sX*0.02,sizeY,tocolor(40,40,40,100*((alphaGridlist or 255)/255)),postGUI)
			dxDrawRectangle(positionX+sizeX+1,positionY+scrollBar.position,sX*0.02,scrollBar.size,tocolor(colorRed,colorGreen,colorBlue,255*((alphaGridlist or 255)/255)),postGUI)
			if getElementData(gridlistElement,"dxGridlistScrollClicked") then
				if getKeyState("mouse1") then
					local x,y = getCursorPosition()
					local x,y = x*sX,y*sY
					local newPos = y-positionY
					local barSize = (((#gridlistData-visibleRows)*rowSize)*(newPos/sizeY))/rowSize
					setElementData(gridlistElement,"dxGridlistScroll",barSize,false)
					setElementData(gridlistElement,"dxGridlistScrollTo",barSize,false)
				else
					setElementData(gridlistElement,"dxGridlistScrollClicked",false,false)
				end
			else
				if isCursorHover(positionX+sizeX,positionY+scrollBar.position,sX*0.02,scrollBar.size) then
					setElementData(gridlistElement,"dxGridlistScrollHover",true,false)
				else
					setElementData(gridlistElement,"dxGridlistScrollHover",false,false)
				end
			end
		end
	else
		outputDebugString("dxLib: Cant find a render target")
	end
end


function dxLibCreateEdit(editElement,positionX,positionY,sizeX,sizeY,defaultText,iconImage,colorRed,colorGreen,colorBlue,editAlpha,postGUI,maskedText)
	if not getElementData(editElement,"dxEditCreated") then
		setElementData(editElement,"dxEditCreated",true,false)
		setElementData(editElement,"dxEditTextCache","",false)
		setElementData(editElement,"dxEditHover",false,false)
		setElementData(editElement,"dxEditActive",false,false)
		setElementData(editElement,"dxEditSelected",false,false)
		local fontSize = 0
		local findedSize = false
		local i = 0
		local fontSizeCache = 0
		repeat
			i = i+0.1
			fontSizeCache = fontSize
			fontSize = dxGetFontHeight(i,dxLib.font)
			if fontSize>=(sizeY-(sY*0.01)) then
				findedSize = true
			end
		until findedSize
		setElementData(editElement,"dxEditTextSize",i,false)
		return
	end
	local fontSize = getElementData(editElement,"dxEditTextSize")
	local postGUI = postGUI or false
	if isCursorHover(positionX,positionY,sizeX,sizeY) then
		setElementData(editElement,"dxEditHover",true,false)
	else
		setElementData(editElement,"dxEditHover",false,false)
	end
	if getElementData(editElement,"dxEditActive") or getElementData(editElement,"dxEditHover") then
		dxDrawRectangle(positionX,positionY,sizeX,sizeY,tocolor(255,255,255,255*(editAlpha/255)),postGUI)
		dxDrawLine(positionX,positionY,positionX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX+sizeX,positionY,positionX+sizeX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX,positionY,positionX+sizeX,positionY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX,positionY+sizeY,positionX+sizeX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		local textPos = sY*0.005
		if iconImage then
			dxDrawImage(positionX+sY*0.005,positionY+sY*0.005,dxGetFontHeight(fontSize,dxLib.font),dxGetFontHeight(fontSize,dxLib.font),dxLib.imageURL..iconImage..".png",0,0,0,tocolor(255,255,255,255*(editAlpha/255)*dxLib.globalAlpha),postGUI)
			textPos = ((sY*0.005)*3)+dxGetFontHeight(fontSize,dxLib.font)
			dxDrawLine(positionX+textPos,positionY+sY*0.005,positionX+textPos,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),1,postGUI)
			textPos = textPos + sY*0.01
		end
		if getElementData(editElement,"dxEditActive") then
			local defaultText = tostring(getElementData(editElement,"dxEditTextCache"))
			if dxGetTextWidth(defaultText,fontSize,dxLib.font) > (positionX+sizeX-sY*0.005)-(positionX+textPos) then
				if getElementData(editElement,"dxEditSelected") then
					dxDrawRectangle(positionX+textPos,positionY+sY*0.005,(positionX+sizeX-sY*0.005)-(positionX+textPos),sizeY-sY*0.01,tocolor(200,200,200,255*(editAlpha/255)*dxLib.globalAlpha),postGUI)
				end
				if maskedText then
					local defaultText = string.rep("*",string.len(defaultText))
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				else
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				end
				dxDrawLine(positionX+sizeX-sY*0.01,positionY+sY*0.005,positionX+sizeX-sY*0.01,positionY+sizeY-sY*0.005,tocolor(0,0,0,255*(editAlpha/255)*dxLib.globalAlpha),2,postGUI)
			else
				if getElementData(editElement,"dxEditSelected") then
					dxDrawRectangle(positionX+textPos,positionY+sY*0.005,dxGetTextWidth(defaultText,fontSize,dxLib.font),sizeY-sY*0.01,tocolor(200,200,200,255*(editAlpha/255)*dxLib.globalAlpha),postGUI)
				end
				if maskedText then
					local defaultText = string.rep("*",string.len(defaultText))
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				else
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				end
				if maskedText then
					local defaultText = string.rep("*",string.len(defaultText))
					dxDrawLine(positionX+textPos+dxGetTextWidth(defaultText,fontSize,dxLib.font),positionY+sY*0.005,positionX+textPos+dxGetTextWidth(defaultText,fontSize,dxLib.font),positionY+sizeY-sY*0.005,tocolor(0,0,0,255*(editAlpha/255)*dxLib.globalAlpha),2,postGUI)
				else
					dxDrawLine(positionX+textPos+dxGetTextWidth(defaultText,fontSize,dxLib.font),positionY+sY*0.005,positionX+textPos+dxGetTextWidth(defaultText,fontSize,dxLib.font),positionY+sizeY-sY*0.005,tocolor(0,0,0,255*(editAlpha/255)*dxLib.globalAlpha),2,postGUI)
				end
			end
			local charPressed = checkPressedKey()
			if charPressed ~= "" then
				if charPressed == "backspace" then
					defaultText = string.sub(defaultText,1,string.len(defaultText)-1)
					setElementData(editElement,"dxEditTextCache",defaultText,false)
					triggerEvent("onDxLibEditChange",getResourceRootElement(getThisResource()),editElement)
					if getElementData(editElement,"dxEditSelected") then 
						setElementData(editElement,"dxEditTextCache","",false)
						setElementData(editElement,"dxEditSelected",false,false)
					end
				else
					if not getElementData(editElement,"dxEditSelected") and not (getKeyState("lctrl") or getKeyState("rctrl")) then
						setElementData(editElement,"dxEditTextCache",defaultText..charPressed,false)
						triggerEvent("onDxLibEditChange",getResourceRootElement(getThisResource()),editElement)
					elseif not (getKeyState("lctrl") or getKeyState("rctrl")) then
						setElementData(editElement,"dxEditTextCache",charPressed,false)
						setElementData(editElement,"dxEditSelected",false,false)
						triggerEvent("onDxLibEditChange",getResourceRootElement(getThisResource()),editElement)
					end
				end
			end
			if (getKeyState("lctrl") or getKeyState("rctrl")) and getKeyState("a") then
				setElementData(editElement,"dxEditSelected",true,false)
			end
		else
			if getElementData(editElement,"dxEditTextCache") == "" then
				if dxGetTextWidth(defaultText,fontSize,dxLib.font) > (positionX+sizeX-sY*0.005)-(positionX+textPos) then
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"right","center",true,false,postGUI)
				else
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				end
			else
				local defaultText = tostring(getElementData(editElement,"dxEditTextCache"))
				if maskedText then
					defaultText = string.rep("*",string.len(defaultText))
				end
				if dxGetTextWidth(defaultText,fontSize,dxLib.font) > (positionX+sizeX-sY*0.005)-(positionX+textPos) then
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"right","center",true,false,postGUI)
				else
					dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,255*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
				end
			end
		end
	else
		dxDrawRectangle(positionX,positionY,sizeX,sizeY,tocolor(220,220,220,220*(editAlpha/255)),postGUI)		
		dxDrawLine(positionX,positionY,positionX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX+sizeX,positionY,positionX+sizeX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX,positionY,positionX+sizeX,positionY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		dxDrawLine(positionX,positionY+sizeY,positionX+sizeX,positionY+sizeY,tocolor(255,255,255,255*(editAlpha/255)),2,postGUI)
		local textPos = sY*0.005
		if iconImage then
			dxDrawImage(positionX+sY*0.005,positionY+sY*0.005,dxGetFontHeight(fontSize,dxLib.font),dxGetFontHeight(fontSize,dxLib.font),dxLib.imageURL..iconImage..".png",0,0,0,tocolor(220,220,220,220*(editAlpha/255)*dxLib.globalAlpha),postGUI)
			textPos = ((sY*0.005)*3)+dxGetFontHeight(fontSize,dxLib.font)
			dxDrawLine(positionX+textPos,positionY+sY*0.005,positionX+textPos,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,220*(editAlpha/255)*dxLib.globalAlpha),1,postGUI)
			textPos = textPos + sY*0.01
		end
		if getElementData(editElement,"dxEditTextCache") == "" then
			if dxGetTextWidth(defaultText,fontSize,dxLib.font) > (positionX+sizeX-sY*0.005)-(positionX+textPos) then
				dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,220*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"right","center",true,false,postGUI)
			else
				dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,220*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
			end
		else
			local defaultText = tostring(getElementData(editElement,"dxEditTextCache"))
			if maskedText then
				defaultText = string.rep("*",string.len(defaultText))
			end
			if dxGetTextWidth(defaultText,fontSize,dxLib.font) > (positionX+sizeX-sY*0.005)-(positionX+textPos) then
				dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,220*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"right","center",true,false,postGUI)
			else
				dxDrawText(defaultText,positionX+textPos,positionY+sY*0.005,positionX+sizeX-sY*0.005,positionY+sizeY-sY*0.005,tocolor(colorRed,colorGreen,colorBlue,220*(editAlpha/255)*dxLib.globalAlpha),fontSize,dxLib.font,"left","center",true,false,postGUI)
			end
		end
	end
end


function isCursorHover(posX,posY,sizeX,sizeY)
	local x,y = 0,0
	if isCursorShowing() then x,y = getCursorPosition() x,y = sX*x,sY*y else return false end
	if x>=posX and x<=posX+sizeX and y>=posY and y<=posY+sizeY then
		return true
	else
		return false
	end
end


function onDxLibPlayerClick(button,state)
	if isCursorShowing() then
		if button == "left" and state == "down" then
			for i,dxButton in pairs(getElementsByType("dxButton")) do
				if getElementData(dxButton,"dxButtonHover") then
					setElementData(dxButton,"dxButtonClick",true,false)
					triggerEvent("onDxLibButtonClick",getRootElement(),dxButton)
					outputDebugString("Triggering event: \"onDxLibButtonClick\"",0,100,100,100)
					setElementData(dxButton,"dxButtonHover",false,false)
				end
			end
			for i,dxGridlist in pairs(getElementsByType("dxGridlist")) do
				if getElementData(dxGridlist,"dxGridlistHover") then
					if getElementData(dxGridlist,"dxGridlistDataHover") then
						setElementData(dxGridlist,"dxGridlistSelected",tonumber(getElementData(dxGridlist,"dxGridlistDataHover")),false)
						triggerEvent("onDxLibGridlistClick",getRootElement(),dxGridlist)
					end
				elseif getElementData(dxGridlist,"dxGridlistScrollHover") then
					setElementData(dxGridlist,"dxGridlistScrollClicked",true,false)
				end
			end
			for i,dxEdit in pairs(getElementsByType("dxEdit")) do
				if getElementData(dxEdit,"dxEditHover") then
					setElementData(dxEdit,"dxEditActive",true,false)
					setElementData(dxEdit,"dxEditSelected",false,false)
				elseif getElementData(dxEdit,"dxEditActive") and not getElementData(dxEdit,"dxEditHover") then
					setElementData(dxEdit,"dxEditActive",false,false)
				end
			end
		end
	end
end
addEventHandler("onClientClick",getRootElement(),onDxLibPlayerClick)


function onDxLibMouseScroll(keyPressed)
	if keyPressed == "mouse_wheel_up" then
		for i,dxGridlist in pairs(getElementsByType("dxGridlist")) do
			if getElementData(dxGridlist,"dxGridlistHover") then
				setElementData(dxGridlist,"dxGridlistTick",getTickCount(),false)
				setElementData(dxGridlist,"dxGridlistScrollTo",getElementData(dxGridlist,"dxGridlistScrollTo")-(3),false)
			end
		end
		triggerEvent("onDxLibScrollMouse",getRootElement(),"up")
	elseif keyPressed == "mouse_wheel_down" then
		for i,dxGridlist in pairs(getElementsByType("dxGridlist")) do
			if getElementData(dxGridlist,"dxGridlistHover") then
				setElementData(dxGridlist,"dxGridlistTick",getTickCount(),false)
				setElementData(dxGridlist,"dxGridlistScrollTo",getElementData(dxGridlist,"dxGridlistScrollTo")+(3),false)
			end
		end
		triggerEvent("onDxLibScrollMouse",getRootElement(),"down")
	end
end
bindKey("mouse_wheel_up","down",onDxLibMouseScroll)
bindKey("mouse_wheel_down","down",onDxLibMouseScroll)


keysTable = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
			"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z","backspace","num_0", "num_1", "num_2", "num_3", "num_4", "num_5",
			"num_6", "num_7", "num_8", "num_9", "num_mul", "num_add", "num_sub", "num_div", "num_dec","space","[", "]", ";", ",", "-", ".", "/", "#", "\\", "=",
} 
shiftTable = {")","!","@","#","$","%","^","&","*","("}

keyState = {}

function checkPressedKey()
	for i,key in ipairs(keysTable) do
		if getKeyState(key) then
			if true then
				if not keyState[i] then
					keyState[i] = getTickCount() + 500
					if key == "num_0" then return "0"
					elseif key == "num_1" then return "1"
					elseif key == "num_2" then return "2"
					elseif key == "num_3" then return "3"
					elseif key == "num_4" then return "4"
					elseif key == "num_5" then return "5"
					elseif key == "num_6" then return "6"
					elseif key == "num_7" then return "7"
					elseif key == "num_8" then return "8"
					elseif key == "num_9" then return "9"
					elseif key == "num_add" then return "+"
					elseif key == "num_sub" then return "-"
					elseif key == "num_div" then return "/"
					elseif key == "num_mul" then return "*"
					elseif key == "num_dec" then return ","
					elseif key == "space" then return " "
					else
						if not (getKeyState("lshift") or getKeyState("rshift")) then
							return key
						else
							if tonumber(key) then
								return shiftTable[tonumber(key)+1]
							else
								return string.upper(key)
							end
						end
					end
				elseif keyState[i] and keyState[i] < getTickCount() then
					keyState[i] = getTickCount()+100
					if key == "num_0" then return "0"
					elseif key == "num_1" then return "1"
					elseif key == "num_2" then return "2"
					elseif key == "num_3" then return "3"
					elseif key == "num_4" then return "4"
					elseif key == "num_5" then return "5"
					elseif key == "num_6" then return "6"
					elseif key == "num_7" then return "7"
					elseif key == "num_8" then return "8"
					elseif key == "num_9" then return "9"
					elseif key == "num_add" then return "+"
					elseif key == "num_sub" then return "-"
					elseif key == "num_div" then return "/"
					elseif key == "num_mul" then return "*"
					elseif key == "num_dec" then return ","
					elseif key == "space" then return " "
					else
						if not (getKeyState("lshift") or getKeyState("rshift")) then
							return key
						else
							if tonumber(key) then
								return shiftTable[tonumber(key)+1]
							else
								return string.upper(key)
							end
						end
					end
				end
			else
				return ""
			end
		else
			keyState[i] = false
		end
	end
	return ""
end


function dxLibEditGetText(editElement)
	if isElement(editElement) or not getElementData(editElement,"dxEditCreated") then
		return tostring(getElementData(editElement,"dxEditTextCache"))
	else
		outputDebugString("dxLib: Bad element!")
	end
end


function dxLibEditSetText(editElement,stringToSet)
	if isElement(editElement) then
		setElementData(editElement,"dxEditTextCache",stringToSet,false)
	else
		outputDebugString("dxLib: Bad element!")
	end
end


function dxLibGridlistGetSelectedRowText(gridlistElement)
	if isElement(gridlistElement) or not getElementData(gridlistElement,"dxGridlistCreate") then
		if getElementData(gridlistElement,"dxGridlistSelected") and getElementData(gridlistElement,"dxGridlistSelected") ~= 0 then
			local data = getElementData(gridlistElement,"dxGridlistDatatable")
			local row = tonumber(getElementData(gridlistElement,"dxGridlistSelected"))
			local gridlistData = data[row]
			return gridlistData
		else
			return false
		end
	else
		outputDebugString("dxLib: Bad element!")
	end
end

function dxLibGridlistGetSelectedRowNumber(gridlistElement)
	if isElement(gridlistElement) or not getElementData(gridlistElement,"dxGridlistCreate") then
		if getElementData(gridlistElement,"dxGridlistSelected") then
			local row = tonumber(getElementData(gridlistElement,"dxGridlistSelected"))
			if row then
				return row
			else
				return false
			end
		else
			return false
		end
	else
		outputDebugString("dxLib: Bad element!")
	end
end


function findFontSize(dxFont,toSize)
	local fontSize = 0
	local relativeSize = 0
	local perLoop = 0.01
	repeat
		fontSize = fontSize+perLoop
		relativeSize = dxGetFontHeight(fontSize,dxFont)
	until relativeSize>=toSize
	fontSize = fontSize - perLoop
	return fontSize
end


--####################################################################
--##		Testing													##
--####################################################################


--[[local button = createElement("dxButton")
local gridlist = createElement("dxGridlist")
local edit = createElement("dxEdit")

gridData = {}


for i=1,2000 do
	gridData[i] = " "..i
end

showCursor(true)

function test()
	dxLibCreateButton(button,350,760,400,50,"Find me!",3,255,0,120,0,255,0,255,false)
	dxLibCreateGridlist(gridlist,gridData,350,150,400,600,3,50,0,255,255)
	dxLibCreateEdit(edit,350,100,400,40,"Search player...","person",50,50,50,255)
end
addEventHandler("onClientRender",getRootElement(),test)]]


--####################################################################
--##		Copyrights © & ™ All rights reserved, Xiti 2013.		##
--####################################################################