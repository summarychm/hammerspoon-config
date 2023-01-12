-- 监听文件夹变化,自动重载hammerspoon配置文件
-- 注册重载配置文件的快捷键
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)

-- 监听文件夹变化,自动重载hammerspoon配置文件
-- http://www.hammerspoon.org/go/#fancyreload
function reloadConfig(files)
    doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Hammerspoon Config Reloaded")
