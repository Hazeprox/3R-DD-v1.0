	------------------------------------------------------
	----------		Made by ~[KiG]~SpUnKyMe		----------
	------------------------------------------------------

	local g_Root = getRootElement()

	local updateTimer = 1500
	
	setTimer(function()
		local specList = {}
		for k,v in ipairs(getElementsByType("player")) do
			local target = getCameraTarget(v)
			if target and (target ~= v) then
				if not specList[target] then
					specList[target] = {}
				end
				specList[target][#specList[target]+1] = getPlayerName(v)
			end
		end
		
		for k,v in ipairs(getElementsByType("player")) do
			local target = getCameraTarget(v)
			if target then
				triggerClientEvent(v,"sendClientSpecList",g_Root,specList[target])
			else
				triggerClientEvent(v,"sendClientSpecList",g_Root,{})
			end
		end
	end,updateTimer,0)
	
	------------------------------------------------------
	------------------------------------------------------
	------------------------------------------------------