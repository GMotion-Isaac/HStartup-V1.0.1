Dim args, shell, severity, message, title
Set args = WScript.Arguments
Set shell = CreateObject("WScript.Shell")

severity = 16 
title = "HStartup - System Error"

If args.Count >= 2 Then
    If args(0) = "warn" Then
        severity = 48 
        title = "HStartup - Warning"
    ElseIf args(0) = "crit" Then
        severity = 16 
        title = "HStartup - Critical Error"
    End If
    message = args(1)
End If

If args.Count = 3 Then
    message = message & vbCrLf & vbCrLf & "Verbose Status: " & args(2)
End If

MsgBox message, severity, title