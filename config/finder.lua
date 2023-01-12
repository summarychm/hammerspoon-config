-- 激活访达时,前置所有访达窗口
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated and appName == "访达") then
        appObject:selectMenuItem({"窗口", "前置全部窗口"})
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
