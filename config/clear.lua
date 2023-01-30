-- 简写clear方法,方便控制台清空
clear = hs.console.clearConsole

-- 注册清屏快捷键
hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
    clear();
end)
