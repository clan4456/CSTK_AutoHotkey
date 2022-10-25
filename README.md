# CLAN Studio Toolkits - AutoHotkey

下载地址：[CLAN AHK.exe](https://github.com/clan4456/CSTK_AutoHotkey/releases/download/v1.0.0.1/CLAN%20AHK.exe)

SHA-256：64089534c29f18a46b3b5aa23e6429d4b582a0ad62fd4967d1d1cd71e3a1e650

## 1. 前言

LabVIEW快速开发中，QuickDrop占据了很重要的位置，可以毫不夸张地说，掌握了QuickDrop+VIScript，可以把你的LabVIEW开发效率提高至少一倍以上。但本文并不是QuickDrop或VIScript的教程，而是分享一个辅助QuickDrop的键盘小工具。

在一般使用QuickDrop的流程中，都是使用QuickDrop快捷键（默认Ctrl+Shift+Space）拉起QuickDrop窗口，然后在窗口中输入函数/控件快捷键，并按下回车，再通过鼠标放置到合适位置。

![Snipaste_2022-10-24_18-05-06.png](http://pic2.clan4456.com/clan-picgo-core/images/2022/10/24/Snipaste_2022-10-24_18-05-06-479182ce3c4056fa4d47d259fcfc0621.png!small)

那么问题来了，LabVIEW是一个G语言开发环境，需要大量的鼠标操作。正常情况下需要右手抓着鼠标，左手通过快捷键拉起QuickDrop，输入函数/控件快捷键，问题就是按下回车了，是要把左手离开快捷键位置来按呢，还是右手离开鼠标来按呢？对于一个习惯偷懒的开发者来说，无论左手还是右手来按都不符合开发者的偷懒原则，也不优雅。

为了解决这个痛点，保持一个开发者应有的优雅且偷懒的习惯，就需要一个键盘键位调整工具了。

## 2. AutoHotkey简介

AutoHotkey 是一款 windows 平台下的热键脚本语言程序。可以实现诸如窗口置顶、快速输入、快捷操作等丰富多彩的功能。

能够通过自定义脚本实现很多快捷、自动化操作，乃至创建图形界面程序，而且占用资源极小，是一个能够高度自定义、可用性极高的工具。

官网：[https://autohotkey.com/](https://autohotkey.com/)

## 3. 自用脚本

![Snipaste_2022-10-25_11-45-37.png](http://pic2.clan4456.com/clan-picgo-core/images/2022/10/25/Snipaste_2022-10-25_11-45-37-3166db0bdaf61948d6214ec2c416fd5a.png!small)

### 3.1 CapsLock替换成Enter

把左边最不常用的CapsLock按键替换成Enter，原来的CapsLock功能用Shift+CapsLock代替。这样可以完美解决按Enter问题。在整个使用QuickDrop放置的过程中，左右手无需离开原有位置即可完成操作。

```autohotkey
$CapsLock::Enter
$+CapsLock::CapsLock
```

### 3.2 鼠标滚轮方向切换

虽然LabVIEW框图提倡不要过大，一个屏幕显示完是最好的。但日常开发过程中，不可避免框图超出屏幕的情况出现，特别是当你需要修改屎山时。如果框图过大，需要滚动窗口查看时，就需要鼠标滚轮操作了。但不是所有鼠标都支持左右滚轮，当使用这种鼠标并需要左右滚动时，就只能把鼠标移动到右下方的左右滚动条来拉动了。这显然也不符合一个开发者的优雅且偷懒的原则。因此使用Shift键来改变鼠标滚动方向是最好的选择了。默认情况下滚动鼠标滚轮是上下滚动。按下Shift键再滚动鼠标滚轮，则更改为左右滚动。

```autohotkey
$+WheelUp::WheelLeft
$+WheelDown::WheelRight
```

### 3.3 快速栅格对齐前面板控件

LabVIEW前面板对齐栅格默认是12px，正常情况下，利用LabVIEW自带的对齐工具可以很方便地对齐前面板控件。也可以鼠标拖动控件对齐到栅格上。但总有那么些时候需要保持控件间的间距为12px，但又无法对齐到栅格上。对于有强迫症的开发者，相差1px都不能忍啊。因此需要手动调整间距，以方便移动控件的间隔为12px。选中控件后，方向键按一下是1px，12px需要重复按动12下。因此利用此脚本，按下Shift+Ctrl+Alt+方向按键一次，脚本实际上按下对应的方向按键12次，以满足移动12px的需求。

```autohotkey
$!+^Right::
    loop,12
    {
        Send {Right}
    }
    Return

$!+^Left::
    loop,12
    {
        Send {Left}
    }
    Return

$!+^Up::
    loop,12
    {
        Send {Up}
    }
    Return

$!+^Down::
    loop,12
    {
        Send {Down}
    }
    Return
```

## 4. 使用方法

### 4.1 运行脚本

安装[AutoHotkey环境](https://www.autohotkey.com/download/ahk-install.exe)后，下载本仓库的 `CLAN AHK.ahk` 直接双击运行即可。

### 4.2 运行exe文件

如不想安装AutoHotkey环境，则可选择下载本仓库Releases中已生成好的exe文件，双击运行即可。该exe可执行文件使用AutoHotkey自带的转换工具转换。

## 5. 已知bug

暂未发现

## 6. 开源许可

本工具遵循MIT开源协议，可任意分发或二次开发使用。
