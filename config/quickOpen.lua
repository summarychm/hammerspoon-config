-- 快速打开应用程序

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
hAlt={"alt"}
-- quick open applications
hs.hotkey.bind(hAlt, "E", open("Finder"))
hs.hotkey.bind(hAlt, "C", open("Google Chrome"))
hs.hotkey.bind(hAlt, "T", open("iTerm"))
hs.hotkey.bind(hAlt, "V", open("Visual Studio Code"))
hs.hotkey.bind(hAlt,"N",open("Microsoft OneNote"))
hs.hotkey.bind(hAlt, "W", open("微信"))
hs.hotkey.bind(hAlt, "X", open("XMind"))
hs.hotkey.bind(hAlt,"D",open("大象"))
hs.hotkey.bind(hAlt,"Y",open("网易有道词典"))

---------    快速打开应用程序  end        ------------ 