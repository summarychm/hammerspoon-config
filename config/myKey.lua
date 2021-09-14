-- window management
local application = require "hs.application"
local hotkey = require "hs.hotkey"
local window = require "hs.window"
local layout = require "hs.layout"
local grid = require "hs.grid"
local hints = require "hs.hints"
local screen = require "hs.screen"
local alert = require "hs.alert"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local mouse = require "hs.mouse"

hyper = {"cmd", "ctrl", "alt"}
hyperShift = {"alt", "shift"}
hyperCtrl = {"alt", "ctrl"}
hyperAlt = {"ctrl", "alt", "shift"}
hAlt={"alt"}

-- default 0.2
window.animationDuration = 0

---------    将光标切换到外接屏幕上  begin        ------------ 
hs.hotkey.bind(hyper, 'n', function()
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)
 
    hs.mouse.setAbsolutePosition(center)
end)
---------    将光标切换到外接屏幕上  end        ------------ 



---------    快速打开应用程序  begin        ------------ 
-- 来源 https://liuhao.im/chinese/2017/06/02/%E4%BD%BF%E7%94%A8Hammerspoon%E8%87%AA%E5%8A%A8%E5%8C%96%E5%B7%A5%E4%BD%9C%E6%B5%81.html
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end
-- quick open applications
hs.hotkey.bind(hAlt, "E", open("Finder"))
hs.hotkey.bind(hAlt, "C", open("Google Chrome"))
hs.hotkey.bind(hAlt, "T", open("iTerm"))
hs.hotkey.bind(hAlt, "V", open("Visual Studio Code"))
hs.hotkey.bind(hAlt, "M", open("QQ音乐"))
hs.hotkey.bind(hAlt,"N",open("Microsoft OneNote"))
hs.hotkey.bind(hAlt, "W", open("微信"))
hs.hotkey.bind(hAlt, "X", open("XMind"))
hs.hotkey.bind(hAlt,"D",open("大象"))

---------    快速打开应用程序  end        ------------ 

---------    自动切换应用的默认语言  begin        ------------ 
-- 
-- local function Chinese()
--     hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
-- end
  
-- local function English()
--     hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
-- end

-- local function set_app_input_method(app_name, set_input_method_function, event)
--     event = event or hs.window.filter.windowFocused
--     hs.window.filter.new(app_name)
--       :subscribe(event, function()
--                 set_input_method_function()
--             end)
-- end
  
-- set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
-- set_app_input_method('Spotlight', English, hs.window.filter.windowCreated)
-- set_app_input_method('Alfred', English, hs.window.filter.windowCreated)
-- set_app_input_method('Emacs', English)
-- set_app_input_method('iTerm2', English)
-- set_app_input_method('Google Chrome', English)
-- set_app_input_method('WeChat', Chinese)
---------    自动切换应用的默认语言  end        ------------ 



---------    获取当前运行程序的SourceID  begin        ------------ 
-- 
-- hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
--     hs.alert.show("App path:        "
--           ..hs.window.focusedWindow():application():path()
--           .."\n"
--           .."App name:      "
--           ..hs.window.focusedWindow():application():name()
--           .."\n"
--           .."IM source id:  "
--           ..hs.keycodes.currentSourceID())
-- end)
---------    获取当前运行程序的SourceID  end        ------------ 