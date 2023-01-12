



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



-- 为当前活动窗口添加一个红色边框.
function redrawBorder()
  win = hs.window.focusedWindow()
  if win ~= nil then
      top_left = win:topLeft()
      size = win:size()
      if global_border ~= nil then
          global_border:delete()
      end
      global_border = hs.drawing.rectangle(hs.geometry.rect(top_left['x'], top_left['y'], size['w'], size['h']))
      global_border:setStrokeColor({
          ["red"] = 1,
          ["blue"] = 0,
          ["green"] = 0,
          ["alpha"] = 0.8
      })
      global_border:setFill(false)
      global_border:setStrokeWidth(4)
      global_border:show()
  end
end
redrawBorder()
allwindows = hs.window.filter.new(nil)
allwindows:subscribe(hs.window.filter.windowCreated, function() redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowFocused, function() redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowMoved, function() redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowUnfocused, function() redrawBorder() end)





