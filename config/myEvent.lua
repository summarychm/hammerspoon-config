
-- 系统事件监听回调函数，事件类型可参考 https://www.hammerspoon.org/docs/hs.caffeinate.watcher.html
function watcherCallBack(eventType)
    local hour = os.date("*t").hour
    -- 19点后,休眠前退出微信 https://gist.github.com/rppig42/eb20337790cf17bb0d2c664d52351d5d
    if (eventType == hs.caffeinate.watcher.systemWillSleep and hour >= 19) then
        hs.osascript.applescript('tell application "WeChat" to quit')
    end
    -- 休眠前电脑静音
    if (eventType == hs.caffeinate.watcher.systemWillSleep) then
        hs.audiodevice.defaultOutputDevice():setMuted(true)
        -- hs.audiodevice.defaultOutputDevice():setVolume(0) -- 设置音量为0
    end
end
caffeinateWatcher = hs.caffeinate.watcher.new(watcherCallBack)
caffeinateWatcher:start()

---------    获取当前app的路径和输入Source ID，并自动添加到粘贴板  begin        ------------ 
hs.hotkey.bind({'ctrl', 'option'}, ".", function()
    local application = hs.window.focusedWindow():application()
    hs.alert.show(
        "App path:        " .. application:path() .. "\n" .. "App name:      " .. application:name() .. "\n" ..
            "IM source id:  " .. hs.keycodes.currentSourceID())

    local message = '{"appName":"' .. application:path() .. '","name":"' .. application:name() .. '","sourceId":"' ..
                        hs.keycodes.currentSourceID() .. '"}'
    hs.pasteboard.setContents(message)
    -- hs.pasteboard.setContents(hs.keycodes.currentSourceID())
end)

---------    获取当前app的路径和输入Source ID，并自动添加到粘贴板  end        ------------ 

-- 将当前窗口移动到其他屏幕中
function moveWindowToDisplay(d)
    return function()
        local displays = hs.screen.allScreens()
        local win = hs.window.focusedWindow()
        win:moveToScreen(displays[d], false, true)
    end
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "1", moveWindowToDisplay(1))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "2", moveWindowToDisplay(2))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "3", moveWindowToDisplay(3))


