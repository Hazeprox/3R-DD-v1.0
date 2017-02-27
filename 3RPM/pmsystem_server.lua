function privateMessage(thePlayer,commandName,sendToName,...)
	local pmWords = { ... }
	local pmMessage = table.concat( pmWords, " " )
	if sendToName then
		if (getPlayerFromParticalName (sendToName)) then
		toPlayer = (getPlayerFromParticalName (sendToName))
			if not (toPlayer == thePlayer) then
				if not (pmMessage == "") then
					outputChatBox("#FFFF00[PM] Message to #FFFFFF" .. getPlayerName(toPlayer) .. "#FFFFFF: " .. pmMessage, thePlayer, 255, 255, 255, true)
					outputChatBox("#FFFF00[PM] Message from #c8c8c8" .. getPlayerName(thePlayer) .. "#FFFFFF: " .. pmMessage, toPlayer, 255, 255, 255, true)
					outputChatBox("#FFFF00[PM] #00FF00Use /reply  [text] to answer", toPlayer, 255, 255, 255, true)
					setElementData(thePlayer,"pmPartner",toPlayer)
					setElementData(toPlayer,"pmPartner",thePlayer)
				else
					outputChatBox("#FFFF00[PM]Use:#c8c8c8 /pm [part of name] [message]", thePlayer, 255, 255, 255, true)
					return false
				end
			else
				outputChatBox("#FFFF00[PM]#c8c8c8 You cannot PM yourself #FF0000!", thePlayer, 255, 255, 255, true)
				return false
			end
		else
			outputChatBox("#FFFF00[PM]#c8c8c8 Player not found! #FFFF00[#c8c8c8"..sendToName.."#FFFF00]", thePlayer, 255, 255, 255, true)
			return false
		end
	else
		outputChatBox("#FFFF00[PM]Use:#c8c8c8 /pm [part of name] [message]", thePlayer, 255, 255, 255, true)
		return false
	end
end
addCommandHandler("pm", privateMessage)

function privateMessageReply(thePlayer,commandName,...)
	local pmWords = { ... }
	local pmMessage = table.concat( pmWords, " " )
	local toPlayer = getElementData(thePlayer,"pmPartner")
			if toPlayer then 
				if not (pmMessage == "") then
					outputChatBox("#FFFF00[PM] Answer to #c8c8c8" .. getPlayerName(toPlayer) .. "#FFFFFF: " .. pmMessage, thePlayer, 255, 255, 255, true)
					outputChatBox("#FFFF00[PM] Answer from #c8c8c8" .. getPlayerName(thePlayer) .. "#FFFFFF: " .. pmMessage, toPlayer, 255, 255, 255, true)
					outputChatBox("#FFFF00[PM] #00FF00Use /reply  [text] to answer", toPlayer, 255, 255, 255, true)
				else
					outputChatBox("#FFFF00[PM]Use:#c8c8c8 /reply [message]", thePlayer, 255, 255, 255, true)
					return false
				end
			else
			outputChatBox("#FFFF00[PM]There is no pm partner", thePlayer, 255, 255, 255, true)
			end
end
addCommandHandler("reply", privateMessageReply)


function getPlayerFromParticalName(thePlayerName)
	local thePlayer = getPlayerFromName(thePlayerName)
	if thePlayer then
		return thePlayer
	end
	for _,thePlayer in ipairs(getElementsByType("player")) do
		if string.find(string.gsub(getPlayerName(thePlayer):lower(),"#%x%x%x%x%x%x", ""), thePlayerName:lower(), 1, true) then
			return thePlayer
		end
	end
return false
end

