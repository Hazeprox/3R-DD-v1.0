addEvent("onPlayerFinishDD", true)
addEventHandler("onPlayerFinishDD", getRootElement(), function(rank)
local killer = getElementData( source, "lastDamagedBy" )
		if not getElementData(source, "Rounds") then
			setElementData(source, "Rounds", 1)
		else
			setElementData(source, "Rounds", getElementData(source, "Rounds")+1)
		end
		if not getElementData(source, "Die") then
			setElementData(source, "Die", 1)
		else
			setElementData(source, "Die", getElementData(source, "Die")+1)
		end
		if isElement(killer) then
			if not getElementData(killer, "Kills") then
				setElementData(killer, "Kills", 1)
			else
				setElementData(killer, "Kills", getElementData(killer, "Kills")+1)
			end
			if not getElementData(killer, "Wins") then
				setElementData(killer, "Wins", 1)
			else
				setElementData(killer, "Wins", getElementData(killer, "Wins")+1)
			end
			if not getElementData(killer, "Rounds") then
				setElementData(killer, "Rounds", 1)
			else
				setElementData(killer, "Rounds", getElementData(killer, "Rounds")+1)
			end
		
			triggerClientEvent(killer, "renderKill", killer, getPlayerName(source))
			triggerClientEvent(source, "renderDie", source, getPlayerName(killer))
			setElementData(killer, "Points", getElementData(killer, "Points")+10)
			setPlayerMoney(killer, getPlayerMoney(killer)+50)
			setElementData(killer, "Cash", getElementData(source, "Cash")+50)
			setElementData(source, "Points", getElementData(source, "Points")+5)
		end
end)