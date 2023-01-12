-- 多屏间光标切换
---------    将光标切换到外接屏幕上  begin        ------------ 
hs.hotkey.bind({"cmd", "ctrl", "alt"}, 'g', function()
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)

    hs.mouse.setAbsolutePosition(center)
    hs.alert.show('🐻‍❄️🦮🐶🦅🐘🦁', nextScreen, 0.2)
end)

---------    将光标切换到外接屏幕上  end        ------------ 

-------   在屏幕间移动程序 ctrl + x  begin  --------
-- 来源 http://qtdebug.com/mac-hammerspoon/
hs.hotkey.bind({'ctrl'}, 'x', function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:moveToScreen(screen:next(), 0)
    hs.eventtap.keyStroke({"ctrl", "alt", "cmd"}, "g") -- 移动光标
    -- -- 移动到其他屏幕后应用的标题包含 "RDP-Windows" 则全屏
    -- if string.find(win:title(), "RDP-Windows", 1, true) then
    --     win:setFullScreen(true)
    -- end
end)
-------   在屏幕间移动程序 ctrl + x  end  --------
