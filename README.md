### Replacing words with a line (including quotation marks!)
```autohotkey
:*:WORD1:: {
    If WinActive("ahk_exe NAMEAPPS.exe") {
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
