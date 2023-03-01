TransformAndCenter(WinTitle, NewWidth := 0, NewHeight := 0, TaskbarHeight := 24)
{
    if (WinExist(WinTitle))
    {
        WinGetPos &X, &Y, &Width, &Height, WinTitle
        if (NewWidth != 0)
        {
            Width := NewWidth 
        }
        if (NewHeight != 0)
        {
            Height := NewHeight
        }
        X := (A_ScreenWidth / 2) - (Width / 2)
        Y := (A_ScreenHeight / 2) - (Height / 2)
        WinRestore WinTitle
        WinMove X, Y - TaskbarHeight, Width, Height, WinTitle
    }
}

ToggleMaximized(WinTitle)
{
    if (WinExist(WinTitle))
    {
        MaximizedState := WinGetMinMax(WinTitle)
        if (MaximizedState = 0)
        {
            WinMaximize(WinTitle)
        }
        else if (MaximizedState = 1)
        {
            WinRestore(WinTitle)
        }
    }
}

ToggleMinimized(WinTitle)
{
    if (WinExist(WinTitle))
    {
        MaximizedState := WinGetMinMax(WinTitle)
        if (MaximizedState = -1)
        {
            WinRestore(WinTitle)
        }
        else if (MaximizedState = 0)
        {
            WinMinimize(WinTitle)
        }
    }
}

!Esc::TransformAndCenter("A",,,)
!+Esc::TransformAndCenter("A", 1440, 960,)
!^Esc::TransformAndCenter("A", 1880, 1000,)
!`::WinClose "A"
!+`::ToggleMinimized("A")
!^`::ToggleMaximized("A")