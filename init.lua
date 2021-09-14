-- hammerspoon
require "config.window-management"
require "config.key-binding" -- 设置程序在屏幕上的显示位置(基于config.window-management)
require "config.myKey"
require "config.myEvent"
local speech = require 'hs.speech'


-- -- Private use
-- if (hs.host.localizedName() == 'kaboom的MacBook Pro') then
-- 	require("autoscript.autoscript")
-- end


-- Init speaker. 如果弹窗提示,则说明脚本没有问题
speaker = speech.new()
hs.notify.new({title="Manatee", informativeText="Andy, I am online!"}):send()
-- Speak something after configuration success.
-- speaker:speak("Andy, I am online!")


