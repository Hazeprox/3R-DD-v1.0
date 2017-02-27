----| ---------- |-----
g_Root = getRootElement()
g_ResRoot = getResourceRootElement()

g_UnitMultiplier = { 
	kph = 1.8,
	mph = 1.1187
}

g_Settings = {
	Visible = true,
	Unit = "kph",
	SpeedMultiplier = 1
}


function toboolean(value)
	value = string.lower(tostring(value))
	if value == "off" or value == "false" or value == "0" then
		return false
	elseif value == "on" or value == "true" or value == "1" then
		return true
	end
	return nil
end

function SaveSettings()
	local xml = xmlCreateFile("c_settings.xml", "settings")
	if not xml then 
		return false 
	end

	local displayNode = xmlCreateChild(xml, "display")
	xmlNodeSetAttribute(displayNode, "visible", tostring(g_Settings.Visible))
	xmlNodeSetAttribute(displayNode, "unit", g_Settings.Unit)
	
	local ret = xmlSaveFile(xml)
	xmlUnloadFile(xml)
	return ret
end


function LoadSettings()
	local xml = xmlLoadFile("c_settings.xml")
	if not xml then
		onClientSettingChange()
		return false 
	end

	local displayNode = xmlFindChild(xml, "display", 0)
	g_Settings.Visible = (xmlNodeGetAttribute(displayNode, "visible") == "true")
	g_Settings.Unit = xmlNodeGetAttribute(displayNode, "unit")
	
	xmlUnloadFile(xml)
	
	onClientSettingChange()
	return true
end


function GetUnitText()
	if g_Settings.Unit == "kph" then
		return "km/h"
	end
	return g_Settings.Unit
end


function onClientSettingChange()
	g_GuiLabel.Unit:text(GetUnitText())
	g_Settings.SpeedMultiplier = g_UnitMultiplier[g_Settings.Unit]
end
--addEventHandler("onClientMapStarting", g_ResRoot, onClientSettingChange)


-- Command to set the NOS gauge visibility on/off
function consoleSetDisplayUnit(commandName, unit)
	if unit ~= "kph" and unit ~= "mph" then
		outputChatBox("Syntax: /speedunit [kph|mph]")
		return
	end
	
	if unit ~= g_Settings.Unit then
		g_Settings.Unit = unit
		g_Settings.SpeedMultiplier = g_UnitMultiplier[unit]
		onClientSettingChange()
		SaveSettings()
	end	
end
addCommandHandler("speedunit", consoleSetDisplayUnit)

function consoleSetSpeedoDisplay(commandName, display)
	local value = toboolean(display)
	if value == nil then
		outputChatBox("Syntax: /digitalspeedo [on|off]")
		return	
	end
	g_Settings.Visible = value
	if value then 
		showSpeedometer()
	else
		hideSpeedometer()
	end
	onClientSettingChange()
	SaveSettings()
end
addCommandHandler("digitalspeedo", consoleSetSpeedoDisplay)


addEvent("onClientRequestSpeedoSettings")
addEventHandler("onClientRequestSpeedoSettings", getLocalPlayer(), 
	function()
		local settings = { tag = "digital_speed", display = g_Settings.Visible, unit = g_Settings.Unit }
		triggerEvent("onClientGetSpeedoSettings", getLocalPlayer(), settings)
	end
)
