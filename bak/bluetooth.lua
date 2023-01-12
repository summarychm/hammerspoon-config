
--------------------------------------------------------------------------------------
--                                        蓝牙管理                                   --
--------------------------------------------------------------------------------------

-- 去掉字符串后面的空白字符
function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- 打开与关闭蓝牙，需要安装蓝牙工具 brew install blueutil
hs.hotkey.bind({'alt'}, 't', function()
  -- 打开或关闭蓝牙
  hs.execute("/opt/homebrew/bin/blueutil -p toggle")

  -- 检查蓝牙状态
  local state = trim(hs.execute("/opt/homebrew/bin/blueutil -p"))

  if state == "1" then
      hs.alert.show("蓝牙已打开")
  else
      hs.alert.show("蓝牙已关闭")
  end
end)

-- 系统事件监听回调函数，事件类型可参考 https://www.hammerspoon.org/docs/hs.caffeinate.watcher.html
-- 系统休眠时关闭蓝牙: https://gist.github.com/ysimonson/fea48ee8a68ed2cbac12473e87134f58
function watchCallback(event)
  -- 18 点后休眠时才自动关闭蓝牙
  local hour = os.date("*t").hour
  if event == hs.caffeinate.watcher.systemWillSleep and hour >= 18 then
      hs.execute("/opt/homebrew/bin/blueutil -p 0")
  end
end

watcher = hs.caffeinate.watcher.new(watchCallback)
watcher:start()


