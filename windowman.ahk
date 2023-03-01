#Include centerpunch.ahk
#Include deck.ahk

~^\:: Reload

InitializeDisplayValues()
return

!Esc:: TransformAndCenter("A", , ,)
!+Esc:: TransformAndCenter("A", Width, Height,)
!^Esc:: TransformAndCenter("A", WidthMaximized, HeightMaximized,)
!`:: WinClose "A"
!+`:: ToggleMinimized("A")
!^`:: ToggleMaximized("A")

~Alt Up:: MinimizeAllExceptActiveWindow()