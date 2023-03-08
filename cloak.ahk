targetTitles := ["SteamVR Status"]
isWaitingForTargets := true

StopWaitingForTargets()
{
    isWaitingForTargets := false
}

WaitForHidingTargets()
{
    while (isWaitingForTargets)
    {
        for index, title in targetTitles
        {
            if (WinWaitActive(title))
            {
                WinHide
                TrayTip("Window `"" title "`" has been hidden.")
            }
        }
    }
}