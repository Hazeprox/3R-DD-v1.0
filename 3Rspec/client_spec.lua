	------------------------------------------------------
	----------		Made by ~[KiG]~SpUnKyMe		----------
	------------------------------------------------------
	
	local g_Root = getRootElement()

	local sX,sY = guiGetScreenSize()
	
	local visible = true
	
	local specList = {}
	
	local gS = sY*0.25
	local gY = sY*0.7
	local gF = math.floor((gY-gS)/18)
	
	local function dxDrawSpec(str,ay)
		local color = tocolor(255,255,255,255)
		local color2 = tocolor(0,0,0,200)
		local font = "default-bold"
		local sc = 1
		if str then
			local w = dxGetTextWidth(str:gsub("#%x%x%x%x%x%x",""), 1, font)
			local ax = sX-15 - w
			local pat = "(.-)#(%x%x%x%x%x%x)"
			local s,e,cap,col = str:find(pat,1)
			local last = 1
		while s do
		if cap == "" and col then color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)), 255) end
			if s ~= 1 or cap ~= "" then
				local w = dxGetTextWidth(cap,sc,font)
				dxDrawText(cap, ax+1, ay+1, ax + w+1, 1, color2, sc, font,"left")
				dxDrawText(cap,ax,ay,ax+w,0,color,sc,font,"left")
				ax = ax+w
				color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)),255)
			end
			last = e+1
			s, e, cap, col = str:find(pat,last)
		end
			if last <= #str then
				cap = str:sub(last)
				local w = dxGetTextWidth(cap,sc,font)
				dxDrawText(cap, ax+1, ay+1, ax + w+1, 1, color2, sc, font,"left")
				dxDrawText(cap,ax,ay,ax+w,0,color,sc,font,"left")
			end
		end
	end
	
	local function drawSpectatorsList()
		if specList and (#specList >= 1) then
			dxDrawSpec("#FFFFFFSpecators (#ff0000"..tostring(#specList).."#FFFFFF):",gS)
			for k,v in ipairs(specList) do
				dxDrawSpec(specList[k],gS+18*k)
				if (k == gF) then
					break;
				end
			end
		end
	end
	addEventHandler("onClientRender",g_Root,drawSpectatorsList)
	
	bindKey("F2","down",
	function()
		if visible then
			removeEventHandler("onClientRender",g_Root,drawSpectatorsList)
			visible = false
		else
			addEventHandler("onClientRender",g_Root,drawSpectatorsList)
			visible = true
		end
	end)
	
	addEvent("sendClientSpecList",true)
	addEventHandler("sendClientSpecList",g_Root,
	function(arg1)
		specList = arg1
	end)
	
	------------------------------------------------------
	------------------------------------------------------
	------------------------------------------------------