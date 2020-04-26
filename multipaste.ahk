/* 
    MULTIPASTE: 
    An AutoHotKey function which allows you to copy & paste 
    a group of items (holds up to 3 containers) 
    To store TEXT [this program has only been tested with text]
    simply hold the following key combination: 
    control c 1/2/3 then use control v 1/2/3 to paste 
    - note: there is not a guarantee that what you have already copied 
    will not be overwritten 
*/ 
; multipaste.ahk 

container1 = 
container2 = 
container3 = 

; perhaps I should use functions to accomplish DRY code 

; container1
#if getkeystate("ctrl")
c & 1:: 
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    container1 = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard 
    TrayTip, Multipaste, c1: %container1%, 15
    return 

#if getkeystate("ctrl")
v & 1:: 
    ; note: I can either do Send, ^v which will paste the clipboards    
    ; current contents, but because we restore the previous existing 
    ; clipboard contents, this will interfere with the existing copy/paste
    ; mechanics, therefore I have opted to literally type the contents of 
    ; the container into the input field (note: this program is only
    ; expected to work with text) 
    TrayTip, Multipaste, c1: %container1%, 15
    Send, %container1%
    return 
    
; container2
#if getkeystate("ctrl")
c & 2:: 
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    container2 = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard
    TrayTip, Multipaste, c2: %container2%, 15
    return 

#if getkeystate("ctrl")
v & 2:: 
    ; note: I can either do Send, ^v which will paste the clipboards    
    ; current contents, but because we restore the previous existing 
    ; clipboard contents, this will interfere with the existing copy/paste
    ; mechanics, therefore I have opted to literally type the contents of 
    ; the container into the input field (note: this program is only
    ; expected to work with text) 
    Send, %container2%
    TrayTip, Multipaste, c2: %container2%, 15
    return 

; container3
#if getkeystate("ctrl")
c & 3:: 
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    container3 = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard
    TrayTip, Multipaste, c3: %container3%, 15
    return 

#if getkeystate("ctrl")
v & 3:: 
    ; note: I can either do Send, ^v which will paste the clipboards    
    ; current contents, but because we restore the previous existing 
    ; clipboard contents, this will interfere with the existing copy/paste
    ; mechanics, therefore I have opted to literally type the contents of 
    ; the container into the input field (note: this program is only
    ; expected to work with text) 
    Send, %container3%
    TrayTip, Multipaste, c3: %container3%, 15
    return 
    
/* 
#Persistent
OnClipboardChange("ClipChanged")
return

ClipChanged(Type) {
    ToolTip Clipboard data type: %Type%
    Sleep 1000
    ToolTip  ; Turn off the tip.
}
*/ 

; https://www.autohotkey.com/docs/commands/GetKeyState.htm 
; https://www.autohotkey.com/boards/viewtopic.php?t=6312 
/* 
#if getkeystate("ctrl")
c & 2::
    ; MsgBox, copy 
    ; MouseGetPos, xpos, ypos 
    ; Click, xpos, ypos 
    ; Click, xpos, ypos 
    ; Send, ^C 
    tmp = %ClipboardAll% ; save clipboard
    ; MsgBox, TMP: %tmp%
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    selection = %Clipboard% ; save the content of the clipboard
    ; MsgBox, SELECTION: %selection% 
    Clipboard = %tmp% ; restore old content of the clipboard
    ; MsgBox, OLD CLIPBOARD: %Clipboard%
    ; return selection
    return 
; c & 3::
*/ 

/*
^+v:: 
    MsgBox, paste 
*/
/* 
^+c2:: 
    MsgBox, cop2

^+v2::
    MsgBox, paste2 
*/ 