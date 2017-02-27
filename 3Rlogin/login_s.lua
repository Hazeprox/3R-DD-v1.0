function loginHandler(player, username, password)
	if (username ~= "" and username ~= nil and password ~= "" and password ~= nil) then
		local account = getAccount(username, password)
		if (account ~= false) then
			if (logIn(player, account, password) == true) then
				showServerNotifications1(player,"Success","You successfuly logged in!",46,204,113) -- getRootElement()
				triggerClientEvent (player, "hideLoginWindow", getRootElement())
				triggerClientEvent(player,"savexml",player,username,password)
			else
				triggerClientEvent (player, "loggedIn", getRootElement())
			end
		else
			triggerClientEvent (player, "loginWrong", getRootElement())
		end
	else
		showServerNotifications1(player,"Error","Please enter a username and/or password!",192,57,43)
	end
end

function registerHandler(player, username, password)
	if (username ~= "" and username ~= nil and password ~= "" and password ~= nil) then
		local account = getAccount(username, password)
		if (account ~= false) then
			triggerClientEvent(player, "registerTaken", getRootElement())
		else
			account = addAccount(username, password)
			if (logIn(player, account, password) == true) then
				showServerNotifications1(player,"Success","You registered an account and logged in!",46,204,113)
				triggerClientEvent(player, "hideLoginWindow", getRootElement())
				triggerClientEvent(player,"savexml",player,username,password)
			else
				triggerClientEvent(player, "unknownError", getRootElement())
			end
		end
	else
		showServerNotifications1(player,"Error","Please enter a username and/or password!",192,57,43)
	end
end

addEvent("submitLogin", true)
addEvent("submitRegister", true)
addEventHandler("submitLogin", root, loginHandler)
addEventHandler("submitRegister", root, registerHandler)

addEventHandler ( "onPlayerCommand", root,
function (cmd)
    if ( cmd == "logout" ) then
        showServerNotifications1(source,"Error","You can't logout.",192,57,43)
    cancelEvent ()
    end
end
)
----------- Utility functions -----------

function callClientFunction(client, funcname, ...)
    local arg = { ... }
    if (arg[1]) then
        for key, value in next, arg do
            if (type(value) == "number") then arg[key] = tostring(value) end
        end
    end
    -- If the clientside event handler is not in the same resource, replace 'resourceRoot' with the appropriate element
    triggerClientEvent(client, "onServerCallsClientFunction", resourceRoot, funcname, unpack(arg or {}))
end

function showServerNotifications1(toClient,titleText,detailsText,colorRed,colorGreen,colorBlue)
	if toClient then
		callClientFunction(toClient,"createNotification1",titleText,detailsText,colorRed or false,colorGreen or false,colorBlue or false)
	end
end