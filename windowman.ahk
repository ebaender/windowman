#Include magnet.ahk
#Include deck.ahk

DetectHiddenWindows True

InitializeDisplayValues()
return

!Esc:: TransformAndCenter("A", , ,)
!+Esc:: TransformAndCenter("A", Width, Height,)
!^Esc:: TransformAndCenter("A", WidthMaximized, HeightMaximized,)
!`:: WinClose "A"
!+`:: ToggleMinimized("A")
!^`:: ToggleMaximized("A")

~Alt Up:: MinimizeAllExceptActive()

; ~^s:: Reload