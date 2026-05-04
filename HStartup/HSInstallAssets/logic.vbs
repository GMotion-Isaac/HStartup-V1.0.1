Dim oPlayer, fso, strPath

Set fso = CreateObject("Scripting.FileSystemObject")
strPath = fso.GetParentFolderName(WScript.ScriptFullName)

Set oPlayer = CreateObject("WMPlayer.OCX")
oPlayer.URL = strPath & "\sound.wav"

oPlayer.controls.play

Do Until oPlayer.playState = 1
    WScript.Sleep 100
Loop