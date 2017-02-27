---------------do not change or touch this----------
Names={}
Tags={}
Colors={}
ACL={}
--------------------------------------------------------------
 
---------------------------here put your clans read readme for instructions---------------------------------------
local names ={"Adrenaline Xtreme Nations","Team 1","K�zg�nlar","The No.Obs Team","Myth Crew","Revenge Of StronG","aXn Academy",">SpeeD<","Sad But True","End of Line","RacerS Crazy Zone","Exitus Team","Fatal Racers","Criminal Mind"}
local tags  ={"%-aXn%'","%[T1%]","%[K%]","%[o_O%]","%[MC%]","%-Ros%|","%-aXn%|","%>SpeeD%<","%SBT%-","%=EoL%|","%-Rcz%|","%Exitus%|","%{FR%}","%cM%'"}
local colors ={"#ff0000","#03568a","#ff00ff","#080c42","#0fc0ff","#ffff00","#d88200","#00ff00","#00ff00","#0000ff","#019019","#00ffff","#999999","#66ff00"}
local acls={"none","none","none","none","none","none","none","none","none","none","none","none","none","none"} --- put the acl name if you wanna check ACL group or "none" if you don't wanna check
 
-------- load------------
 
function loadTeams()
 for i,name in pairs(names) do
Names[i]=name
end
 
for i,tag in pairs(tags) do
Tags[i]=tag
end
 
for i,color in pairs(colors) do
Colors[i] = color
end
 
 
for i,acl in pairs(acls) do
ACL[i] = acl
end
 end
 
 
addEventHandler("onResourceStart",getRootElement(),loadTeams)
 
---------------------------------------------------
 
----- move on start------------------
 
function moveOnStart()
for i,player in pairs(getElementsByType("player")) do
check(player)
end
end
 
addEventHandler("onResourceStart",getRootElement(),moveOnStart)
-------------------------------------------------------------------------
 
-----------check----------------------------
 
function check (player)
setPlayerTeam(player,nil)
 for i,tag in pairs(tags) do
    if string.find(getPlayerName(player),tag) then
local account=getPlayerAccount(player)
   if ACL[i]~="none" and not  isObjectInACLGroup ( "user." ..getAccountName(account) , aclGetGroup ( ACL[i] ) ) then
return end
local name = Names[i]
local color = Colors[i]
  if  not getTeamFromName(name) then
createTeam(name,getColorFromString(color))
end
local team = getTeamFromName(name)
setPlayerTeam(player,team)
 
end
   end
      end
 
 
--------------------------------
 
 
----------remove Empty Team ----------
 
function remove()
 for t,teams in pairs(names) do
 local team = getTeamFromName(teams)
  if team then
     if  countPlayersInTeam ( team )==0 then
         destroyElement(team)
end
   end
       end
          end
 
-----------------------------------------------------
 
-------NickChange-------------
 
function nick(old,new)
setTimer(check,1000,1,source)
setTimer(remove,1500,1)
end
 
addEventHandler("onPlayerChangeNick",getRootElement(),nick)
---------------------------------------------
 
-------Join--------------------------------
 
function join()
setTimer(check,4000,1,source)
end
 
addEventHandler("onPlayerJoin",getRootElement(),join)
-------------------------------
 
---------Quit---------------------
 
function quit(player)
setTimer(remove,1000,1)
end
 
addEventHandler("onPlayerQuit",getRootElement(),quit)
------------------------------------
 
---------Login---------------------
 
function login()
setTimer(check,1000,1,source)
setTimer(remove,1500,1)
end
 
addEventHandler("onPlayerLogin",getRootElement(),login)
------------------------------------

---------Logout---------------------
 
function logout()
setTimer(check,1000,1,source)
setTimer(remove,1500,1)
end
 
addEventHandler("onPlayerLogout",getRootElement(),logout)
------------------------------------


----------blip--------------

function blip(player)

 local team = getPlayerTeam(player)
if team then
 for v,blip in pairs(getAttachedElements(player)) do
    if getElementType(blip)=="blip" then
          local r,g,b =getTeamColor(team)
             setBlipColor(blip,r,g,b,255)
         end
              end
                     end 
 end
   

function timer()
setTimer(blip,3000,1,source)
end

addEventHandler("onPlayerSpawn",getRootElement(),timer)

