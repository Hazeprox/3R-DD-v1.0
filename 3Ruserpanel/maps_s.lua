for k,v in pairs(getResources()) do
	if string.find(getResourceName(v), "[DD]") or string.find(getResourceName(v), "dd") or string.find(getResourceName(v), "[TDD]") or string.find(getResourceName(v), "Cross") then
		local mapa = createElement("Maps")
		setElementData(mapa, "Maps", tostring(getResourceName(v)))
		setElementData(mapa, "Name", getMapName(tostring(getResourceName(v))))
	end
end