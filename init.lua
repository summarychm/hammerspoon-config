-- hammerspoon
print('==================================================')
require "config.window-management"
require "config.key-binding"
-- require "config.weather"
require "config.myKey"
require "config.myEvent"
local speech = require 'hs.speech'

-- Init speaker.
speaker = speech.new()
-- -- Private use
-- if (hs.host.localizedName() == 'kaboom的MacBook Pro') then
-- 	require("autoscript.autoscript")
-- end
-- We put reload notify at end of config, notify popup mean no error in config.
-- hs.notify.new({title="Manatee", informativeText="Andy, I am online!"}):send()

-- Speak something after configuration success.
-- speaker:speak("Andy, I am online!")


