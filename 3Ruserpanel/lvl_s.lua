addEventHandler("onPlayerLogin",root,function()
	local acc = getPlayerAccount(source)
	local cash = getAccountData(acc, "cash")
	local points = getAccountData(acc, "Points")
	local lvl = getAccountData(acc, "lvl")
	local wins = getAccountData(acc, "Wins")
	local rounds = getAccountData(acc, "Rounds")
	local die = getAccountData(acc, "Die")
	local kills = getAccountData(acc, "Kills")
	if not die then
			setElementData(source, "lvl", 0)
			setElementData(source, "Cash", 0)
			setPlayerMoney(source, 0)
			setElementData(source, "Points", 0)
			setElementData(source, "Wins", 0)
			setElementData(source, "Rounds", 0)
			setElementData(source, "Die", 0)
			setElementData(source, "Kills", 0)
	else
			setElementData(source, "lvl", tonumber(lvl))
			setElementData(source, "Cash", tonumber(cash))
			setPlayerMoney(source, cash)
			setElementData(source, "Points", tonumber(points))
			setElementData(source, "Wins", tonumber(wins))
			setElementData(source, "Rounds", tonumber(rounds))
			setElementData(source, "Die", tonumber(die))
			setElementData(source, "Kills", tonumber(kills))
	end

end)

addEventHandler("onPlayerQuit",root,function()
local acc = getPlayerAccount(source)
      if acc then
		setAccountData ( acc, "cash", getPlayerMoney(source))
		setAccountData ( acc, "Points", tonumber(getElementData(source, "Points")))
		setAccountData ( acc, "lvl", tonumber(getElementData(source, "lvl")))
		setAccountData ( acc, "Wins", tonumber(getElementData(source, "Wins")))
		setAccountData ( acc, "Rounds", tonumber(getElementData(source, "Rounds")))
		setAccountData ( acc, "Kills", tonumber(getElementData(source, "Kills")))
		setAccountData ( acc, "Die", tonumber(getElementData(source, "Die")))
	  end
end)

addEventHandler("onPlayerLogout",root,function()
local acc = getPlayerAccount(source)
      if acc and not isGuestAccount (acc) then
		setAccountData ( acc, "cash", getPlayerMoney(source))
		setAccountData ( acc, "Points", getElementData(source, "Points"))
		setAccountData ( acc, "lvl", getElementData(source, "lvl"))
		setAccountData ( acc, "Wins", tonumber(getElementData(source, "Wins")))
		setAccountData ( acc, "Rounds", tonumber(getElementData(source, "Rounds")))
		setAccountData ( acc, "Kills", tonumber(getElementData(source, "Kills")))
		setAccountData ( acc, "Die", tonumber(getElementData(source, "Die")))
	  end
end)
minpoints = 500

function checkChange(dataName,oldValue)
	if dataName == "Points" then
		if tonumber(getElementData(source, dataName)) >= minpoints then
			setElementData(source, "lvl", math.floor(tonumber(getElementData(source, dataName)/500)))
			
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),checkChange)

addCommandHandler("haz",function(plr,cmd)
setElementData(plr, "Kills", 1)
setElementData(plr, "Die", 1)
end)