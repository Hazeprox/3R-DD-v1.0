--******************************************************************************************************************************************************************
--**************************************************************************                ************************************************************************
--**************************************************************************      Login     ************************************************************************
--**************************************************************************                ************************************************************************
--******************************************************************************************************************************************************************

showCursor(false)
local sX,sY = guiGetScreenSize()
local servername = "3lite Racers"
local fontLogin = dxCreateFont("Bariol_Bold.otf",25)
local fontLogin1 = dxCreateFont("Bariol_Regular.otf",25)

function dxDrawRectangleLogin(recStartX,recStartY,recWidth,recHeight,recColor,recPostGui,lineColor, lineWidth, linePostGui)
dxDrawRectangle(recStartX,recStartY,recWidth,recHeight,recColor,recPostGui)
dxDrawLine(recStartX, recStartY, recStartX+recWidth, recStartY, lineColor, lineWidth, linePostGui) --linha cima
dxDrawLine(recStartX, recStartY, recStartX, recStartY+recHeight, lineColor, lineWidth, linePostGui) --linha lado esquerdo
dxDrawLine(recStartX+recWidth, recStartY, recStartX+recWidth, recStartY+recHeight, lineColor, lineWidth, linePostGui) --linha lado direito
dxDrawLine(recStartX, recStartY+recHeight, recStartX+recWidth, recStartY+recHeight, lineColor, lineWidth, linePostGui) --linha baixo
end

----------------------------------

local edit = createElement("dxEdit")
local edit2 = createElement("dxEdit")

local button1 = createElement("dxButton")
local button2 = createElement("dxButton")
local button3 = createElement("dxButton")

local scale = (sX/1920)

local loginData = {
	checkbox = false,
	login = {
		pos = {sX*0.415,sY*0.425},
		alpha = 1,
	},
}

------------------------------------

function drawLogin()
	dxDrawImage(0,0,sX,sY,"img/background.png")
	
	dxDrawRectangleLogin(sX*(745/1920),sY*(340/1080),sX*(500/1920),sY*(375/1080),tocolor(100,100,100,150),true,tocolor(255,255,255,255), 2, true)
	dxDrawRectangleLogin(sX*(745/1920),sY*(340/1080),sX*(500/1920),sY*(45/1080),tocolor(239,72,54,200),true,tocolor(239,72,54,255), 2, true)
	
	dxDrawText("Welcome to "..servername,sX*(805/1920),sY*(340/1080),0,0,tocolor(255,255,255,255),sX*(1/1920),fontLogin,"left","top",false,false,true)
	
	dxLibCreateEdit(edit,sX*(795/1920),sY*(430/1080),sX*(400/1920),sY*(50/1080),"Username","person",20,20,20,255,true,false)
	dxLibCreateEdit(edit2,sX*(795/1920),sY*(500/1080),sX*(400/1920),sY*(50/1080),"Password","password",20,20,20,255,true,true)
	
	dxLibCreateButton(button1,sX*(800/1920),sY*(590/1080),sX*(187.5/1920),sY*(45/1080),"Login",sX*(2/1920),255,255,255,45,45,45,255,true,false)
	dxLibCreateButton(button2,sX*(1005/1920),sY*(590/1080),sX*(187.5/1920),sY*(45/1080),"Register",sX*(2/1920),255,255,255,45,45,45,255,true,false)
	dxLibCreateButton(button3,sX*(887.5/1920),sY*(650/1080),sX*(200/1920),sY*(45/1080),"Play as Guest",sX*(2/1920),255,255,255,45,45,45,255,true,false)
	
	--dxDrawText("Remember",sX*(1100/1920),sY*(680/1080),0,0,tocolor(255,255,255,255),sX*(0.5/1920),fontLogin1,"left","top",false,false,true)
	
	--[[setElementData(resourceRoot,'checkboxSelected',false,false)
	if loginData.checkbox then
		if isCursorHover(loginData.login.pos[1]+sX*0.205,loginData.login.pos[2]+sY*0.202,sX*0.0165,30) then
			setElementData(resourceRoot,'checkboxSelected',true,false)
			dxDrawImageSection(loginData.login.pos[1]+sX*0.2,loginData.login.pos[2]+sY*0.2,50*scale,33*scale,100,0,100,66,"img/checkbox.png",0,0,0,tocolor(255,255,255,150*loginData.login.alpha),true)
		else
			dxDrawImageSection(loginData.login.pos[1]+sX*0.2,loginData.login.pos[2]+sY*0.2,50*scale,33*scale,100,0,100,66,"img/checkbox.png",0,0,0,tocolor(255,255,255,255*loginData.login.alpha),true)
		end	
	else
		if isCursorHover(loginData.login.pos[1]+sX*0.205,loginData.login.pos[2]+sY*0.202,sX*0.0165,30) then
			setElementData(resourceRoot,'checkboxSelected',true,false)
			dxDrawImageSection(loginData.login.pos[1]+sX*0.2,loginData.login.pos[2]+sY*0.2,50*scale,33*scale,0,0,100,66,"img/checkbox.png",0,0,0,tocolor(255,255,255,150*loginData.login.alpha),true)
		else
			dxDrawImageSection(loginData.login.pos[1]+sX*0.2,loginData.login.pos[2]+sY*0.2,50*scale,33*scale,0,0,100,66,"img/checkbox.png",0,0,0,tocolor(255,255,255,255*loginData.login.alpha),true)
		end	
	end]]--
	
	--rememberLol()
