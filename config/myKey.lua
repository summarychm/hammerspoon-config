-- 学习 https://seanxp.com/2016/05/mac-hammerspoon/
-- 来源 https://liuhao.im/chinese/2017/06/02/%E4%BD%BF%E7%94%A8Hammerspoon%E8%87%AA%E5%8A%A8%E5%8C%96%E5%B7%A5%E4%BD%9C%E6%B5%81.html
--- A closure function
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end
--- quick open applications
hs.hotkey.bind({"alt"}, "E", open("Finder"))
hs.hotkey.bind({"alt"}, "W", open("WeChat"))
hs.hotkey.bind({"alt"}, "C", open("Google Chrome"))
hs.hotkey.bind({"alt"}, "T", open("iTerm"))
hs.hotkey.bind({"alt"}, "V", open("Code"))
hs.hotkey.bind({"alt"}, "M", open("NeteaseMusic"))

-- --   
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

-- -- 获取当前运行程序的SourceID
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

