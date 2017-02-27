--------------
-- SOUND SYS
--------------
local sound
local screenW, screenH = guiGetScreenSize()
local isMusicShown = false
local musicEditBox = guiCreateEdit(((screenW - 447) / 2) - 80, ((screenH - 34) / 2) - 185, 447, 34, "", false)
guiSetVisible(musicEditBox,false)
guiEditSetMaxLength(musicEditBox,62)
local searchBarText = "Please enter a song and press 'search'"
local currentTitle = ""
local isButtonAnimation = false
local musicTable = {}
local musicData = {}
local soundVolume = 100
local soundPosition = 0
local scrollStartPos = 0
musicQueue = {}
musicQueue3R = {}
addingType = "toMusicQueue"
scroll = 1
Mqueue = 1
QueueFont = 0
circleDegre = 0
Mqueue3R = 1
Rights = false
QM = true
QM3R = false
local x,y = guiGetScreenSize()

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

function renderMusic()
	dxDrawRectangle((screenW - 623) / 2, ((screenH - 28) / 2) - 222, 623, 28, tocolor(255, 0, 0, 255), true)
	dxDrawRectangle((screenW - 623) / 2, (screenH - 414) / 2, 623, 414, tocolor(0, 0, 0, 170), false)
	dxDrawRectangle((screenW - 623) / 2, ((screenH - 28) / 2) + 222, 623, 28, tocolor(255, 0, 0, 255), true)
	local r,g,b
	if (isButtonAnimation) then
		r,g,b = 0,0,0
	else
		r,g,b = 255,0,0
	end
	dxDrawRectangle( ((screenW - 150) / 2) + 228,  ((screenH - 31) / 2) - 185, 151, 34, tocolor(r, g, b, 255), true)
	dxDrawRectangle(((screenW - 447) / 2) - 80, ((screenH - 34) / 2) - 185, 447, 34, tocolor(255, 255, 255, 255), true)
	dxDrawText(searchBarText, ((screenW - 437) / 2) - 75, ((screenH - 31) / 2) - 185, (((screenW - 437) / 2) - 75) + 437, ( ((screenH - 31) / 2) - 185) + 31, tocolor(0, 0, 0, 170), 1.00, "default-bold", "left", "center", false, false, true, false, false)
	dxDrawText("Search", ((screenW - 150) / 2) + 228, ((screenH - 35) / 2) - 185, (((screenW - 150) / 2) + 228) + 150, ( ((screenH - 35) / 2) - 185) + 35, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
	dxDrawText("3R MP3 Streamer", (screenW - 622) / 2, ((screenH - 29) / 2) - 222, ((screenW - 622) / 2) + 622, ( ((screenH - 29) / 2) - 222) + 29, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
	local count = 0
	if isCursorShowing() then
		for i = 0+scroll, 10+scroll do
			if musicTable[i] then
				count = count +1
				if isCursorOnElement(((screenW - 610) / 2) -2, ((screenH - 22) / 2) + (-172 + (count*32)), 610,33)  then
					dxDrawText("#FF0000♫#FFFFFF ( Buy for 5K ) "..musicTable[i], ((screenW - 610) / 2) -2, ((screenH - 22) / 2) + (-172 + (count*32)), (((screenW - 610) / 2) -2) + 610, ( ((screenH - 22) / 2) - 140) + 22, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, true, false)
				else
					if musicTable[i] == currentTitle then
						dxDrawText(musicTable[i], ((screenW - 610) / 2) -2, ((screenH - 22) / 2) + (-172 + (count*32)), (((screenW - 610) / 2) -2) + 610, ( ((screenH - 22) / 2) - 140) + 22, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, true, false, false)
					else
						dxDrawText(musicTable[i], ((screenW - 610) / 2) -2, ((screenH - 22) / 2) + (-172 + (count*32)), (((screenW - 610) / 2) -2) + 610, ( ((screenH - 22) / 2) - 140) + 22, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
					end
				end
			end
		end
	end
if (showingQueue) then
	if (isButtonAnimationQM3R) then
		QM3RColor = tocolor(0,255,0,255)
		QMColor = tocolor(255,0,0,255)
	else
		QM3RColor = tocolor(0,255,0,125)
		QMColor = tocolor(255,0,0,125)
	end
if (QM) then
dxDrawRectangle(0,screenH*0.06+QueueFont,180,30,QM3RColor)
dxDrawText(" 3R RDM QUE",5,screenH*0.06+QueueFont,screenW,screenH,tocolor(255,255,255,255),1.5,"default","left","top",false,false,false,true)
dxDrawText("#FF0000♫#FFFFFF Music Queue",0,screenH*0.02,screenW,screenH,tocolor(255,255,255,255),1.5,"default","left","top",false,false,false,true)
local countr = 0
QueueFont = 25
circleDegre = circleDegre +2
for I =0+Mqueue,4+Mqueue do
if musicQueue[I] then
countr = countr +1
if (Rights) then
if isCursorOnElement(screenW*0.01,screenH*0.02+10+(countr*19), screenW,10)  then
if I == 1 then
dxDrawText("#FF0000♫#FFFFFF Currently Playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01+15,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
elseif I == 2 then
dxDrawText("#FF0000♫#FFFFFF Next playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01+15,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
elseif (I > 2) and (I < 11) then
dxDrawText("#FF0000♫#FFFFFF "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01+15,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
end
dxDrawImage (screenW*0.01,screenH*0.02+10+(countr*19),15,15, 'img/remove.png', circleDegre, 0, 0 )
QueueFont = QueueFont+15
else
if I == 1 then
dxDrawText("#FF0000♫#FFFFFF Currently Playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
elseif I == 2 then
dxDrawText("#FF0000♫#FFFFFF Next playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
elseif (I > 2) and (I < 11) then
dxDrawText("#FF0000♫#FFFFFF "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
end
end
else
if I == 1 then
dxDrawText("#FF0000♫#FFFFFF Currently Playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
elseif I == 2 then
dxDrawText("#FF0000♫#FFFFFF Next playing : "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
elseif (I > 2) and (I < 11) then
dxDrawText("#FF0000♫#FFFFFF "..musicQueue[I].name.." #FFFFFF( "..musicQueue[I].streamer.."#FFFFFF )",screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
end
end
end
end
if #musicQueue == 10 then
dxDrawText(" #FFFFFF/",0,screenH*0.02,screenW,screenH,tocolor(255,255,255,255),1.5,"default","left","top",false,false,false,true)
end
elseif (QM3R) then
dxDrawRectangle(0,screenH*0.06+QueueFont,180,30,QMColor)
dxDrawText("Music Queue",5,screenH*0.06+QueueFont,screenW,screenH,tocolor(255,255,255,255),1.5,"default","left","top",false,false,false,true)

dxDrawText("#FF0000♫#FFFFFF 3R RDM QUE :",0,screenH*0.02,screenW,screenH,tocolor(255,255,255,255),1.5,"default","left","top",false,false,false,true)
local countr = 0
QueueFont = 25
circleDegre = circleDegre +2
for I =0+Mqueue3R,4+Mqueue3R do
if musicQueue3R[I] then
countr = countr +1
if (Rights) then
if isCursorOnElement(screenW*0.01,screenH*0.02+10+(countr*19), screenW,10)  then
dxDrawText("#FF0000♫#FFFFFF "..musicQueue3R[I].name,screenW*0.01+15,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
dxDrawImage (screenW*0.01,screenH*0.02+10+(countr*19),15,15, 'img/remove.png', circleDegre, 0, 0 )
QueueFont = QueueFont+15
else
dxDrawText("#FF0000♫#FFFFFF "..musicQueue3R[I].name,screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
end
else
dxDrawText("#FF0000♫#FFFFFF "..musicQueue3R[I].name,screenW*0.01,screenH*0.02+10+(countr*19),screenW,screenH,tocolor(255,255,255,255),1,"default","left","top",false,false,false,true)
QueueFont = QueueFont+15
end
end
end
end
end
end
function content()
	dxDrawAnimWindow (screenH*0.03, screenW, tocolor(255,0,0,255), "default-bold", "OutBounce")
end
function dxDrawAnimWindow(height,width,color,font,anim)
    local x,y = guiGetScreenSize()
 
    btwidth = width
    btheight = height/20
 
    local now = getTickCount()
    local elapsedTime = now
    local endTime = now + 1500
    local duration = endTime - now
    local progress = elapsedTime / duration
    local x1, y1, z1 = interpolateBetween ( 0, 0, 0, width, height, 255, progress, anim)
    local x2, y2, z2 = interpolateBetween ( 0, 0, 0, btwidth, btheight, btheight/11, progress, anim)
 
    posx = (x*0.1)-(x1*0.1)
    posy = (y*0.01)-(y1*0.01)
 
    dxDrawRectangle ( posx, posy-y2, x2, y2,tocolor(255,0,0,80 ))
	dxDrawRectangle ( posx, posy, x1, y1+QueueFont+10, tocolor ( 0, 0, 0,125 ) )   
	dxDrawRectangle ( posx, posy-y2,boxpercent(soundPosition/(SongENDTIME/100),x), y2*2, color )
end
function onEditBoxChange ()
	if #guiGetText(musicEditBox) == 0 then
		searchBarText = "Please enter a song and press 'search'"
	else
		searchBarText = guiGetText(musicEditBox)
	end
end


function onMusicClick(_,state)
	if state == "down" then
		if isCursorOnElement( ((screenW - 150) / 2) + 228, ((screenH - 35) / 2) - 185, 151, 34) then 
			local text = guiGetText(musicEditBox)
			if text and #text > 0 then
				triggerServerEvent("doSearch",getLocalPlayer(),text)
				destroyElement( musicEditBox)
				musicEditBox = guiCreateEdit(((screenW - 447) / 2) - 80, ((screenH - 34) / 2) - 185, 447, 34, "", false)
				addEventHandler("onClientGUIChanged",musicEditBox,onEditBoxChange)
				searchBarText = text
				guiSetText(musicEditBox,text)
				guiEditSetMaxLength(musicEditBox,62)
			end
		end
		for i = 1,11 do 
			if isCursorOnElement(((screenW - 610) / 2) -2, ((screenH - 22) / 2) + (-172 + (i*32)), 610,33)  then
			addingType = "toMusicQueue"
				if clickTable then
					if clickTable[i] then
						if musicTable[clickTable[i]] == "no result" then
							return 
						end
						currentTitle = musicTable[clickTable[i]]
						soundTOplayit = "https://listen2.musicmp3.ru/25ec56d6554b56b5/"..musicData[clickTable[i]]
						triggerServerEvent("streammp3",localPlayer,soundTOplayit,currentTitle,musicData[clickTable[i]],addingType)
					end
				end
			end
		end
		if (Rights) then
		for As = 1,5 do 
			if isCursorOnElement(screenW*0.01,screenH*0.02+10+(As*19), 15,10)  then
			if (showingQueue) then
			if (QM) then
			if clickTableQueue then
					if clickTableQueue[As] then
					theTable = 1
					triggerServerEvent("removeSongFromQueue",localPlayer,clickTableQueue[As],theTable)
					end
					end
			elseif (QM3R) then
						if clickTableQueue3R then
					if clickTableQueue3R[As] then
					theTable = 2
					triggerServerEvent("removeSongFromQueue",localPlayer,clickTableQueue3R[As],theTable)
					end
					end
			end
			end
			renewScollTableM()
			end
		end
		end
		if (showingQueue) then
		if isCursorOnElement(0,screenH*0.06+QueueFont,180,30)  then
		if (QM) then
		QM = false
		QM3R = true
		showingQueue = false
		showingT = setTimer(function () 
		showingQueue = true
		end,2000,1)
		elseif (QM3R) then
		QM = true
		QM3R=false
		showingQueue = false
		showingT = setTimer(function () 
		showingQueue = true
		end,2000,1)
		end
		renewScollTableM()
		end
		end
		if isCursorOnElement((screenW - 32) / 2, screenH*0.6 + 150, 32, 39) then
			if isElement(sound) then
				setSoundPaused(sound,not isSoundPaused(sound))
			end
		end
	end
end



function renewScollTableM ()
	clickTable = nil
	clickTable = {}
	clickTableQueue  = nil
	clickTableQueue = {}
		clickTableQueue3R  = nil
	clickTableQueue3R = {}
	local count = 0
	for i = 0+scroll, 10+scroll do
		if musicTable[i] then
			count = count + 1
			clickTable[count]=i
		end
	end
	if (showingQueue) then
	if (QM) then
	local count1 = 0
	for i = 0+Mqueue, 4+Mqueue do
		if musicQueue[i] then
			count1 = count1 + 1
			clickTableQueue[count1]=i
			end
	end
	elseif (QM3R) then
	local count3R1 = 0
	for i = 0+Mqueue3R, 4+Mqueue3R do
		if musicQueue3R[i] then
			count3R1 = count3R1 + 1
			clickTableQueue3R[count3R1]=i
	end
	end
	end
	end
end

function onSearchButtonHover()
	if isCursorOnElement( ((screenW - 150) / 2) + 228, ((screenH - 35) / 2) - 185, 151, 34) then 
		isButtonAnimation = true
	else
		isButtonAnimation = false
	end
end
function QM3RButton()
	if isCursorOnElement(0,screenH*0.06+QueueFont,180,30) then 
		isButtonAnimationQM3R = true
	else
		isButtonAnimationQM3R = false
	end
end


function MusicScrollDown()
	if (isMusicShown) then
		if isCursorOnElement((screenW - 623) / 2,screenH*0.37, 623, 300) then
			if scroll < #musicTable then
				scroll = scroll+1
				renewScollTableM()
				end
		elseif isCursorOnElement(screenW*0.01,screenH*0.02,screenW,screenH*0.02+QueueFont) then
		if (QM) then
		if Mqueue < #musicQueue then
		Mqueue = Mqueue+1
				renewScollTableM()
		end
		elseif (QM3R) then
		if Mqueue3R < #musicQueue3R then
				Mqueue3R = Mqueue3R+1
				renewScollTableM()
			end
			end
		end
	end
end
function MusicScrollUp()
	if isMusicShown then
		if isCursorOnElement((screenW - 623) / 2,screenH*0.37 , 623, 300) then
			if scroll > 1 then
				scroll = scroll-1
				renewScollTableM()
				end
			elseif isCursorOnElement(screenW*0.03,screenH*0.02,screenW,screenH*0.02+QueueFont) then
			if Mqueue > 1 then
			Mqueue = Mqueue-1
			renewScollTableM()
			end
			if Mqueue3R > 1 then
			Mqueue3R = Mqueue3R - 1
			renewScollTableM()
			end
		end
	end
end


bindKey("F7","down",function ()
if not (tostring(getElementData(getLocalPlayer(),"Arena")) == "Lobby" ) then
if not ((tostring(getElementData(getLocalPlayer(),"Opens")) == "UPANEL" ) or (tostring(getElementData(getLocalPlayer(),"Opens")) == "Lobby" )) then

	if (isMusicShown) then
	    removeEventHandler ( "onClientRender", getRootElement(), content )
		removeEventHandler("onClientRender",getRootElement(),renderMusic)
		removeEventHandler("onClientGUIChanged",musicEditBox,onEditBoxChange)
		removeEventHandler("onClientClick",getRootElement(),onMusicClick)
		removeEventHandler("onClientCursorMove",getRootElement(),onSearchButtonHover)
		removeEventHandler("onClientCursorMove",getRootElement(),QM3RButton)
		unbindKey("mouse_wheel_down","down",MusicScrollDown)
		unbindKey("mouse_wheel_up","down",MusicScrollUp)
		guiSetVisible(musicEditBox,false)
		isMusicShown = false
		showCursor(false)
		showChat(true)
		if isTimer(showingT) then
		destroyElement(showingT)
		end
				showingQueue = false
					setElementData(getLocalPlayer(),"Opens","NONE")
	else
	    	addEventHandler ( "onClientRender", getRootElement(), content )
		addEventHandler("onClientRender",getRootElement(),renderMusic)
		addEventHandler("onClientGUIChanged",musicEditBox,onEditBoxChange)
		addEventHandler("onClientClick",getRootElement(),onMusicClick)
		addEventHandler("onClientCursorMove",getRootElement(),onSearchButtonHover)
		addEventHandler("onClientCursorMove",getRootElement(),QM3RButton)		
		bindKey("mouse_wheel_down","down",MusicScrollDown)
		bindKey("mouse_wheel_up","down",MusicScrollUp)
		guiSetVisible(musicEditBox,true)
		guiSetInputMode("no_binds_when_editing")
		isMusicShown = true
		showCursor(true)
		showChat(false)
			setElementData(getLocalPlayer(),"Opens","STREAMER")
showingT = setTimer(function () 
		showingQueue = true
		end,2000,1)
end
end
end
end)
addEvent( "updateMusicQueue", true )
addEventHandler( "updateMusicQueue",getRootElement(),
    function(musicQueue0,musicQueue3R0)
musicQueue = musicQueue0
musicQueue3R = musicQueue3R0
renewScollTableM()
end
)
addEvent("updatePlayerRights", true )
addEventHandler("updatePlayerRights",getRootElement(),
    function()
Rights = true
end
)
addEvent("removePlayerRights", true )
addEventHandler("removePlayerRights",getRootElement(),
    function()
Rights = false
end
)


addEvent("returnSearch",true)
addEventHandler("returnSearch",getRootElement(),function (data)
	musicData = nil
	musicTable = nil
	musicData = {}
	musicTable = {}
	for name,id in pairs(data) do 
		table.insert(musicTable,name)
		table.insert(musicData,id)
	end
				scroll = 1
	renewScollTableM()
end)
local sx,sy = guiGetScreenSize()
TOGGLEBEAT = false
boxTitle = "Waiting.."
currentTIME = "00:00"
songStreamer = " "
SongENDTIME = 0
soundPosition = 0

function boxpercent(percent,maxvalue)
    if tonumber(percent) and tonumber(maxvalue) then
		local x = (percent * maxvalue ) /100
        return x
    end
    return false
end

addEvent( "onStreamOver", true )
addEventHandler( "onStreamOver",getRootElement(),
    function(CallingSong)
fonter = 0
currentTIME = "00:00"
SongENDTIME = 0
soundPosition = 0
songStreamer = " "
fonterSt = 0
boxX = 0
end)
 
addEvent("updateSongName",true)
addEventHandler("updateSongName",root, function(currentBoxtit,SongTIME,theStreamer)
boxTitle =currentBoxtit
displayNotification("Now Playing",boxTitle,0,150,0)
SongENDTIME = SongTIME
songStreamer = theStreamer
end)


addEvent("stream",true)
addEventHandler("stream", getRootElement(), function(text)
for i, s in ipairs(getElementsByType("sound")) do
destroyElement(s)
end
local silence = tonumber(getElementData(localPlayer,"Streams")) or 0
if silence == 0 then
sound = playSound(text,false)
setSoundVolume(sound, 1.0)
else
end
end)
addEventHandler("onClientRender",getRootElement(),function ()
if sound then
 soundPosition = getSoundPosition(sound)
  the2Points = "0:00"
 if soundPosition < 60 then
 theSeconds = math.floor(soundPosition)
 elseif soundPosition > 60 then
 Howmany60 = math.floor(soundPosition / 60 )
 theSeconds = soundPosition - (Howmany60*60)
 end
 if math.floor(theSeconds) < 10 then
 the2Points = ":0"
 elseif math.floor(theSeconds) > 9 then
 the2Points = ":"
 end
 currentTIME = math.floor(soundPosition/60)..""..the2Points..""..math.floor(theSeconds)
else
end
end)

bindKey("m","down",
    function()
	if getSoundVolume(sound) > 0 then
            setSoundVolume(sound,0)
outputChatBox("#FF0000[DJ] #ffffffSong muted !",255,255,255,true)
displayNotification("DJ","Song muted",150,0,0)
elseif getSoundVolume(sound) == 0 then
            setSoundVolume(sound,1)
outputChatBox("#FF0000[DJ] #ffffffSong unmuted !",255,255,255,true)
displayNotification("DJ","Song unmuted",0,150,0)
end
    end
)

addEvent("playwinner",true)
addEventHandler("playwinner",localPlayer, function(winner)

local wina = removeColorCoding(winner)
local lastwina = string.gsub(wina,"#","")
local sound = playSound("http://responsivevoice.org/responsivevoice/getvoice.php?tl=en-US&t="..lastwina.." has won this map",false)
setSoundVolume(sound, 1.0)
end)
function removeColorCoding (winner)
return type(winner)== "string" and string.gsub(winner, "#%x%x%x%x%x%x", "") or winner
end

addEvent("texttospeech",true)
addEventHandler("texttospeech", getRootElement(), function(command,language)
playSound("http://responsivevoice.org/responsivevoice/getvoice.php?tl=en-US&t="..command, false)
end)

addEvent("gay",true)
addEventHandler("gay", getRootElement(), function()
local sound = playSound("http://dl.dropboxusercontent.com/s/eyv6sjafc455q78/gay.mp3",false)
setSoundVolume(sound, 1.0)
end)

addEvent("life",true)
addEventHandler("life", getRootElement(), function()
local sound = playSound("http://dl.dropboxusercontent.com/s/y3q5tbob123fo2r/life.mp3",false)
setSoundVolume(sound, 1.0)
end)

--------------
-- NOTIFY SYS
--------------


local sX,sY = guiGetScreenSize()

local notification = {
	current = {},
	defaultTime = 10000,
	defaultColor = {0,0,0},
	tick = getTickCount(),
	font = "default-bold",
	maxSizeX = sX*0.3,
	postGUI = true,
}


function createNotification(notificationTitle,notificationDetail,redColor,greenColor,blueColor,notificationImage,customSound)
	if notificationTitle and notificationDetail then
		local _notification = {}
		_notification.title = notificationTitle
		_notification.detail = notificationDetail
		_notification.colors = {redColor or notification.defaultColor[1],greenColor or notification.defaultColor[2],blueColor or notification.defaultColor[3]}
		_notification.pos = {sX,0}
		_notification.titleFontSize = findFontSize(notification.font,sY*0.025)
		_notification.detailFontSize = findFontSize(notification.font,sY*0.020)
		_notification.sizeX = sX*0.01
		_notification.sizeY = 0
		local maxSizeX = notification.maxSizeX
		local titleX = dxGetTextWidth(_notification.title,_notification.titleFontSize,notification.font)
		local detailX = dxGetTextWidth(_notification.detail,_notification.detailFontSize,notification.font)
		if notificationImage then
			_notification.sizeX = sX*0.04
			_notification.posText = sX*0.045
			_notification.image = notificationImage
		else
			_notification.posText = sX*0.005
			_notification.image = false
		end
		local maxTextX = math.max(titleX,detailX)
		_notification.sizeX = math.min(_notification.sizeX+maxTextX,maxSizeX)
		local titleY = math.ceil(titleX/(_notification.sizeX-_notification.posText-sX*0.005))
		local detailY = math.ceil(detailX/(_notification.sizeX-_notification.posText-sX*0.005))
		_notification.sizeY = (titleY*sY*0.035)+(detailY*sY*0.025)+sY*0.015
		local posY = sY*0.01
		if #notification.current ~= 0 then
			posY = notification.current[#notification.current].pos[2]+notification.current[#notification.current].sizeY+sY*0.01
		end
		_notification.pos[2] = posY
		_notification.titleY = (titleY*sY*0.035)
		notification.tick = getTickCount()
		_notification.tick = getTickCount()
		table.insert(notification.current,_notification)
		if customSound then
			playSound(customSound,false)
		end
	end
end
addEvent("onServerCallNotification",true)
addEventHandler("onServerCallNotification",getRootElement(),createNotification)


function drawNotifications()
	if #notification.current ~= 0 then
		local toPos = 0
		for i,nData in pairs(notification.current) do
			if i ~= 1 then
				toPos = toPos + (sY*0.01) + notification.current[i-1].sizeY
			else
				toPos = sY*0.01
			end
			local tick = getTickCount() - notification.tick
			local progress = tick/500
			if progress>=1 then progress = 1 end
			nData.pos[2] = interpolateBetween(nData.pos[2],0,0,toPos,0,0,progress,"OutQuad")
			local tick = getTickCount() - nData.tick
			if tick<=1000 then
				local progress = tick/1000
				if progress>=1 then progress = 1 end
				local toPosX = (sX*0.5)-(nData.sizeX*0.5)
				nData.pos[1] = interpolateBetween(nData.pos[1],0,0,toPosX,0,0,progress,"OutQuad")
				dxDrawRectangle(nData.pos[1],nData.pos[2],nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],200),notification.postGUI)
				--dxDrawText(nData.title,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.005+2,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.005+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+sY*0.005+nData.titleY+1,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.005,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(255,255,255,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.01+nData.titleY+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+nData.sizeY-sY*0.005+1,tocolor(0,0,0,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.01+nData.titleY,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+nData.sizeY-sY*0.005,tocolor(255,255,255,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				local red,green,blue = unpack(nData.colors)
				local red,green,blue = math.min(red+20,255),math.min(green+20,255),math.min(blue+20,255)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2],tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1],nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2]+nData.sizeY,nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1]+nData.sizeX,nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				if nData.image then
					dxDrawRectangle(nData.pos[1],nData.pos[2],sX*0.04,nData.sizeY,tocolor(red,green,blue,255),notification.postGUI)
					dxDrawImage(nData.pos[1],nData.pos[2]+nData.sizeY/2-sX*0.02,sX*0.04,sX*0.04,nData.image,0,0,0,tocolor(255,255,255,255),notification.postGUI)
				end
			elseif tick>1000 and tick <=1000+notification.defaultTime then
				dxDrawRectangle(nData.pos[1],nData.pos[2],nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],150),notification.postGUI)
				--dxDrawText(nData.title,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.005+2,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.005+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+sY*0.005+nData.titleY+1,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.005,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(255,255,255,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.01+nData.titleY+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+nData.sizeY-sY*0.005+1,tocolor(0,0,0,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.01+nData.titleY,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+nData.sizeY-sY*0.005,tocolor(255,255,255,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				local red,green,blue = unpack(nData.colors)
				local red,green,blue = math.min(red+20,255),math.min(green+20,255),math.min(blue+20,255)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2],tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1],nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2]+nData.sizeY,nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1]+nData.sizeX,nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				if nData.image then
					dxDrawRectangle(nData.pos[1],nData.pos[2],sX*0.04,nData.sizeY,tocolor(red,green,blue,255),notification.postGUI)
					dxDrawImage(nData.pos[1],nData.pos[2]+nData.sizeY/2-sX*0.02,sX*0.04,sX*0.04,nData.image,0,0,0,tocolor(255,255,255,255),notification.postGUI)
				end
			elseif tick>1000+notification.defaultTime and tick<=2000+notification.defaultTime then
				local progress = (tick-notification.defaultTime-1000)/1000
				if progress>=1 then progress = 1 end
				local toPosX = sX
				nData.pos[1] = interpolateBetween(nData.pos[1],0,0,toPosX,0,0,progress,"InQuad")
				dxDrawRectangle(nData.pos[1],nData.pos[2],nData.sizeX,nData.sizeY,tocolor(nData.colors[1],nData.colors[2],nData.colors[3],150),notification.postGUI)
				--dxDrawText(nData.title,nData.pos[1]+nData.posText+2,nData.pos[2]+sY*0.005+2,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.005+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+sY*0.005+nData.titleY+1,tocolor(0,0,0,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.title,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.005,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+sY*0.005+nData.titleY,tocolor(255,255,255,255),nData.titleFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText+1,nData.pos[2]+sY*0.01+nData.titleY+1,nData.pos[1]+nData.sizeX-sX*0.005+1,nData.pos[2]+nData.sizeY-sY*0.005+1,tocolor(0,0,0,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				dxDrawText(nData.detail,nData.pos[1]+nData.posText,nData.pos[2]+sY*0.01+nData.titleY,nData.pos[1]+nData.sizeX-sX*0.005,nData.pos[2]+nData.sizeY-sY*0.005,tocolor(255,255,255,255),nData.detailFontSize,notification.font,"left","center",true,true,notification.postGUI)
				local red,green,blue = unpack(nData.colors)
				local red,green,blue = math.min(red+20,255),math.min(green+20,255),math.min(blue+20,255)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2],tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2],nData.pos[1],nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1],nData.pos[2]+nData.sizeY,nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				dxDrawLine(nData.pos[1]+nData.sizeX,nData.pos[2],nData.pos[1]+nData.sizeX,nData.pos[2]+nData.sizeY,tocolor(red,green,blue,255),1,notification.postGUI)
				if nData.image then
					dxDrawRectangle(nData.pos[1],nData.pos[2],sX*0.04,nData.sizeY,tocolor(red,green,blue,255),notification.postGUI)
					dxDrawImage(nData.pos[1],nData.pos[2]+nData.sizeY/2-sX*0.02,sX*0.04,sX*0.04,nData.image,0,0,0,tocolor(255,255,255,255),notification.postGUI)
				end
			else
				table.remove(notification.current,i)
				notification.tick = getTickCount()
			end
		end
	end
end
setTimer(function() addEventHandler("onClientRender",getRootElement(),drawNotifications) end,1000,1)


function findFontSize(dxFont,toSize)
	local fontSize = 0
	local relativeSize = 0
	local perLoop = 0.01
	repeat
		fontSize = fontSize+perLoop
		relativeSize = dxGetFontHeight(fontSize,dxFont)
	until relativeSize>=toSize
	fontSize = fontSize - perLoop
	return fontSize
end


