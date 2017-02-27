	local screenW, screenH = guiGetScreenSize()
	gridlist = nil
	texShader = dxCreateShader ( "carsmoke.fx" )
	--achiv name ,elementdata,ammount,money,points
	achivments={
	{"First Died -", "Die", 1, 500, 20},
	{"10 Died -", "Die", 10,1000,50},
	{"100 Died -", "Die", 100,2000,100},
	{"1000 Died -", "Die", 1000,10000,500},
	{"First Kill -", "Kills", 1,500,50},
	{"10 Kills -", "Kills", 10,800,80},
	{"100 Kills -", "Kills", 1000,150,300},
	{"1000 Kills -", "Kills", 10000,800,800},
	{"First Win -", "Wins", 1,500,50},
	{"10 Wins -", "Wins", 10,800,80},
	{"100 Wins -", "Wins", 1000,150,700},
	{"1000 Wins -", "Wins", 10000,1000,1000},
	}
				setTimer(function()
					gridlist = dxGrid:Create (screenW * 0.2050, screenH * 0.1953, screenW * 0.5937, screenH * 0.5)
					outputChatBox("#ff00003R// #00ff00Userpanel load!",255,255,255,true)
					gridlist:AddColumn ( "Maps", 800 )
					for k,v in pairs(getElementsByType("Maps")) do
						gridlist:AddItem ( 1, getElementData(v, "Maps") )
					end
					gridlist2 = dxGrid:Create (screenW * 0.5564, screenH * 0.2591, screenW * 0.2460, screenH * 0.5651)
					gridlist2:AddColumn ( "PLAYERS", 300 )
					for k,v in pairs(getElementsByType("player")) do
						gridlist2:AddItem ( 1, getPlayerName(v))
					end
					gridlist3 = dxGrid:Create(screenW * 0.1977, screenH * 0.1784, screenW * 0.6054, screenH * 0.6354)
					gridlist3:AddColumn ( "ACHIVMENTS", 400 )
					gridlist3:AddColumn ( "MONEY", 100 )
					gridlist3:AddColumn ( "POINTS", 100 )
					gridlist3:AddColumn ( "DONE", 100 )
					for k,v in pairs(achivments) do
						gridlist3:AddItem ( 1, v[1])
						gridlist3:AddItem ( 2, tostring(v[4]))
						gridlist3:AddItem ( 3, tostring(v[5]))
						gridlist3:AddItem ( 4, "NOT")
					end
					gridlist:SetVisible (false)
					gridlist2:SetVisible (false)
					gridlist3:SetVisible (false)
				end,2000,1)
opcja,opcja2,opcja3,opcja4 = true, true, true, true
	function isCursorOnElement(x,y,w,h)
		local mx,my = getCursorPosition ()
		local fullx,fully = guiGetScreenSize()
		cursorx,cursory = mx*fullx,my*fully
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		else
			return false
		end
	end


		visible = false
		window = 1
		stats = "STATS"
		shop = "SHOP"
		achiv = "ACHIV"
		sett = "SETT"
		maps = "MAPS"
		text = stats
		cd = 500
		click = false

		a1 = 200
		a2 = 150
		a3 = 150
		a4 = 150
		a5 = 150
		asd = localPlayer
		local spoilers={
		{1000},
		{1001},
		{1002},
		{1003},
		{1014},
		{1015},
		{1016},
		{1023},
		{1049},
		{1050},
		{1058},
		{1138},
		{1139},
		{1146},
		{1147},
		{1158},
		{1162},
		{1163},
		{1164},
		}
		local wheels={
		{1073},
		{1074},
		{1075},
		{1076},
		{1077},
		{1078},
		{1079},
		{1080},
		{1081},
		{1082},
		{1083},
		{1097},
		{1098},
		}
		local skins={
		{0},
		{1},
		{2},
		{20},
		{45},
		{63},
		}
		startskin = 0
		startwheel = 1073
		waterx,watery,waterx2,watery2 = nil
        wheel = guiCreateComboBox(0.36, 0.26, 0.12, 0.16, "", true)
        spoiler = guiCreateComboBox(0.36, 0.37, 0.12, 0.16, "", true)
        skin = guiCreateComboBox(0.36, 0.49, 0.12, 0.16, "", true)    
		guiSetVisible(wheel, false)
		guiSetVisible(spoiler, false)
		guiSetVisible(skin, false)
		for k,v in pairs(spoilers) do
			local item = guiComboBoxAddItem(spoiler, tostring(v[1]))
		end
		for k,v in pairs(wheels) do
			local item = guiComboBoxAddItem(wheel, tostring(v[1]))
		end
		for k,v in pairs(skins) do
			local item = guiComboBoxAddItem(skin, tostring(v[1]))
		end

