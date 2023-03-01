Width := 1000
Height := 600
WidthMaximized := 1328
HeightMaximized := 704
TaskbarHeight := 24

Initialize()
{
    if (A_ScreenHeight <= 1080)
    {
        global Width := 1280
        global Height := 880
        global WidthMaximized := 1880
        global HeightMaximized := 1000
    }
    else if (A_ScreenHeight <= 1440)
    {
        global Width := 1440
        global Height := 960
        global WidthMaximized := 2528
        global HeightMaximized := 1360
    }
}

TransformAndCenter(WinTitle, NewWidth := 0, NewHeight := 0)
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

Initialize()
return

!Esc:: TransformAndCenter("A", , ,)
!+Esc:: TransformAndCenter("A", Width, Height,)
!^Esc:: TransformAndCenter("A", WidthMaximized, HeightMaximized,)
!`:: WinClose "A"
!+`:: ToggleMinimized("A")
!^`:: ToggleMaximized("A")
