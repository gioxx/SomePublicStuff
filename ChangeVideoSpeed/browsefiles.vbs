

    ''#region Header                                                                        '
    ''                                                                                      '
    ''  Name:                                                                               '
    ''                                                                                      '
    ''      Browse.vbs                                                                      '
    ''                                                                                      '
    ''  Description:                                                                        '
    ''                                                                                      '
    ''      Function to display folder and file selection browse dialogs.                   '
    ''                                                                                      '
    ''  Usage:                                                                              '
    ''                                                                                      '
    ''      folder = BrowseForFolder (title, options, startPath)                            '
    ''                                                                                      '
    ''          title:  dialog title bar text                                               '
    ''          options:    see ShellConsts.vbs                                             '
    ''          startPath:  see ShellConsts.vbs                                             '
    ''                                                                                      '
    ''          Returns a selected folder or ""                                             '
    ''                                                                                      '
    ''      file = BrowseForFile ()                                                         '
    ''                                                                                      '
    ''          Returns a selected file of ""                                               '
    ''                                                                                      '
    ''  Audit:                                                                              '
    ''                                                                                      '
    ''      2018-06-20  rj  Original code                                                   '
    ''                                                                                      '
    ''#end region                                                                           '
    Function BrowseForFolder (title, options, startPath)
        Dim shell: Set shell = CreateObject("Shell.Application")
        Dim item : Set item  = shell.BrowseForFolder(0, title, options, startPath)
        'If Cancel or Close is clicked, or no selection is made then the result is Nothing
        If item is Nothing Then
            BrowseForFolder = ""
        Else
            BrowseForFolder = item.Items().Item.Path
        End If
        
    End Function
    Function BrowseForFile()
        Dim wso: Set wso = CreateObject("Wscript.Shell")
        Dim hta: hta = """about:<input type=file id=file>"                          & vbcrlf _
                     & "<script>resizeTo(0,0);"                                     & vbCrLf _
                     & "   file.click();"                                           & VbCrLf _
                     & "   fso = new ActiveXObject('Scripting.FileSystemObject');"  & vbCrLf _
                     & "   fso.GetStandardStream(1).WriteLine(file.value);"         & vbCrLf _
                     & "   close();"                                                & VbCrLf _
                     & "</script>"""
        BrowseForFile = wso.Exec("mshta.exe " & hta).StdOut.ReadLine
    End Function
    ''Test code                                                                             '
    If StrComp(Wscript.ScriptName,"Browse.vbs") = 0 Then
        WScript.Echo "Folder=" & BrowseForFolder("Browse for folder",0,"")
        WScript.Echo "File  =" & BrowseForFile()
    End If
	
	WScript.Echo BrowseForFile()