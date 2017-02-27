local enabled = false
myShader = nil
function checkWaterColor()
	if myShader then
		local r,g,b,a = getWaterColor()
		dxSetShaderValue ( myShader, "sWaterColor", r/255, g/255, b/255, a/255 );
	end
end
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		myShader, tec = dxCreateShader ( "water.fx" )
		if not myShader then
			outputChatBox( "Could not create shader. Please use debugscript 3" )
		else
			local textureVol = dxCreateTexture ( "shadersfile/smallnoise3d.dds" );
			local textureCube = dxCreateTexture ( "shadersfile/cube_env256.dds" );
			dxSetShaderValue ( myShader, "microflakeNMapVol_Tex", textureVol );
			dxSetShaderValue ( myShader, "showroomMapCube_Tex", textureCube );
		end
	end
)

function toggleWaterShader (bool)
	if bool == true then
	    enabled = bool
		waterTimer = setTimer ( checkWaterColor, 1000, 0 )
		engineApplyShaderToWorldTexture ( myShader, "waterclear256" )
	else
	    enabled = bool
		killTimer ( waterTimer )
		engineRemoveShaderFromWorldTexture ( myShader, "waterclear256" )
	end
end
