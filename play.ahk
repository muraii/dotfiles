#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This allows me to quickly enter date and time stamps.
:*?:]dd::
FormatTime, TimeString, , yyMMdd ; LongDate
Send, %TimeString%
Return

:*?:]t::
FormatTime, TimeString, , HHmm
Send, %TimeString%
Return

:*?:]dt::
FormatTime, TimeString, , yyMMdd HHmm
Send, %TimeString%
Return

#T::
;run C:\Windows\System32\wscript.exe "C:\Users\Daniel\Utilities\terminator.vbs"
run C:\Users\Daniel\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminal_8wekyb3d8bbwe\wt.exe --maximized
Sleep 1500
WinActivate, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
Return

#F::
run C:\Users\Daniel\AppData\Local\fman\fman.exe
Sleep 4500
WinActivate fman
Return

^!g::
InputBox, searchTerm, Search the stuff!, Enter search thing,,,,,,,,existential
run %A_ProgramFiles%\Mozilla Firefox\firefox.exe "https://duckduckgo.com/?q=%searchTerm%"
Return

^!l::
InputBox, userURL, Go to a web place!, Enter your URL,,,,,,,,duckduckgo.com
run %A_ProgramFiles%\Mozilla Firefox\firefox.exe "%userURL%"
Return

Capslock::Ctrl