Sub CheckPrerequisite()
    On Error Resume Next
    
    Dim objShell 'As WshShell
    Set objShell = CreateObject("WScript.Shell")
      
    Dim fs 'As FileSystemObject
    Set fs = CreateObject("Scripting.FileSystemObject")
    fs.DeleteFile("CheckPrerequisite_Result.txt")
    
    Dim ExeProc 'As WshExec
    Set ExeProc = objShell.Exec("git.exe")
    If ExeProc Is Nothing Then
        MsgBox "Please install git for windows first!", vbCritical, "msvcr14x"
        objShell.Run ("https://git-scm.com/download/win")
        Exit Sub
    End If
    
    Dim VS_EDITION
    VS_EDITION = objShell.Environment("Process").Item("VS_EDITION")
    If Len(VS_EDITION) = 0 then
       VS_EDITION = "Enterprise"
    End If
    
    While fs.FolderExists("C:\Program Files\Microsoft Visual Studio\2022\" & VS_EDITION) = False
        If MsgBox("Please install Visual Studio 2022 " & VS_EDITION & " edition first!", vbCritical Or vbYesNo Or vbDefaultButton1, "msvcr14x") <> vbYes Then
            Exit Sub
        End If
        objShell.Run ("https://visualstudio.microsoft.com/zh-hans/thank-you-downloading-visual-studio/?sku=" & VS_EDITION & "&rel=17")
    Wend
    
    While fs.FolderExists("C:\Program Files\Microsoft Visual Studio\2022\" & VS_EDITION & "\VC\Tools\MSVC") = False
        If MsgBox("Please check 'Desktop development with C++' in Visual Studio 2022 Installer first!", vbCritical Or vbYesNo Or vbDefaultButton1, "msvcr14x") <> vbYes Then
            Exit Sub
        End If
        objShell.Exec ("C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe")
    Wend
    
    While fs.FolderExists("C:\Program Files\Microsoft Visual Studio\2022\" & VS_EDITION & "\VC\Tools\MSVC") = False
        If MsgBox("Please check 'Desktop development with C++' in Visual Studio 2022 Installer first!", vbCritical Or vbYesNo Or vbDefaultButton1, "msvcr14x") <> vbYes Then
            Exit Sub
        End If
        objShell.Exec ("C:\Program Files (x86)\Microsoft Visual Studio\Installer\vs_installer.exe")
    Wend
    
    While fs.FolderExists("C:\Program Files (x86)\Windows Kits\10\Source\10.0.26100.0\ucrt") = False
        If MsgBox("Please install Windows 11 SDK (10.0.26100.0) first!", vbCritical Or vbYesNo Or vbDefaultButton1, "msvcr14x") <> vbYes Then
            Exit Sub
        End If
        objShell.Run ("https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/")
    Wend
    
    Dim ts 'As TextStream
    Set ts = fs.CreateTextFile("CheckPrerequisite_Result.txt")
    ts.Write ("True")
    ts.Close
End Sub

CheckPrerequisite