-- 窗口管理
local wm = require "config.windowManagementTools"
local hk = require "hs.hotkey"

-- * Key Binding Utility
--- Bind hotkey for window management.
-- @function windowBind
-- @param {table} hyper - hyper key set
-- @param { ...{key=value} } keyFuncTable - multiple hotkey and function pairs
--   @key {string} hotkey
--   @value {function} callback function
local function windowBind(hyper, keyFuncTable)
    for key, fn in pairs(keyFuncTable) do
        hk.bind(hyper, key, fn)
    end
end

-- * 设置当前程序在屏幕上的位置
windowBind({"ctrl", "alt", "cmd"}, {
    m = wm.maximizeWindow, -- ⌃⌥⌘ + M 当前窗口最大化
    -- c = wm.centerOnScreen,    -- ⌃⌥⌘ + C 将窗口置于屏幕中央,最大化
    c = moveFocusedWindow, -- ⌃⌥⌘ + C 将窗口置于屏幕中央,最大化
    left = wm.leftHalf, -- ⌃⌥⌘ + ← 窗口居左半屏
    right = wm.rightHalf, -- ⌃⌥⌘ + → 窗口居右半屏
    up = wm.topHalf, -- ⌃⌥⌘ + ↑ 窗口居上半屏
    down = wm.bottomHalf -- ⌃⌥⌘ + ↓ 窗口居下半屏
})
-- * 每次缩放10%
windowBind({"ctrl", "cmd", "shift"}, {
    left = wm.rightToLeft, -- ⌃⌥⇧ + ←
    right = wm.rightToRight, -- ⌃⌥⇧ + →
    up = wm.bottomUp, -- ⌃⌥⇧ + ↑
    down = wm.bottomDown -- ⌃⌥⇧ + ↓
})
-- * Set Window Position on screen
windowBind({"alt", "cmd", "shift"}, {
    left = wm.leftToLeft, -- ⌥⌘⇧ + ←
    right = wm.leftToRight, -- ⌥⌘⇧ + →
    up = wm.topUp, -- ⌥⌘⇧ + ↑
    down = wm.topDown -- ⌥⌘⇧ + ↓
})