end

function renderLogin()
	if not getElementData(getLocalPlayer(),"Login") then
	showChat(false)
	addEventHandler("onClientRender", getRootElement(), drawLogin)
	showCursor(true)
	end
end
addEventHandler( "onClientResourceStart", getRootElement( ),renderLogin)

function rememberLol()
	local xml = xmlLoadFile("setting.xml")
	if xml then
		local username = tostring(xmlNodeGetAttribute(xml,"username"))
		local password = tostring(xmlNodeGetAttribute(xml,"password"))
		if (username ~= "" and password ~= "") then
			dxLibEditSetText(edit,username)
			dxLibEditSetText(edit2,password)
		end
	xmlUnloadFile(xml)
	end
end

function onDxButtonLoginClick(dxButton)
	setElementData(getLocalPlayer(),"Login","true")
	if dxButton == button3 then
		hideLoginWindow()
		createNotification1("Success","You are now playing as guest",46,204,113)
	elseif dxButton == button1 then
		clientSubmitLogin()
	elseif dxButton == button2 then
		clientSubmitRegister()
	end
end
addEventHandler("onDxLibButtonClick",getRootElement(),onDxButtonLoginClick)

function clientSubmitLogin()
		local username = dxLibEditGetText(edit)
		local password = dxLibEditGetText(edit2)
		if username ~= "" then
			if string.len(password)>=4 then
				triggerServerEvent("submitLogin", getRootElement(), localPlayer, username, password)
			else
				createNotification1("Error","Password too small",192,57,43)
			end
		else
			createNotification1("Error","Enter username and password",192,57,43)
		end
end

function clientSubmitRegister()
		local username = dxLibEditGetText(edit)
		local password = dxLibEditGetText(edit2)
		if username ~= "" then
			if string.len(password)>=4 then
				triggerServerEvent("submitRegister", getRootElement(), localPlayer, username, password)
			else
				createNotification1("Error","Pass: min 4 chars",192,57,43)
			end
		else
			createNotification1("Error","Enter username and password",192,57,43)
		end
end

function hideLoginWindow()
	removeEventHandler("onClientRender",getRootElement(),drawLogin)
	showChat(true)
	showCursor(false)
end
addEvent("hideLoginWindow", true)
addEventHandler("hideLoginWindow", getRootElement(), hideLoginWindow)

function unknownError()
	createNotification1("Error","Something went wrong!",192,57,43)
end
addEvent("unknownError", true)
addEventHandler("unknownError", getRootElement(), unknownError)

function loginWrong()
	createNotification1("Error","Wrong username/password",192,57,43)
end
addEvent("loginWrong", true)
addEventHandler("loginWrong", getRootElement(), loginWrong)

function registerTaken()
	createNotification1("Error","This username already exists",192,57,43)
end
addEvent("registerTaken", true)
addEventHandler("registerTaken", getRootElement(), registerTaken)

function loggedIn()
	createNotification1("Error","You are already logged in",192,57,43)
end
addEvent("loggedIn", true)
addEventHandler("loggedIn", getRootElement(), loggedIn)

function onClientClickInLoginWindow(button,state)
	if button == "left" and state == "down" then
		if getElementData(resourceRoot,'checkboxSelected') then
			loginData.checkbox = not loginData.checkbox
		end
	end
end
addEventHandler("onClientClick",getRootElement(),onClientClickInLoginWindow)


-- Save data to xml

function savexmldata4player(username,password)
	if loginData.checkbox then
		local xml = xmlLoadFile("setting.xml")
		if not xml then
			xml = xmlCreateFile("setting.xml","accountdata")
		end
		xmlNodeSetAttribute(xml,"username",username)
		xmlNodeSetAttribute(xml,"password",password)
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
	end
end
addEvent("savexml",true)
addEventHandler("savexml",root,savexmldata4player)

---- Notifications ----

function callClientFunction(funcname, ...)
    local arg = { ... }
    if (arg[1]) then
        for key, value in next, arg do arg[key] = tonumber(value) or value end
    end
    loadstring("return "..funcname)()(unpack(arg))
end
addEvent("onServerCallsClientFunction", true)
addEventHandler("onServerCallsClientFunction", resourceRoot, callClientFunction)