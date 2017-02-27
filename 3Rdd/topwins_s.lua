---- Variables ----

isMapDD = false
mapNameDD = ""

---- Export mapInfo ----

function getMapNameInfo(mapInfo)
  local infoMap = string.find(mapInfo.name, "[DD]", 1, true) or string.find(mapInfo.name, "=DD=", 1, true) or string.find(mapInfo.name, "DD", 1, true) --or mapInfo.modename == "Destruction derby"
  if infoMap then
	isMapDD = true
	mapNameDD = mapInfo.name
  else
	isMapDD = false
	mapNameDD = ""
  end
end
addEvent("onMapStarting")
addEventHandler("onMapStarting", getRootElement(), getMapNameInfo)

---- Core ----

function DDWin()
  local alivePlayers = getAlivePlayers()
  if isMapDD then
	if #alivePlayers == 1 then 
	  local account = getPlayerAccount(alivePlayers[1]) -- Last player alive receives the win on the map
	  if not (isGuestAccount(account)) then
	    mapWins = tonumber(getAccountData(account,mapNameDD)) or 0
	    setAccountData(account,mapNameDD,mapWins+1) -- Sets 1 more win to the player
		setAccountData(account,"namePlayer",getPlayerName(alivePlayers[1]))
	  end
	end
  end
end		
addEventHandler("onPlayerWasted", getRootElement(), DDWin)

---- Sort Information to Map TopWins ----

function topwins()
local allAccounts = getAccounts()
local sendTable = {}
local data = 0
	for k,v in ipairs(allAccounts) do
		--local name = getAccountName(v)
		local name = tostring(getAccountData(v,"namePlayer"))
		local mapWins = tonumber(getAccountData(v,mapNameDD)) or 0
			data = tonumber(getAccountData(v,mapNameDD) or 0)or 0
			
			if(data>0)then
				table.insert(sendTable,{["playerName"] = name,["Value"] = data})
			end
	end
	table.sort(sendTable,function(a,b) return tonumber(a["Value"] or 0)>tonumber(b["Value"] or 0) end)
	table.setMaxIndex(sendTable,10)
	triggerClientEvent(client,"onClientReceiveTopListTable",client,sendTable)
end
addEvent("onMapStarting")
addEventHandler("onMapStarting", getRootElement(), topwins)
addEvent("onTopPlayerListRequest",true)
addEventHandler("onTopPlayerListRequest", getRootElement(), topwins)

function table.setMaxIndex(t,n)
	if(#t>n)then 
		while(#t>n)do
			table.remove(t)
		end
	end
end

---- Debug ----

--[[function testarcenas(thePlayer)
	local alivePlayers2 = getAlivePlayers()
	local account = getPlayerAccount(thePlayer)
	  if not (isGuestAccount(account)) then
	outputChatBox("#00CC00Is DD map:#ffffff "..tostring(isMapDD),thePlayer,255,255,255,true)
	outputChatBox("#00CC00Alive players count:#ffffff "..tostring(#alivePlayers2),thePlayer,255,255,255,true)
	outputChatBox("#00CC00Name of the map:#ffffff "..mapNameDD,thePlayer,255,255,255,true)
	outputChatBox ("#00CC00Times I won the map:#ffffff "..tostring(getAccountData(account,mapNameDD)),thePlayer,255,255,255,true)
	end
end
addCommandHandler("b",testarcenas)]]--