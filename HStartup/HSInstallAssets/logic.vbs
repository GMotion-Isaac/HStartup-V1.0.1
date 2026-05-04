Set sh = CreateObject("WScript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")

base = fs.GetParentFolderName(WScript.ScriptFullName)
audio = fs.BuildPath(base, "HSsound.wav")

If fs.FileExists(audio) Then
    sh.Run "powershell -NoProfile -ExecutionPolicy Bypass -c ""(New-Object Media.SoundPlayer '" & audio & "').PlaySync()""", 0, True
Else
    sh.Run "wscript.exe """ & base & "\HS-Troubleshooter.vbs"" ""crit"" ""HSsound.wav is missing from HStartupAssets.""", 0, True
    WScript.Quit 1
End If
