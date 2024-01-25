.MODEL small
.STACK 100h
.DATA
VALUE db ?,'$'
PlayerMSG db 'Manga:','$'
OpponentMSG db 'Hani:','$'
LINEMSG db '------------------------------------------------------------------------------','$'
EndMSG db 'To end chatting with     Press F3','$'

XR db 0   ;;length of the opponent player
YR db 0Dh
XT db 0   ;;length of the current player
YT db 1h

.CODE

MAIN PROC
mov ax,@DATA
mov ds,ax


 mov dx,3fbh ; Line Control Register
 mov al,10000000b ;Set Divisor Latch Access Bit
 out dx,al ;Out it
 ;Set LSB byte of the Baud Rate Divisor Latch register.
 mov dx,3f8h
 mov al,0ch
 out dx,al
 ;Set MSB byte of the Baud Rate Divisor Latch register.
 mov dx,3f9h
 mov al,00h
 out dx,al
 mov dx,3fbh
 mov al,00011011b
 out dx,al


mov ax,0003h
int 10h
;;Print Usernames And Lines (Modify Players usernames on it)
mov ah,2
mov dx,0000h
int 10h
Mov dx,offset PlayerMSG
mov ah,9
int 21h 

mov ah,2
mov dx,0B00h
int 10h

Mov dx,offset LineMSG
mov ah,9
int 21h 

mov ah,2
mov dx,0C00h
int 10h 

Mov dx,offset OpponentMSG
mov ah,9
int 21h 

mov ah,2
mov dx,1700h
int 10h 
Mov dx,offset LineMSG
mov ah,9
int 21h 

mov ah,2
mov dx,1800h
int 10h 
Mov dx,offset EndMSG
mov ah,9
int 21h 



mov ah,2
mov dx,0100h
int 10h


;;Begin
Again:

mov dx , 3FDH ; Line Status Register

 in al , dx
AND al,1
JZ Station
mov dx ,03F8H
in al , dx
mov VALUE,al

;;Check If Enter
cmp VALUE,13
je EnterHandling
cmp XR,80
je NEWLINE
jmp CONT

NEWLINE:
;; Check Scroll
cmp YR,22
jne CONTINUE  ;;No Need For Scrolling
mov YR,13
mov XR,0
mov ah,6
mov al,10
mov bh,7
mov ch,13
mov dh,22
mov cl,0
mov dl,79
int 10h  
jmp CONT
Station:
jmp SkipReceving
CONTINUE: ;;New Line
inc YR
mov XR,0
jmp CONT
CONT:   ;;Normal Logic
mov dl,XR
mov ah,2
mov bh,0
mov dh,YR     
int 10h  
inc XR

mov ah,2
mov dl,VALUE
int 21h
jmp SkipReceving  
EnterHandling:  
cmp YR,22
jne NormalEnter
mov YR,13
mov XR,0
mov ah,6
mov al,10
mov bh,7
mov ch,13
mov dh,22
mov cl,0
mov dl,79
int 10h  
jmp SkipReceving
NormalEnter:  ;;Enter But Not In The Last Row
inc YR
mov XR,0
SkipReceving:

mov al,0
mov ah,1
int 16h 
cmp al,0
je Station2
;;Reading 
cmp ah, 01h
jne notescape
jmp Escape

Notescape:
mov VALUE,al
cmp VALUE,13
je ENTER2
cmp XT,80
je NEWLINE2
jmp CONT2

NEWLINE2:
cmp YT,10
jne CONTINUE2
;;scrolling 
mov YT,1
mov XT,0
mov ah,6
mov al,10
mov bh,7
mov ch,1
mov dh,10
mov cl,0
mov dl,79
int 10h
jmp CONT2  
Station2:
jmp skipReading
CONTINUE2:
inc YT
mov XT,0
jmp CONT2
CONT2:
mov dl,XT
mov ah,2
mov bh,0
mov dh,YT     
int 10h  
inc XT


mov ah,2
mov dl,VALUE
int 21h
jmp ok
ENTER2:
cmp YT,10
jne NormalEnter2
;;scrolling 
mov YT,1
mov XT,0
mov ah,6
mov al,10
mov bh,7
mov ch,1
mov dh,10
mov cl,0
mov dl,79
int 10h
jmp ok
NormalEnter2:
inc YT
mov XT,0
ok:
push ax
mov ah,0
int 16h
pop ax

;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
 In al , dx ;Read Line Status
AND al , 00100000b
JZ skipReading
;;Writing

;If empty put the VALUE in Transmit data register
mov dx , 3F8H ; Transmit data register
mov al,VALUE
out dx , al

skipReading:




jmp Again
   
;;   مش عارف هتبقي ازاي عايز الاتنين يقفلوا بس واحد بس هو الي بيقفل
;;   Escape:
;;mov ax,0003h  ;; returs to text mode
;;int 10h
;;mov ah, 4ch
;;int 21h 

Main endp
end