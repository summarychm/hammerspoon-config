require "config.windowManage" -- 窗口管理
require "config.screen" -- 多屏间光标切换
require "config.quickOpen" -- 快速启动程序
require "config.myEvent" -- 系统事件监听操作
require "config/inputStat" -- 输入法状态显示
require "config.reload" -- 重新加载配置文件
require "config.systemInfo" -- 菜单栏显示网络,cpu,磁盘信息
require "config.finder" -- 激活访达时,前置所有访达窗口
require "config.clear" -- 注册清屏快捷键




-- 调整 默认动画时间 default 0.2
window.animationDuration = 0

-- 载入成功提示
hs.notify.new({
    title = "Manatee",
    informativeText = "配置文件载入成功!"
}):send()
clear();








-- Init speaker. 如果弹窗提示,则说明脚本没有问题
-- local speech = require 'hs.speech'
-- speaker = speech.new()

-- Speak something after configuration success.
-- speaker:speak("Andy, I am online!")


