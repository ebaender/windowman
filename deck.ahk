DeckDebugOutput := false
DeckDelay := 50
DeckIgnoredWindowClasses := "(Progman|Windows.UI.Core.CoreWindow|XamlExplorerHostIslandWindow|ApplicationFrameWindow)"
MinimizeLocked := true

UnlockMinimize()
{
    global MinimizeLocked := false
}

MinimizeAllExceptActive()
{
    if (MinimizeLocked)
    {
        return
    }

    Sleep(DeckDelay)
    WindowList := WinGetList(, , ,)
    LastActiveWindowID := WinGetID("A")
    DebugMessage := "filtered windows`n`n"

    for Window in WindowList
    {
        WindowTitle := WinGetTitle(Window)
        WindowID := WinGetID(Window)
        WindowUID := WinExist(Window)

        if (DllCall("IsWindowVisible", "Ptr", WindowUID) and
            WindowUID and
            WindowTitle != "" and
            (WinExist(LastActiveWindowID) and WindowID != LastActiveWindowID))
        {
            WindowClass := WinGetClass(Window)
            MatchResult := RegExMatch(WindowClass, DeckIgnoredWindowClasses)
            if (MatchResult = 0)
            {
                WinMinimize(Window)
            }
            DebugMessage := DebugMessage MatchResult " / " WindowClass " / " WindowTitle "`n`n"
        }
    }

    global MinimizeLocked := true

    if (WinExist(LastActiveWindowID))
    {
        DebugMessage := DebugMessage "`nlast active window`n`n" WinGetTitle(LastActiveWindowID)
    }

    if (DeckDebugOutput)
    {
        MsgBox(DebugMessage)
    }
}