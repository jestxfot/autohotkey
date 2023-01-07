### Replacing words with a line (including quotation marks!)
```autohotkey
:*:WORD1:: {
    if WinActive("ahk_exe NAMEAPPS.exe") {
        Send 'STRING "WORD" STRING MORE'
    }
    else {
        Send "WORD1"
    }
}
```

### Running programs (shift + alt)
```autohotkey
!+a:: {
Run "PATH APPS"
}
```

### 3 or more hotkeys (ctrl + b + r + o)
```autohotkey
Ctrl & o:: {
    if GetKeyState("r")  {
        if GetKeyState("b")  {
        MsgBox "Hotkey activated"
        }
    }
}
```
