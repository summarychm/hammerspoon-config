-- hammerspoon
print('==================================================')
require "config.window-management"
require "config.key-binding" -- 设置程序在屏幕上的显示位置(基于config.window-management)
require "config.myKey"
require "config.myEvent"
local speech = require 'hs.speech'

-- Init speaker.
speaker = speech.new()
-- -- Private use
-- if (hs.host.localizedName() == 'kaboom的MacBook Pro') then
-- 	require("autoscript.autoscript")
-- end




-- 重载通知,如果弹窗提示,则说明脚本没有问题
hs.notify.new({title="Manatee", informativeText="Andy, I am online!"}):send()
-- Speak something after configuration success.
-- speaker:speak("Andy, I am online!")


