
-- https://gist.github.com/rppig42/eb20337790cf17bb0d2c664d52351d5d
function logoutWechat(eventType)
  if (eventType == hs.caffeinate.watcher.screensDidSleep) then
      print("screensDidSleep")
      hs.osascript.applescript('tell application "WeChat" to quit')
  elseif (eventType == hs.caffeinate.watcher.screensDidLock) then
      --锁屏时似乎无法进行屏幕操作
      --print("screensDidLock")
      --hs.applescript(script)
  end
end
caffeinateWatcher = hs.caffeinate.watcher.new(logoutWechat)
caffeinateWatcher:start()