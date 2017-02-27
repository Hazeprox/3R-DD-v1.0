-------------
-- STREAM
--------------
----Searching -----
local text = 0
function generateTmpName ()
	return tostring(math.random(1000,9999999))
end
function readData( data,err,player )
	local pos = string.find(data,"<tbody class=\"js_album\">")
	local _,endS = string.find(data,"</tbody>")
	local tmpFile = generateTmpName()
	local musicData
	if pos and endS then
		local fi = fileCreate(tmpFile)
		fileWrite(fi,string.sub(data,pos,endS))
		fileClose(fi)
		musicData = fetchMusicData(tmpFile)
	else
		musicData = {["no data found"]=true}
	end
	triggerClientEvent(player,"returnSearch",player,musicData)
end

function doSearch(text)
	fetchRemote("https://musicmp3.ru/search.html?text="..(text:gsub(" ","+")).."&all=songs",readData, "", false, client )
end
addEvent("doSearch",true)
addEventHandler("doSearch",getRootElement(),doSearch)
Albums = {
	
}
function fetchMusicData( tmpname)
	local musicData = {}
	local xml = xmlLoadFile(tmpname)
	local count = 0
	for _,node in pairs(xmlNodeGetChildren(xml)) do 
		local playID = ""
		for _,node2 in pairs(xmlNodeGetChildren(node)) do 
			  if xmlNodeGetAttribute(node2,"class") == "song__name song__name--search" then
				for _,data in pairs(xmlNodeGetChildren(node2)) do 
					nameedo = xmlNodeGetValue(data)
				end		
				elseif xmlNodeGetAttribute(node2,"class") == "song__play_button" then
				for _,data in pairs(xmlNodeGetChildren(node2)) do 
					playID = xmlNodeGetAttribute(data,"rel")
				end
				elseif xmlNodeGetAttribute(node2,"class") == "song__album song__album--search" then
				for _,data in pairs(xmlNodeGetChildren(node2)) do 
					songALBUM = xmlNodeGetAttribute(data,"href")
					table.insert ( Albums,{["ID"]=playID,["album"]=songALBUM})
				end
					elseif xmlNodeGetAttribute(node2,"class") == "song__artist song__artist--search" then
				if xmlNodeGetValue(node2) == "Various Artist" then
				artisto = " "
				musicData[artisto.."."..nameedo]=playID
				count=count+1
				else
				for _,data in ipairs (xmlNodeGetChildren(node2)) do 
				artisto = xmlNodeGetValue(data)
				musicData[artisto.." - "..nameedo]=playID
				count=count+1
				end
				end
			end
		end
	end
	xmlUnloadFile(xml)
	fileDelete(tmpname)
	if count == 0 then
		musicData["no result ( please be more specific , album name / feat. etc ..)"]=true
	end
	return musicData
end

----SongData-Time----

function fetchSongDataTime( tmpname)
	local xml = xmlLoadFile(tmpname)
  songTIME = nil
  mirrorLinked = nil
	local tabled = {}
	for _,node in pairs(xmlNodeGetChildren(xml)) do 
    for _,node2 in pairs(xmlNodeGetChildren(node)) do 
	if xmlNodeGetAttribute(node2,"class") == "song__play_button"  then
	for _,noderel in pairs(xmlNodeGetChildren(node2)) do 
	mirrorLinked = xmlNodeGetAttribute(noderel,"rel")
	end
	end
	if xmlNodeGetAttribute(node2,"class") == "song__name"  then
	for _,node3 in pairs(xmlNodeGetChildren(node2)) do
	for _,node4 in pairs(xmlNodeGetChildren(node3)) do
		if mirrorLinked == currentTBID then
	 songTIME = xmlNodeGetAttribute(node4,"data-time")
	end
	end
	end
    end 
	end 
	end
	xmlUnloadFile(xml)
	fileDelete(tmpname)
	return songTIME
end

function getSongDataTime( data,err,player )
	local pos = string.find(data,"<tbody>")
	local _,endS = string.find(data,"</tbody>")
	local tmpFile = generateTmpName()
	if pos and endS then
		local fi = fileCreate(tmpFile)
		fileWrite(fi,string.sub(data,pos,endS))
		fileClose(fi)
		SongDataTime = fetchSongDataTime(tmpFile) or 1
		triggerClientEvent("updateSongName",root,currentTBoxtit,SongDataTime,songStreamer)
 if isTimer(streamer) then
 killTimer(streamer)
 end
 streamer = setTimer(function ()
currentTBoxtit = "Waiting.."
currentTBoxtitClient = "Waiting.."
 triggerClientEvent("onStreamOver",root,currentTBoxtit)
 triggerEvent("onStreamWantNextSong",root)
 end,(SongDataTime*1000)+1000,1)
