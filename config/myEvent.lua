
-- 休眠时退出微信
-- https://gist.github.com/rppig42/eb20337790cf17bb0d2c664d52351d5d
function logoutWechat(eventType)
  if (eventType == hs.caffeinate.watcher.screensDidSleep) then
    hs.osascript.applescript('tell application "WeChat" to quit')
  end
end
caffeinateWatcher = hs.caffeinate.watcher.new(logoutWechat)
caffeinateWatcher:start()

-- -- 开机默认静音
-- hs.audiodevice.findDeviceByName('Built-in Output'):setOutputMuted(true)