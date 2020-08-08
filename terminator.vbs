' terminator.vbs
myCd = "~"
If WScript.Arguments.Length > 0 Then
    myCd = "'$(wslpath -u '" & WScript.Arguments(0) & "')'"
End If
args = "bash" & " -c ""cd " & myCd & "; DISPLAY=:0 terminator -f"""
WScript.CreateObject("Shell.Application").ShellExecute "C:\Windows\System32\wsl.exe", args, "", "open", 0