r,g,b = 123,123,123


		-- KORDY GRIDLISTY screenW * 0.5564, screenH * 0.2591, screenW * 0.2460, screenH * 0.5651
addEventHandler("onClientRender", root,
    function()
		if visible == true then
		    dxDrawText("3R// Panel created by Haze", screenW * 0.6589, screenH * 0.7995, screenW * 0.8075, screenH * 0.8320, tocolor(255, 255, 255, 255), 1.00, "default", "right", "bottom", false, false, false, false, false)
  
			dxDrawRectangle(screenW * 0.1918, screenH * 0.1693, screenW * 0.6164, screenH * 0.6615, tocolor(123,123,123, 70), false)--window
			dxDrawRectangle(screenW * 0.1918, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289, tocolor(r,g,b, a1-80), false)--1
			dxDrawRectangle(screenW * 0.2782, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289, tocolor(r,g,b, a2-80), false)--2
			dxDrawRectangle(screenW * 0.3646, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289, tocolor(r,g,b, a3-80), false)--3
			dxDrawRectangle(screenW * 0.4510, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289, tocolor(r,g,b, a4-80), false)--4
			dxDrawRectangle(screenW * 0.5373, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289, tocolor(r,g,b, a5-80), false)--5
			dxDrawImage(screenW * 0.1918, screenH * 0.0404, screenW * 0.0783, screenH * 0.1289, "pngs/avatar.png", 0, 0, 0, tocolor(255, 255, 0, 255), false)
			dxDrawImage(screenW * 0.3653, screenH * 0.0417, screenW * 0.0776, screenH * 0.1276, "pngs/book.png", 0, 0, 0, tocolor(0, 255, 255, 255), false)
			dxDrawImage(screenW * 0.5359, screenH * 0.0404, screenW * 0.0798, screenH * 0.1289, "pngs/earth-globe.png", 0, 0, 0, tocolor(255, 200, 50, 255), false)
			dxDrawImage(screenW * 0.4502, screenH * 0.0378, screenW * 0.0783, screenH * 0.1315, "pngs/settings.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
			dxDrawImage(screenW * 0.2767, screenH * 0.0391, screenW * 0.0813, screenH * 0.1302, "pngs/shopping-cart.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
			dxDrawText(text, screenW * 0.6171, screenH * 0.0417, screenW * 0.8082, screenH * 0.1693, tocolor(255, 255, 255, 255), 3.00, "sans", "left", "bottom", false, false, false, false, false)
			if text == stats then
			    dxDrawText(getPlayerName(asd), screenW * 0.1918, screenH * 0.1680, screenW * 0.8089, screenH * 0.2643, tocolor(255, 255, 255, 255), 4.00, "sans", "center", "center", false, false, false, true, false)
				dxDrawText("Health: "..(math.floor(getElementHealth(getPedOccupiedVehicle(asd))or 0)/10).."%\nCash: "..tonumber(getElementData(asd, "Cash")or "0").."\nPoints: "..(getElementData(asd, "Points")or "?").. "\nLVL:"..(getElementData(asd, "lvl")or "?").."\nWins: "..(getElementData(asd, "Wins")or "?").."\nRounds: "..(getElementData(asd, "Rounds")or "?").."\nDeaths: "..(getElementData(asd, "Die")or "?").."\nKills: "..(getElementData(asd, "Kills")or "?"), screenW * 0.1918, screenH * 0.2643, screenW * 0.8016, screenH * 0.6745, tocolor(255, 255, 255, 255), 3.00, "default", "left", "top", false, true, false, false, false)
			elseif text == shop then
			    dxDrawText("COST 50K", screenW * 0.3470, screenH * 0.7917, screenW * 0.4473, screenH * 0.8255, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
			    dxDrawImage(screenW * 0.2006, screenH * 0.2031, screenW * 0.1464, screenH * 0.6055, "skins/"..startskin..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawImage(screenW * 0.5966, screenH * 0.4922, screenW * 0.1984, screenH * 0.3203, "wheels/"..startwheel..".jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false)
				dxDrawText("WHEELS", screenW * 0.3631, screenH * 0.2135, screenW * 0.5966, screenH * 0.2604, tocolor(255, 255, 255, 255), 3.00, "sans", "left", "center", false, false, false, false, false)
				dxDrawText("SPOILERS", screenW * 0.3631, screenH * 0.3255, screenW * 0.5966, screenH * 0.3724, tocolor(255, 255, 255, 255), 3.00, "sans", "left", "center", false, false, false, false, false)
				dxDrawText("SKINS", screenW * 0.3631, screenH * 0.4453, screenW * 0.5966, screenH * 0.4922, tocolor(255, 255, 255, 255), 3.00, "sans", "left", "center", false, false, false, false, false)
				dxDrawLine((screenW * 0.3638) - 1, (screenH * 0.6563) - 1, (screenW * 0.3638) - 1, screenH * 0.7318, tocolor(60, 254, 0, 255), 1, false)
				dxDrawLine(screenW * 0.4868, (screenH * 0.6563) - 1, (screenW * 0.3638) - 1, (screenH * 0.6563) - 1, tocolor(60, 254, 0, 255), 1, false)
				dxDrawLine((screenW * 0.3638) - 1, screenH * 0.7318, screenW * 0.4868, screenH * 0.7318, tocolor(60, 254, 0, 255), 1, false)
				dxDrawLine(screenW * 0.4868, screenH * 0.7318, screenW * 0.4868, (screenH * 0.6563) - 1, tocolor(60, 254, 0, 255), 1, false)
				dxDrawRectangle(screenW * 0.3638, screenH * 0.6563, screenW * 0.1230, screenH * 0.0755, tocolor(0, 0, 0, 150), false)
				dxDrawText("BUY", screenW * 0.3638, screenH * 0.6563, screenW * 0.4868, screenH * 0.7318, tocolor(255, 255, 255, 255), 3.00, "sans", "center", "center", false, false, false, false, false)
				dxDrawLine((screenW * 0.6040) - 1, (screenH * 0.1758) - 1, (screenW * 0.6040) - 1, screenH * 0.2995, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.6808, (screenH * 0.1758) - 1, (screenW * 0.6040) - 1, (screenH * 0.1758) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine((screenW * 0.6040) - 1, screenH * 0.2995, screenW * 0.6808, screenH * 0.2995, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.6808, screenH * 0.2995, screenW * 0.6808, (screenH * 0.1758) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawRectangle(screenW * 0.6040, screenH * 0.1758, screenW * 0.0769, screenH * 0.1237, tocolor(0, 0, 0, 255), false)--car
				dxDrawLine(screenW * 0.5966, screenH * 0.1693, screenW * 0.5966, screenH * 0.6042, tocolor(255, 255, 255, 255), 1, false)
				dxDrawLine((screenW * 0.7225) - 1, (screenH * 0.1758) - 1, (screenW * 0.7225) - 1, screenH * 0.2995, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.7994, (screenH * 0.1758) - 1, (screenW * 0.7225) - 1, (screenH * 0.1758) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine((screenW * 0.7225) - 1, screenH * 0.2995, screenW * 0.7994, screenH * 0.2995, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.7994, screenH * 0.2995, screenW * 0.7994, (screenH * 0.1758) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawRectangle(screenW * 0.7225, screenH * 0.1758, screenW * 0.0769, screenH * 0.1237, tocolor(0, 0, 0, 255), false)--lights
				dxDrawLine((screenW * 0.6040) - 1, (screenH * 0.3568) - 1, (screenW * 0.6040) - 1, screenH * 0.4805, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.6808, (screenH * 0.3568) - 1, (screenW * 0.6040) - 1, (screenH * 0.3568) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine((screenW * 0.6040) - 1, screenH * 0.4805, screenW * 0.6808, screenH * 0.4805, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.6808, screenH * 0.4805, screenW * 0.6808, (screenH * 0.3568) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawRectangle(screenW * 0.6040, screenH * 0.3568, screenW * 0.0769, screenH * 0.1237, tocolor(0, 0, 0, 255), false)--idk1
				dxDrawLine((screenW * 0.7225) - 1, (screenH * 0.3568) - 1, (screenW * 0.7225) - 1, screenH * 0.4805, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.7994, (screenH * 0.3568) - 1, (screenW * 0.7225) - 1, (screenH * 0.3568) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine((screenW * 0.7225) - 1, screenH * 0.4805, screenW * 0.7994, screenH * 0.4805, tocolor(74, 209, 21, 255), 1, false)
				dxDrawLine(screenW * 0.7994, screenH * 0.4805, screenW * 0.7994, (screenH * 0.3568) - 1, tocolor(74, 209, 21, 255), 1, false)
				dxDrawRectangle(screenW * 0.7225, screenH * 0.3568, screenW * 0.0769, screenH * 0.1237, tocolor(0, 0, 0, 255), false)--idk2
				dxDrawText("Car Color\n10000$", screenW * 0.6032, screenH * 0.1745, screenW * 0.6808, screenH * 0.2995, tocolor(255, 255, 255, 255), 1.50, "sans", "center", "center", false, false, false, false, false)
				dxDrawText("Headlight Color\n10000$", screenW * 0.7218, screenH * 0.1758, screenW * 0.7994, screenH * 0.3008, tocolor(255, 255, 255, 255), 1.50, "sans", "center", "center", false, true, false, false, false)
				local item = guiComboBoxGetSelected(wheel)
				local text = guiComboBoxGetItemText(wheel, item)
				if item and text ~= "" then
					startwheel = text
				end
				local item = guiComboBoxGetSelected(skin)
				local text = guiComboBoxGetItemText(skin, item)
				if item and text ~= "" then
					startskin = text
				end
			elseif text == maps then
			        dxDrawLine((screenW * 0.4209) - 1, (screenH * 0.7005) - 1, (screenW * 0.4209) - 1, screenH * 0.8086, tocolor(83, 239, 15, 255), 1, false)
					dxDrawLine(screenW * 0.5798, (screenH * 0.7005) - 1, (screenW * 0.4209) - 1, (screenH * 0.7005) - 1, tocolor(83, 239, 15, 255), 1, false)
					dxDrawLine((screenW * 0.4209) - 1, screenH * 0.8086, screenW * 0.5798, screenH * 0.8086, tocolor(83, 239, 15, 255), 1, false)
					dxDrawLine(screenW * 0.5798, screenH * 0.8086, screenW * 0.5798, (screenH * 0.7005) - 1, tocolor(83, 239, 15, 255), 1, false)
					dxDrawRectangle(screenW * 0.4209, screenH * 0.7005, screenW * 0.1589, screenH * 0.1081, tocolor(255, 0, 0, 255), false)
					dxDrawText("BUY MAP 5K$", screenW * 0.4195, screenH * 0.7005, screenW * 0.5805, screenH * 0.8099, tocolor(30, 208, 6, 255), 2.00, "sans", "center", "center", false, false, true, false, false)
			elseif text == sett then
					dxDrawText("WATER SHADER", screenW * 0.1977, screenH * 0.1732, screenW * 0.3441, screenH * 0.2799, tocolor(255, 255, 255, 255), 2.00, "default", "center", "center", false, false, false, false, false)
					dxDrawRectangle(screenW * 0.2050, screenH * 0.2669, screenW * 0.1369, screenH * 0.0807, tocolor(0, 0, 0, 50), false)
					if opcja == true then
						dxDrawRectangle(screenW * 0.2064, screenH * 0.2656, screenW * 0.0666, screenH * 0.0820, tocolor(253, 5, 5, 255), false)
						
						dxDrawText("OFF", screenW * 0.3470, screenH * 0.2656, screenW * 0.4209, screenH * 0.3477, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
					elseif opcja == false then
						dxDrawRectangle(screenW * 0.2753, screenH * 0.2656, screenW * 0.0666, screenH * 0.0820, tocolor(5, 255, 5, 255), false)
						
						dxDrawText("ON", screenW * 0.3470, screenH * 0.2656, screenW * 0.4209, screenH * 0.3477, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
					
					end
					dxDrawText("CAR SMOKE", screenW * 0.1808, screenH * 0.3646, screenW * 0.3514, screenH * 0.4479, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "top", false, false, false, false, false)
					dxDrawRectangle(screenW * 0.2064, screenH * 0.4219, screenW * 0.1369, screenH * 0.0807, tocolor(0, 0, 0, 50), false)
					if opcja2 == true then
						dxDrawText("OFF", screenW * 0.3470, screenH * 0.4219, screenW * 0.3975, screenH * 0.4948, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.2064, screenH * 0.4219, screenW * 0.0666, screenH * 0.0820, tocolor(253, 5, 5, 255), false)
					elseif opcja2 == false then
						dxDrawText("ON", screenW * 0.3470, screenH * 0.4219, screenW * 0.3975, screenH * 0.4948, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.2753, screenH * 0.4219, screenW * 0.0666, screenH * 0.0820, tocolor(5, 255, 5, 255), false)
					end
					dxDrawText("BLOOM SHADER", screenW * 0.1845, screenH * 0.5286, screenW * 0.3551, screenH * 0.6120, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "top", false, false, false, false, false)
					dxDrawRectangle(screenW * 0.2064, screenH * 0.5782, screenW * 0.1369, screenH * 0.0807, tocolor(0, 0, 0, 50), false)
					if opcja3 == true then
						dxDrawText("OFF", screenW * 0.3477, screenH * 0.5794, screenW * 0.3982, screenH * 0.6523, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.2064, screenH * 0.5782, screenW * 0.0666, screenH * 0.0820, tocolor(253, 5, 5, 255), false)
					elseif opcja3 == false then
						dxDrawText("ON", screenW * 0.3477, screenH * 0.5794, screenW * 0.3982, screenH * 0.6523, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.2753, screenH * 0.5782, screenW * 0.0666, screenH * 0.0820, tocolor(5, 255, 5, 255), false)
					end
					dxDrawText("RAINBOW", screenW * 0.4217, screenH * 0.2214, screenW * 0.5922, screenH * 0.3047, tocolor(255, 255, 255, 255), 2.00, "sans", "center", "top", false, false, false, false, false)

					dxDrawRectangle(screenW * 0.4348, screenH * 0.2669, screenW * 0.1369, screenH * 0.0807, tocolor(0,0,0,50), false)
					if opcja4 == true then
						dxDrawText("OFF", screenW * 0.5820, screenH * 0.2617, screenW * 0.6325, screenH * 0.3346, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.4348, screenH * 0.2669, screenW * 0.0666, screenH * 0.0820, tocolor(253, 5, 5, 255), false)
					elseif opcja4 == false then
						dxDrawText("ON", screenW * 0.5820, screenH * 0.2617, screenW * 0.6325, screenH * 0.3346, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "center", false, false, false, false, false)
						dxDrawRectangle(screenW * 0.5037, screenH * 0.2669, screenW * 0.0666, screenH * 0.0820, tocolor(5, 255, 5, 255), false)
					end
			end
				if isCursorOnElement(screenW * 0.1918, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289) and getKeyState("mouse1") and click == false then -- 1
					text = stats
					gridlist3:SetVisible (false)
					gridlist2:SetVisible(true)
					click = true
					a1 = 200
					a2 = 150
					a3 = 150
					a4 = 150
					a5 = 150
					guiSetVisible(wheel, false)
					guiSetVisible(spoiler, false)
					guiSetVisible(skin, false)
					gridlist:SetVisible (false)
						setTimer(function()
							click = false
						end,cd,1)
				elseif isCursorOnElement(screenW * 0.2782, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289) and getKeyState("mouse1") and click == false then -- 1
					text = shop
					guiSetVisible(wheel, true)
					guiSetVisible(spoiler, true)
					guiSetVisible(skin, true)
					click = true
					gridlist3:SetVisible (false)
					gridlist:SetVisible (false)
					gridlist2:SetVisible (false)
					a1 = 150
					a2 = 200
					a3 = 150
					a4 = 150
					a5 = 150
						setTimer(function()
							click = false
						end,cd,1)
				elseif isCursorOnElement(screenW * 0.3646, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289) and getKeyState("mouse1") and click == false then -- 1
					text = achiv
					click = true
					guiSetVisible(wheel, false)
					guiSetVisible(spoiler, false)
					guiSetVisible(skin, false)
					gridlist:SetVisible (false)
					gridlist2:SetVisible (false)
					gridlist3:SetVisible (true)
					a1 = 150
					a2 = 150
					a3 = 200
					a4 = 150
					a5 = 150
						setTimer(function()
							click = false
						end,cd,1)
				elseif isCursorOnElement(screenW * 0.4510, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289) and getKeyState("mouse1") and click == false then -- 1
					text = sett
					click = true
					guiSetVisible(wheel, false)
					guiSetVisible(spoiler, false)
					guiSetVisible(skin, false)
					gridlist3:SetVisible (false)
					a1 = 150
					a2 = 150
					a3 = 150
					a4 = 200
					a5 = 150
					gridlist:SetVisible (false)
					gridlist2:SetVisible (false)
						setTimer(function()
							click = false
						end,cd,1)
				elseif isCursorOnElement(screenW * 0.5373, screenH * 0.0404, screenW * 0.0791, screenH * 0.1289) and getKeyState("mouse1") and click == false then -- 1
					text = maps
					click = true
					guiSetVisible(wheel, false)
					guiSetVisible(spoiler, false)
					gridlist3:SetVisible (false)
					guiSetVisible(skin, false)
					gridlist:SetVisible (true)
					gridlist2:SetVisible (false)
					a1 = 150
					a2 = 150
					a3 = 150
					a4 = 150
					a5 = 200
						setTimer(function()
							click = false
						end,cd,1)
				elseif isCursorOnElement(screenW * 0.3638, screenH * 0.6563, screenW * 0.1230, screenH * 0.0755) and getKeyState("mouse1") and click == false and text == shop then -- 1
				  local item = guiComboBoxGetSelected(spoiler)
				  local item2 = guiComboBoxGetSelected(skin)
				  local item3 = guiComboBoxGetSelected(wheel)
				  local text = guiComboBoxGetItemText(spoiler, item)
				  local text2 = guiComboBoxGetItemText(skin, item2)
				  local text3 = guiComboBoxGetItemText(wheel, item3)
					if (item or item2 or item3) and (tonumber(getElementData(localPlayer, "Cash")) > 50000) then
						setElementData(localPlayer, "Cash", tonumber(getElementData(localPlayer,"Cash")-50000))
						for k,v in pairs(spoilers) do
							  if tostring(text) == tostring(v[1]) then
							addVehicleUpgrade(getPedOccupiedVehicle(localPlayer), v[1])
						  end
						end
						for k,v in pairs(skins) do
							  if tostring(text2) == tostring(v[1]) then
							setPedSkin(localPlayer, v[1])
						  end
						end
						for k,v in pairs(wheels) do
							  if tostring(text3) == tostring(v[1]) then
							addVehicleUpgrade(getPedOccupiedVehicle(localPlayer), v[1])
						  end
						end
					end
				elseif isCursorOnElement(screenW * 0.6040, screenH * 0.1758, screenW * 0.0769, screenH * 0.1237) and getKeyState("mouse1") and click == false and text == shop then -- 1
					if (tonumber(getElementData(localPlayer, "Cash")) > 10000) then
						setElementData(localPlayer, "Cash", tonumber(getElementData(localPlayer,"Cash")-10000))
						openPicker(1, "000000", "Car Color")
						addEventHandler("onColorPickerOK", root,
							function(element, hex, r, g, b)
								setVehicleColor( getPedOccupiedVehicle(localPlayer), r, g, b )
							end
						)
					end
				elseif isCursorOnElement(screenW * 0.7225, screenH * 0.1758, screenW * 0.0769, screenH * 0.1237) and getKeyState("mouse1") and click == false and text == shop then -- 1
					if (tonumber(getElementData(localPlayer, "Cash")) > 10000) then
						setElementData(localPlayer, "Cash", tonumber(getElementData(localPlayer,"Cash")-10000))
						setVehicleHeadLightColor ( theVehicle, red, green, blue )
						openPicker(2, "#000000", "HeadLight Color")
						addEventHandler("onColorPickerOK", root,
							function(element, hex, r, g, b)
								setVehicleHeadLightColor (getPedOccupiedVehicle(localPlayer), r, g, b )
							end
						)
					end
				elseif isCursorOnElement(screenW * 0.4209, screenH * 0.7005, screenW * 0.1589, screenH * 0.1081) and getKeyState("mouse1") and click == false and text == maps then -- 1
					if (tonumber(getElementData(localPlayer, "Cash")) > 5000) then
						triggerServerEvent("onUserpanelWantNextmap",root,gridlist:GetItemDetails(1, gridlist:GetSelectedItem()))
						outputChatBox("#ff0000[Server]#00ff00Next map is: "..gridlist:GetItemDetails(1, gridlist:GetSelectedItem()).." by "..getPlayerName(localPlayer),255,255,255,true)
						setElementData(localPlayer, "Cash", tonumber(getElementData(localPlayer,"Cash")-5000))
						click = true
							setTimer(function()
								click = false
							end,cd,1)

					end
				elseif isCursorOnElement(screenW * 0.2064, screenH * 0.2656, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja = false
					toggleWaterShader(true)
				elseif isCursorOnElement(screenW * 0.2753, screenH * 0.2656, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja = true
					toggleWaterShader(false)
				elseif isCursorOnElement(screenW * 0.2064, screenH * 0.4219, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja2 = false
					engineRemoveShaderFromWorldTexture(texShader,"collisionsmoke")
				elseif isCursorOnElement(screenW * 0.2753, screenH * 0.4219, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja2 = true
					dxSetShaderValue(texShader,"gTexture",10)
					engineApplyShaderToWorldTexture(texShader,"collisionsmoke")
				elseif isCursorOnElement(screenW * 0.2064, screenH * 0.5782, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja3 = false
					startBloom()
				elseif isCursorOnElement(screenW * 0.2753, screenH * 0.5782, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja3 = true
					stopBloom()
				elseif isCursorOnElement(screenW * 0.4348, screenH * 0.2669, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja4 = false
					selectPreset(4)
				elseif isCursorOnElement(screenW * 0.5037, screenH * 0.2669, screenW * 0.0666, screenH * 0.0820) and getKeyState("mouse1") and click == false and text == sett then -- 1
					opcja4 = true
					selectPreset(1)
				elseif isCursorOnElement(screenW * 0.5564, screenH * 0.2591, screenW * 0.2460, screenH * 0.5651) and getKeyState("mouse1") and click == false and text == stats then -- 1

					asd = getPlayerFromName(gridlist2:GetItemDetails(1, gridlist2:GetSelectedItem()))
				end
		end
	end
)
			function smokeoff()
				dxSetShaderValue(texShader,"gTexture",10)
				engineApplyShaderToWorldTexture(texShader,"collisionsmoke")
			end
			addEventHandler("onClientPlayerJoin", root, smokeoff)
			addEventHandler("onClientResourceStart", root, smokeoff)

bindKey ( "F1", "down", function()
	if visible == false then
		asd = localPlayer
		text = stats
		a1 = 200
		a2 = 150
		a3 = 150
		a4 = 150
		a5 = 150
		visible = true
		gridlist2:SetVisible (true)
		setElementData(localPlayer, "shader", true)
		showCursor(true)
		showChat(false)
		gridlist2:Clear()
			for k,v in pairs(getElementsByType("player")) do
				gridlist2:AddItem ( 1, getPlayerName(v))
			end
	else
		gridlist2:SetVisible (false)
		gridlist:SetVisible (false)
		guiSetVisible(wheel, false)
		gridlist3:SetVisible (false)
		guiSetVisible(spoiler, false)
		guiSetVisible(skin, false)
		visible = false
		setElementData(localPlayer, "shader", false)
		showCursor(false)
		showChat(true)
	end
end)