end
end
--MusicQueue---------
musicQueue = {}
musicQueue3R = {}
----Streamit---------
currentTBoxtit = "None"
currentTBID = "None"
addingTimer = { }
function streammp3(sound,currentTitle,theID,typeAdd)
if typeAdd == "toMusicQueue" then
if not isTimer(clicking) then
theStreamerAcc = getPlayerAccount(source)
playermoney = getAccountData(theStreamerAcc,"money") or 0
if tonumber(playermoney) == 0 then
if not isTimer(addingTimer[source]) then
local name = tostring(getPlayerName( source ))
for _,V in ipairs (Albums) do
if V.ID == theID then
theAlbumLINK = V.album
currentTBID = theID
end
end
text = sound
currentTBoxtit = currentTitle
if (#musicQueue > 0 ) and (#musicQueue < 10 ) then
addingit = true
for _,V in ipairs (musicQueue) do
if currentTitle == V.name then
addingit = false
end
end
if (addingit) then
table.insert(musicQueue,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=name})
addingit3R = true
for _,V in ipairs (musicQueue3R) do
if currentTitle == V.name then
addingit3R = false
end
end
if (addingit3R) then
songStreamer = "3R random Queue"
table.insert(musicQueue3R,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=songStreamer})
end
outputChatBox("#FF0000♫#FFFFFF "..name.."#FFFFFF added : #FF0000"..currentTBoxtit,getRootElement(),255,0,0,true)
createServerNotification(source,"Music Queue","You have added a song to the queue!",0,150,0)
songStreamer = name
local streamerused = getAccountData(theStreamerAcc,"streamerused") or 0
setAccountData(theStreamerAcc, "streamerused", streamerused+1 )
setAccountData(theStreamerAcc, "money", playermoney - 0 )
setElementData(source,"Money",getAccountData(theStreamerAcc,"money"))
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
addingTimer[source] = setTimer(function () end ,5*60000,1,source)
else
createServerNotification(source,"Music Queue","This song is already in the queue.",150,0,0)
end
if (#musicQueue3R > 50 ) then
musicQueue3R = {}
end
elseif (#musicQueue > 9 ) then
outputChatBox("#FF0000♫#FFFFFF Music queue is full!",source,255,0,0,true)
createServerNotification(source,"Music Queue","The music queue is full!",150,0,0)
end
if (#musicQueue == 0 ) then
table.insert(musicQueue,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=name})
addingit3R = true
for _,V in ipairs (musicQueue3R) do
if currentTitle == V.name then
addingit3R = false
end
end
if (addingit3R) then
songStreamer = "3R random Queue"
table.insert(musicQueue3R,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=songStreamer})
end
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
outputChatBox("#FF0000♫#FFFFFF "..name.."#FFFFFF added : #FF0000"..currentTBoxtit,getRootElement(),255,0,0,true)
createServerNotification(source,"Music Queue","You have added a song to the queue!",0,150,0)
addingTimer[source] = setTimer(function () end ,5*60000,1,source)
if not isTimer(streamer) then
songStreamer = name
fetchRemote("https://musicmp3.ru"..theAlbumLINK.."#.VK1lsNKG90Y",getSongDataTime, "", false,getRootElement() )
outputChatBox("#FF0000♫#FFFFFF Now playing: #FF0000"..currentTBoxtit,getRootElement(),255,0,0,true)
triggerClientEvent(getRootElement(),"stream", getRootElement(), text)
triggerClientEvent("updateSongName", root, currentTBoxtit)
setAccountData(theStreamerAcc, "money", playermoney - 0 )
end
end
else
	remaining, executesRemaining, totalExecutes = getTimerDetails(addingTimer[source]) 
	if (remaining and executesRemaining and totalExecutes) then
	 if remaining < 60000 then
 theSeconds = math.floor(remaining/1000)
createServerNotification(source,"Music Queue","You have to wait "..theSeconds.." seconds to add another song!",150,0,0)
 elseif remaining > 60000 then
 theSeconds = math.floor(remaining / 60000 )
createServerNotification(source,"Music Queue","You have to wait "..theSeconds.." minute(s) to add another song!",150,0,0)
 end
end
end
else
createServerNotification(source,"Music Queue","You dont have enough money to add that song.",150,0,0)
end
else
clicking = setTimer(function () end ,1000,1)
end
elseif typeAdd == "to3RQueue" then
for _,V in ipairs (Albums) do
if V.ID == theID then
theAlbumLINK = V.album
currentTBID = theID
end
end
text = sound
currentTBoxtit = currentTitle
local name = tostring(getPlayerName( source ))
addingit3R = true
for _,V in ipairs (musicQueue3R) do
if currentTitle == V.name then
addingit3R = false
end
end
if (addingit3R) then
songStreamer = "3R random Queue"
table.insert(musicQueue3R,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=songStreamer})
end
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
end
end
addEvent("streammp3",true)
addEventHandler("streammp3",getRootElement(),streammp3)
addEvent("onStreamWantNextSong",true)
addEventHandler("onStreamWantNextSong",root,function ()
table.remove(musicQueue,1)
if (#musicQueue > 0 ) then
setTimer(function ()
text = musicQueue[1].ID
theAlbumLINK = musicQueue[1].album
currentTBoxtit = musicQueue[1].name
currentTBID = musicQueue[1].XID
songStreamer = musicQueue[1].streamer
fetchRemote("https://musicmp3.ru"..theAlbumLINK.."#.VK1lsNKG90Y",getSongDataTime, "", false,getRootElement() )
outputChatBox("#FF0000♫#FFFFFF Now playing: #FF0000"..currentTBoxtit,getRootElement(),255,0,0,true)
triggerClientEvent(getRootElement(),"stream", getRootElement(), text)
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
end,2000,1)
elseif (#musicQueue == 0 ) then
setTimer(function ()
randomSong = math.random(1,#musicQueue3R)
text = musicQueue3R[randomSong].ID
theAlbumLINK = musicQueue3R[randomSong].album
currentTBoxtit =musicQueue3R[randomSong].name
currentTBID = musicQueue3R[randomSong].XID
songStreamer = "3R random Queue"
table.insert(musicQueue,{["ID"]=text,["album"]=theAlbumLINK,["name"]=currentTBoxtit,["XID"]=currentTBID,["streamer"]=songStreamer})
text = musicQueue[1].ID
theAlbumLINK = musicQueue[1].album
currentTBoxtit = musicQueue[1].name
currentTBID = musicQueue[1].XID
songStreamer = musicQueue[1].streamer
fetchRemote("https://musicmp3.ru"..theAlbumLINK.."#.VK1lsNKG90Y",getSongDataTime, "", false,getRootElement() )
outputChatBox("#FF0000♫#FFFFFF Now playing: #FF0000"..currentTBoxtit,getRootElement(),255,0,0,true)
triggerClientEvent(getRootElement(),"stream", getRootElement(), text)
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
end,2000,1)
end
end)
addEvent("removeSongFromQueue",true)
addEventHandler("removeSongFromQueue",root,function (clickedTable,Table)
local playeraccount = getPlayerAccount(source)
if getAccountData(playeraccount,"clan") == "3RFDD" or getAccountData(playeraccount,"clan") == "3RDD" or getAccountData(playeraccount,"clan") == "3RDM" or getAccountData(playeraccount,"clan") == "3RShooter" then
if Table == 1 then
if (clickedTable == 1 ) then
triggerEvent("onStreamWantNextSong",root)
else
table.remove(musicQueue,clickedTable)
end
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
elseif Table == 2 then
table.remove(musicQueue3R,clickedTable)
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
end
outputChatBox("#FF0000♫ #FFFFFFA song has been skipped by "..getPlayerName(source),getRootElement(),255,255,255,true)
end
end)

function musiconjoin()
local playeraccount = getPlayerAccount(source)
if getAccountData(playeraccount,"clan") == "3RFDD" or getAccountData(playeraccount,"clan") == "3RDD" or getAccountData(playeraccount,"clan") == "3RDM" or getAccountData(playeraccount,"clan") == "3RShooter" then
triggerClientEvent(source,"updatePlayerRights",source)
else
triggerClientEvent(source,"removePlayerRights",source)
end
if isTimer(streamer) then
textClient = musicQueue[1].ID
theClientAlbumLINK = musicQueue[1].album
currentTBoxtitClient = musicQueue[1].name
songStreamerClient = musicQueue[1].streamer
triggerClientEvent(source,"stream", getRootElement(), textClient)
end
triggerClientEvent(source,"updateSongName",root,currentTBoxtitClient,SongDataTime,songStreamerClient)
triggerClientEvent("updateMusicQueue",getRootElement(),musicQueue,musicQueue3R)
end
addEventHandler("onPlayerLogin",getRootElement(), musiconjoin)

function streams(thePlayer)
if getAccountData(getPlayerAccount(thePlayer), "Streams") then
if getAccountData(getPlayerAccount(thePlayer), "Streams") == 0 then
setAccountData(getPlayerAccount(thePlayer), "Streams", 1)
setElementData(thePlayer, "Streams", 1)
outputChatBox("#FF0000[DJ] #FFFFFFStreams are muted!",thePlayer,255,0,0,true)
else
setAccountData(getPlayerAccount(thePlayer), "Streams", 0)
setElementData(thePlayer, "Streams", 0)
outputChatBox("#FF0000[DJ] #FFFFFFStreams are unmuted!",thePlayer,255,0,0,true)
end
else
setAccountData(getPlayerAccount(thePlayer), "Streams", 1)
setElementData(thePlayer, "Streams", 1)
outputChatBox("#FF0000[DJ] #FFFFFFStreams are muted!",thePlayer,255,0,0,true)
end
end
addCommandHandler("streams", streams)

function createServerNotification(elementType,notificationTitle,notificationDetail,redColor,greenColor,blueColor,notificationImage,customSound)
	if elementType then
		triggerClientEvent(elementType,"onServerCallNotification",getRootElement(),notificationTitle,notificationDetail,redColor or false,greenColor or false,blueColor or false,notificationImage or false,customSound or false)
	end
end
