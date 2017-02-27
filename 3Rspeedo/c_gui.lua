---| EDITED By RamiReZ
    g_GuiLabel = { }
     
    function GuiShow()
        if g_Settings.Visible then
            g_GuiLabel.Speed:visible(true)
            g_GuiLabel.Unit:visible(true)
        end
    end
    addEventHandler("onClientScreenFadedIn", root, GuiShow)
     
     
    function GuiHide()
        g_GuiLabel.Speed:visible(false)
        g_GuiLabel.Unit:visible(false)
    end
    addEventHandler("onClientScreenFadedOut", root, GuiHide)
     
     
    function GuiInitialize()
        local screenWidth, screenHeight = guiGetScreenSize()
     
        g_GuiLabel.Speed = dxText:create("0", screenWidth-130, screenHeight - 110, false, "default-bold", 1.5, "right")
        g_GuiLabel.Speed:color(255,0,0)
       
        g_GuiLabel.Unit = dxText:create("KM/H", screenWidth-125, screenHeight - 110, false, "default-bold", 1.5, "left")
        g_GuiLabel.Unit:color(255,255,255)
       
        GuiHide()
    end
    GuiInitialize()