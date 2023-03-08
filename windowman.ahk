#Include magnet.ahk
#Include deck.ahk
#Include cloak.ahk

; Initialization

DetectHiddenWindows True

InitializeDisplayValues()
WaitForHidingTargets()

return


; Magnet hotkeys

!Esc:: TransformAndCenter("A", , ,)
!+Esc:: TransformAndCenter("A", Width, Height,)
!^Esc:: TransformAndCenter("A", WidthMaximized, HeightMaximized,)

!`:: ToggleMinimized("A")
!+`:: WinClose "A"
!^`:: ToggleMaximized("A")


; Deck hotkeys

; ~!Tab:: UnlockMinimize()
; ~Alt Up:: MinimizeAllExceptActive()


; Debugging hotkeys

; ~^s:: Reload