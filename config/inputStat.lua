---
--- 在状态栏中显示输入法的状态
--- 例如：大小写状态，中英文状态，目前只适配搜狗输入法
--- Created by sugood(https://github.com/sugood).
--- DateTime: 2020/10/24 11:12
---
local sougouId = 'com.sogou.inputmethod.sogou.pinyin'
local shuangpinId = 'com.apple.inputmethod.SCIM.Shuangpin'
local abcId = 'com.apple.keylayout.ABC'

local mEventtap -- shift按键监听
local reverse = true -- 中英文是否切换
local timer = nil

-- 是否中文输入法
function isChinese()
    local currentSourceID = hs.keycodes.currentSourceID()
    return (currentSourceID == sougouId or currentSourceID == shuangpinId)
end

-- 打印当前输入法stat
local showStat = function()
    hs.alert.closeAll(0)
    local val = ""
    if (isChinese()) then
        if reverse then
            reverse = false
            val = "英"
        else
            reverse = true
            val = "中"
        end
    else
        if hs.hid.capslock.get() == false then
            reverse = false
            val = "英"
        end
    end

    timer = hs.timer.delayed.new(0.2, function()
        hs.alert.show(val)
    end):start()
end

-- 解决hs.eventtap.new 有时候会卡死的问题。需要每秒检查下监听状态。如果卡死了就重新启动
local listenerEvent = function()
    if mEventtap:isEnabled() == false then
        print("重启监听事件")
        mEventtap:start()
    end
end

local gap = hs.timer.localTime(); -- 按键时的秒数
mEventtap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(event)
    local currt = hs.timer.localTime(); -- 按键时的秒数

    -- 获取shift按键信息
    if event:getKeyCode() == 56 and event:getFlags().shift then
        showStat()
        -- 如果同时按了其他辅助键,则不显示
    elseif (event:getKeyCode() ~= 56 and timer) then
        timer:stop();
    end
    gap = currt;
end);
mEventtap:start()
hs.timer.doEvery(1, listenerEvent) -- 有BUG,经常假死

-- 监听输入法切换
hs.keycodes.inputSourceChanged(function()
    listenerEvent()
    local currentSourceID = hs.keycodes.currentSourceID()
    -- 如果当前输入法和上一个输入法相同，则直接返回
    if currentSourceID == lastSourceID then
        return
    end
    local currentSourceID = hs.keycodes.currentSourceID()
    hs.alert.closeAll(0)
    -- 判断是系统自带的 ABC还是中文输入法
    if (currentSourceID == abcId) then
        hs.alert.show("ABC")
        reverse = false
    elseif (currentSourceID == sougouId or currentSourceID == shuangpinId) then
        showStat()
        reverse = true
    end
    -- 保存最后一个输入法源名称
    lastSourceID = currentSourceID
end)
