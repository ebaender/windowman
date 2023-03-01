DebugOutput := false
Delay := 50
IgnoredWindowClasses := "(Progman|Windows.UI.Core.CoreWindow|XamlExplorerHostIslandWindow)"

MinimizeAllExceptActive()
{
    Sleep(Delay)
    WindowList := WinGetList(, , ,)
    LastActiveWindowID := WinGetID("A")
    DebugMessage := "filtered windows`n`n"
    for Window in WindowList
    {
        WindowTitle := WinGetTitle(Window)
        WindowID := WinGetID(Window)
        if (WindowTitle != "" and (WinExist(LastActiveWindowID) and WindowID != LastActiveWindowID) and WinExist(Window))
        {
            WindowClass := WinGetClass(Window)
            MatchResult := RegExMatch(WindowClass, IgnoredWindowClasses)
            if (MatchResult = 0)
            {
                WinMinimize(Window)
            }
            DebugMessage := DebugMessage MatchResult " / " WindowClass " / " WindowTitle "`n`n"
        }
    }
    DebugMessage := DebugMessage "`nlast active window`n`n" WinGetTitle(LastActiveWindowID)
    if (DebugOutput)
    {
        MsgBox(DebugMessage)
    }
}
