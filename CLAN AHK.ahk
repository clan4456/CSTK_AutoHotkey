#Persistent
#SingleInstance,force
Menu, Tray, NoStandard
programName:="CLAN AutoHotkey"
Menu, Tray, Click, 1 
Menu, Tray, Add, About, OnClick
Menu, Tray, Add, Exit, OnExit
Menu, Tray, Default, About
Menu, Tray, Tip, %programName%

return
OnExit:
    ExitApp
return

OnClick:
    if !LastClick 
    {
        LastClick := 1
        LastTC := A_TickCount
        SetTimer,SingleClickEvent,-300
    }
    else if (A_TickCount-LastTC<300)
    {
        SetTimer,SingleClickEvent,off
        gosub,DoubleClickEvent
    }
return

programIntro:=TEST
SingleClickEvent:
    gosub, MsgBox_CLAN
    LastClick := 0
return

DoubleClickEvent:
    gosub, MsgBox_CLAN
    LastClick := 0
return

MsgBox_CLAN:
    MsgBox 64, %programName%, CLAN AutoHotkey`nBy CLAN Studio`n`n`n`n[CapsLock] -> [Enter]`n[Shift] + [CapsLock] -> [CapsLock]`n`n[Shift] + [MouseWheel] -> [Scroll Left/Right]`n`n[Shift] + [Ctrl] + [Alt] + [Arrow] -> [Arrow] * 12
Return

$CapsLock::Enter
$+CapsLock::CapsLock

$+WheelUp::WheelLeft
$+WheelDown::WheelRight

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