#MaxThreadsPerHotkey 2

; Array with Keys to Clone
keysArray := ["1","2", "3", "4", "5", "6", "7", "8", "9", "0", "=", "-","x","y", "~h", "Space","Tab", "Shift", "NumPad1","NumPad2","NumPad3", "NumPad4", "NumPad5", "NumPad6","NumPad7", "NumPad8", "NumPad9"]
; https://www.autohotkey.com/docs/Hotkeys.htm#Symbols for prefixes

Loop % keysArray.Length()
    subscribeKey(keysArray[A_Index])

callBackReg(){
    WinGet, wowid, List, World of Warcraft
    KeyWait, %A_ThisHotkey%, D
    ControlSend,, {%A_ThisHotkey%}, ahk_id %wowid1%
    ControlSend,, {%A_ThisHotkey%}, ahk_id %wowid2%
    ControlSend,, {%A_ThisHotkey%}, ahk_id %wowid3%
    ControlSend,, {%A_ThisHotkey%}, ahk_id %wowid4%
    ControlSend,, {%A_ThisHotkey%}, ahk_id %wowid5%
    ; extend to how many windows you want {todo - add conditionals}
}

subscribeKey(keyN){
    Hotkey, %keyN%, callBackReg
    Return
}

; TOGGLE
ToggleR := 0
WinGet, wowid, list, World of Warcraft
r::
    KeyWait, r, D
    ToggleR := !ToggleR
    While ToggleR {
        ControlSend,, {r}, ahk_id %wowid1%
        ControlSend,, {r}, ahk_id %wowid2%
        ControlSend,, {r}, ahk_id %wowid3%
        ControlSend,, {r}, ahk_id %wowid4%
        ControlSend,, {r}, ahk_id %wowid5%
        Sleep, 150
    }
Return

PgDn::Suspend

