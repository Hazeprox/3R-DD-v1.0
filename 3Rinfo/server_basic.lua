--------------
-- SERVER SPAM
--------------

message = {
"#FF0000[Server] #C0C0C0Welcome To 3R DD 1.0 Beta Server ,Have Fun.",
"#FF0000[Server] #C0C0C0Press F5 To Open Top Wins.",
"#FF0000[Server] #C0C0C0NOTICE! you have to be logged in to save your tops in top wins.",
"#FF0000[Server] #C0C0C0Visit Our Site www.3-R.me.",
"#FF0000[Server] #C0C0C0You Can Change Your Nos Mode By Typing /nos normal - /nos nfs - /nos hybird.",
"#FF0000[Server] #C0C0C0To Disable Our Music Press M",
"#FF0000[Server] #C0C0C0To Disable Smokes Press O",
"#FF0000[Server] #C0C0C0Current Beta Version Has No (stream system/userpanel/Clan System) Wait The OFFICIAL DD1.0 soon! ",
}
function getAds ()
random1 = math.random(1, #message) 
outputChatBox(message[random1], getRootElement(), 250,0,0, true)
end
 
setTimer(getAds, 30000, 0)

function createServerNotification(elementType,notificationTitle,notificationDetail,redColor,greenColor,blueColor,notificationImage,customSound)
	if elementType then
		triggerClientEvent(elementType,"onServerCallNotification",getRootElement(),notificationTitle,notificationDetail,redColor or false,greenColor or false,blueColor or false,notificationImage or false,customSound or false)
	end
end