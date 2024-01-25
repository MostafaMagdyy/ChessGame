.286
EXTRN Print:FAR
EXTRN PrintGrid:FAR
PUBLIC imgFilename,MODE,XSTART,YSTART


.model small
.STACK 512
.DATA

SHAPESTORAGE    DB  'Y','Y' 
PLACESTORAGEX    DW 0  
PLACESTORAGEY    DW 0 


  XSTART      DW 0
  YSTART      DW 0
  MODE        DB 2
  COUNT       DB 4
  MODEB        DB 2

SIZE_XY         DB 75
rowNo           DB 0
columnNo        DB 0
place           DW 0

PLACEOLD        DB 0
PLACENEW        DB 0


XOLD DW 0
XNEW DW 0
YOLD DW 0
YNEW DW 0
;; for queen /BISHOP/ROOK
IsQueen DB 0


;;================
XKILLED DW 625
YKILLED DW 0
;;================
WAITING_TIME DB 3
;;==========
RANDOMPLACE DW ?
;================
THISISAQUEEN DB 0
;===================
KINGPLACEX DW 300
KINGPLACEY DW 0

CHECKPLACEX DW 0
CHECKPLACEY DW 0
;===================

TEMPSHAPEF DB ?
TEMPSHAPES DB ?


;;--------new-------------
 LOOPX DW 0 
LOOPY DW 0 

MSG_TIME DB "TIME :",'$'
PRINT_SECONDS_RIGHT DB 0 
PRINT_SECONDS_LEFT DB 0

PRINT_MIN_RIGHT DB 0 
PRINT_MIN_LEFT DB 0

REAL_SECONDS DB 0
REAL_MIN  DB 0 
;;---------------------





VALUE db ?,'$'
VALUEC db ?,'$'
PlayerMSG db 'ME:','$'
OpponentMSG db 'YOU:','$'
LINEMSG db '------------------------------------------------------------------------------','$'
EndMSG db 'To end chatting with     Press F3','$'

XR db 0   ;;length of the opponent player
YR db 44
XT db 0   ;;length of the current player
YT db 39

XRC db 0   
YRC db 0Dh
XTC db 0  
YTC db 1h

imgFilename DB 'G1', 0


STATE0       DB         'G','L','W','R'  ,'G','D','W','H'  ,'G','L','W','S'  ,'G','D','W','Q'  ,'G','L','W','K'  ,'G','D','W','S' ,'G','L','W','H'  ,'G','D','W','R'

STATE1       DB         'G','D','W','P'  ,'G','L','W','P'  ,'G','D','W','P'  ,'G','L','W','P'  ,'G','D','W','P'  ,'G','L','W','P' ,'G','D','W','P'  ,'G','L','W','P'

STATE2       DB         'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X' ,'G','L','X','X'  ,'G','D','X','X'

STATE3       DB         'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X' ,'G','D','X','X'  ,'G','L','X','X'

STATE4       DB         'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X' ,'G','L','X','X'  ,'G','D','X','X'

STATE5       DB         'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X' ,'G','D','X','X'  ,'G','L','X','X'

STATE6       DB         'G','L','B','P'  ,'G','D','B','P'  ,'G','L','B','P'  ,'G','D','B','P'  ,'G','L','B','P'  ,'G','D','B','P' ,'G','L','B','P'  ,'G','D','B','P'

STATE7       DB         'G','D','B','R'  ,'G','L','B','H'  ,'G','D','B','S'  ,'G','L','B','Q'  ,'G','D','B','K'  ,'G','L','B','S' ,'G','D','B','H'  ,'G','L','B','R'



TIME0        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME1        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME2        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME3        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME4        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME5        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME6        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME7        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0




STATE0TEMP       DB         'G','L','W','R'  ,'G','D','W','H'  ,'G','L','W','S'  ,'G','D','W','Q'  ,'G','L','W','K'  ,'G','D','W','S' ,'G','L','W','H'  ,'G','D','W','R'

STATE1TEMP       DB         'G','D','W','P'  ,'G','L','W','P'  ,'G','D','W','P'  ,'G','L','W','P'  ,'G','D','W','P'  ,'G','L','W','P' ,'G','D','W','P'  ,'G','L','W','P'

STATE2TEMP       DB         'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X' ,'G','L','X','X'  ,'G','D','X','X'

STATE3TEMP       DB         'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X' ,'G','D','X','X'  ,'G','L','X','X'

STATE4TEMP        DB         'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X' ,'G','L','X','X'  ,'G','D','X','X'

STATE5TEMP       DB         'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X'  ,'G','D','X','X'  ,'G','L','X','X' ,'G','D','X','X'  ,'G','L','X','X'

STATE6TEMP       DB         'G','L','B','P'  ,'G','D','B','P'  ,'G','L','B','P'  ,'G','D','B','P'  ,'G','L','B','P'  ,'G','D','B','P' ,'G','L','B','P'  ,'G','D','B','P'

STATE7TEMP      DB         'G','D','B','R'  ,'G','L','B','H'  ,'G','D','B','S'  ,'G','L','B','Q'  ,'G','D','B','K'  ,'G','L','B','S' ,'G','D','B','H'  ,'G','L','B','R'



TIME0TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME1TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME2TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME3TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME4TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME5TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME6TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0

TIME7TEMP        DB         'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0  ,'X','X','X',0 ,'X','X','X',0  ,'X','X','X',0
                             








ENTERNAME  DB 'PLEASE ENTER YOUR NAME:', 13 ,10 ,'$'
ENTERKEY  DB 'PLEASE ENTER KEY TO CONTINUE:', 13 ,10 ,'$'
InDATA db 30,?,30 dup('$')


ENTERF1  DB 'TO START CHATING PRESS F1', 13 ,10 ,'$'
ENTERF2  DB 'TO START THE GAME PRESS F2', 13 ,10 ,'$'
ENTERESC  DB 'TO END THE PROGRAM PRESS ESC', 13 ,10 ,'$'


PLAYERONE  DB 'PLAYER ONE IS WIN', 13 ,10 ,'$'

PLAYERTWO DB 'PLAYER TWO IS WIN', 13 ,10 ,'$'


.CODE
MAIN PROC FAR

          MOV  AX , @DATA
          MOV  DS , AX
;////////////////////////////////////////////////////////////////////
    ; initinalize COM
    ;Set Divisor Latch Access Bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f8h			
    mov al,0ch			
    out dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f9h
    mov al,00h
    out dx,al

    ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al

;//////////////////////////////HOME PAGE///////////////////////////

 JMP GO_TO

PLAYER_ONE_WIN:

 MOV AH,0
 MOV AL,03H
 INT 10H

 mov ah,02
 mov bh,00
 mov dl,20
 mov dh,10
 int 10h

 MOV DX,OFFSET PLAYERONE
MOV AH,9
INT 21h

MOV AH,00
INT 16H

JMP GO_TO

PLAYER_TWO_WIN:
 
 MOV AH,0
 MOV AL,03H
 INT 10H


 
 mov ah,02
mov bh,00
mov dl,20
mov dh,10
int 10h

 MOV DX,OFFSET PLAYERTWO
MOV AH,9
INT 21h

MOV AH,00
INT 16H


GO_TO:


  mov ax,0600h
  mov bh,07
  mov cx,0
  mov dx,184fh
  int 10h

mov ah,02
mov bh,00
mov dl,0
mov dh,0
int 10h


MOV DX,OFFSET ENTERNAME
MOV AH,9
INT 21h

mov ah,02
mov bh,00
mov dl,5
mov dh,1
int 10h


mov ah,0AH
mov dx,offset InDATA
int 21h

mov ah,02
mov bh,00
mov dl,0
mov dh,15
int 10h


MOV DX,OFFSET ENTERKEY
MOV AH,9
INT 21h

MOV AH,00
INT 16H

mov ax,0600h
mov bh,07
mov cx,0
mov dx,184fh
int 10h

mov ah,02
mov bh,00
mov dl,20
mov dh,10
int 10h


MOV DX,OFFSET ENTERF1
MOV AH,9
INT 21h

mov ah,02
mov bh,00
mov dl,20
mov dh,11
int 10h

MOV DX,OFFSET ENTERF2
MOV AH,9
INT 21h


mov ah,02
mov bh,00
mov dl,20
mov dh,12
int 10h

MOV DX,OFFSET ENTERESC
MOV AH,9
INT 21h

JJMP:
MOV AH,00H
INT 16h

CMP AH,3BH
je CHATING
CMP AH,3CH
JE Station10

CMP AH,01H
JNE JJMP
JMP PRESS_ESC









CHATING:


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

jmp Manga10
Station10:
jmp GAME

Manga10:
mov ah,2
mov dx,0100h
int 10h

Again:

mov dx , 3FDH ; Line Status Register

 in al , dx
AND al,1
JZ StationC
mov dx ,03F8H
in al , dx
mov VALUEC,al

;;Check If Enter
cmp VALUEC,13
je EnterHandlingC
cmp XRC,80
je NEWLINEC
jmp CONTC

NEWLINEC:
;; Check Scroll
cmp YRC,22
jne CONTINUEC  ;;No Need For Scrolling
mov YRC,13
mov XRC,0
mov ah,6
mov al,10
mov bh,7
mov ch,13
mov dh,22
mov cl,0
mov dl,79
int 10h  
jmp CONTC
StationC:
jmp SkipRecevingC
CONTINUEC: ;;New Line
inc YRC
mov XRC,0
jmp CONTC
CONTC:   ;;Normal Logic
mov dl,XRC
mov ah,2
mov bh,0
mov dh,YRC    
int 10h  
inc XRC

mov ah,2
mov dl,VALUEC
int 21h
jmp SkipRecevingC
EnterHandlingC:  
cmp YRC,22
jne NormalEnterC
mov YRC,13
mov XRC,0
mov ah,6
mov al,10
mov bh,7
mov ch,13
mov dh,22
mov cl,0
mov dl,79
int 10h  
jmp SkipRecevingC
NormalEnterC:  ;;Enter But Not In The Last Row
inc YRC
mov XRC,0
SkipRecevingC:

mov al,0
mov ah,1
int 16h 
cmp al,0
je Station2C
;;Reading 
;;cmp ah, 01h
;;jne notescapeC
;;jmp EscapeC
NotescapeC:
mov VALUEC,al
cmp VALUEC,13
je ENTER2C
cmp XTC,80
je NEWLINE2C
jmp CONT2C

NEWLINE2C:
cmp YTC,10
jne CONTINUE2C
;;scrolling 
mov YTC,1
mov XTC,0
mov ah,6
mov al,10
mov bh,7
mov ch,1
mov dh,10
mov cl,0
mov dl,79
int 10h
jmp CONT2C 
Station2C:
jmp skipReadingC
CONTINUE2C:
inc YTC
mov XTC,0
jmp CONT2C
CONT2C:
mov dl,XTC
mov ah,2
mov bh,0
mov dh,YTC     
int 10h  
inc XTC


mov ah,2
mov dl,VALUEC
int 21h
jmp okC
ENTER2C:
cmp YTC,10
jne NormalEnter2C
;;scrolling 
mov YTC,1
mov XTC,0
mov ah,6
mov al,10
mov bh,7
mov ch,1
mov dh,10
mov cl,0
mov dl,79
int 10h
jmp okC
NormalEnter2C:
inc YTC
mov XTC,0
okC:
push ax
mov ah,0
int 16h
pop ax

;Check that Transmitter Holding Register is Empty
mov dx , 3FDH ; Line Status Register
 In al , dx ;Read Line Status
AND al , 00100000b
JZ skipReadingC
;;Writing

;If empty put the VALUE in Transmit data register
mov dx , 3F8H ; Transmit data register
mov al,VALUEC
out dx , al



skipReadingC:




jmp Again
   
;;   مش عارف هتبقي ازاي عايز الاتنين يقفلوا بس واحد بس هو الي بيقفل
;;   Escape:
;;mov ax,0003h  ;; returs to text mode
;;int 10h
;;mov ah, 4ch
;;int 21h 
































;//////////////////////////////////////////////////////////////////////////////////////////////
 GAME:
MOV BX , 0
 LOOP_TRANSFER_STATE0:
 MOV AL , STATE0TEMP[BX]
 MOV STATE0[BX],AL
 INC BX
 CMP BX , 255
 JNE LOOP_TRANSFER_STATE0

 MOV BX , 0
 LOOP_TRANSFER_TIME0:
 MOV AL , TIME0TEMP[BX]
 MOV TIME0[BX],AL
 INC BX
 CMP BX , 255
 JNE LOOP_TRANSFER_TIME0



MOV PLACESTORAGEX,  0  
MOV PLACESTORAGEY  , 0 


 MOV XSTART  ,  0
 MOV YSTART  ,  0
 MOV MODE    ,  2 
 MOV COUNT   ,  4
 MOV MODEB   ,  2

MOV SIZE_XY   ,      75
MOV rowNo     ,      0
MOV columnNo  ,      0
MOV place     ,      0



MOV XOLD , 0
MOV XNEW , 0
MOV YOLD , 0
MOV YNEW , 0
;; for queen /BISHOP/ROOK
MOV IsQueen ,0
;;================
MOV XKILLED , 625
MOV YKILLED , 0
;;================
MOV WAITING_TIME , 3
;;==========
MOV RANDOMPLACE ,100
;================
MOV THISISAQUEEN , 0
;===================
MOV KINGPLACEX , 300
MOV KINGPLACEY , 0
MOV CHECKPLACEX , 0
MOV CHECKPLACEY ,0
;===================


  ;//////////////
          mov  AX,4F02h            ;/
          mov  BX,105h             ;/  graph 1024x768  256 colors
          INT  10h                 ;/
  ;//////////////
      MOV  imgFilename[0],'M'
      MOV  imgFilename[1],'O'
          MOV XSTART, 625

mov ah,02
mov bh,00
mov dl,0
mov dh,38
int 10h
  
Mov dx,offset PlayerMSG
mov ah,9
int 21h 

mov ah,02
mov bh,00
mov dl,0
mov dh,42
int 10h
  
Mov dx,offset LineMSG
mov ah,9
int 21h 

mov ah,02
mov bh,00
mov dl,0
mov dh,43
int 10h

Mov dx,offset OpponentMSG
mov ah,9
int 21h 

mov ah,02
mov bh,00
mov dl,0
mov dh,39
int 10h



BLUELOOPOUTTER:
  
   BLUELOOPINNER:
          CALL PRINT
          ADD YSTART,75
          CMP YSTART,600        
  JNE BLUELOOPINNER
        ADD XSTART,75
        MOV YSTART,0
        CMP XSTART,1000
JNE  BLUELOOPOUTTER

MOV XSTART,0
MOV YSTART,0


  ;;; PRINT GRID==============================


  MYLOOP: 
          MOV  imgFilename[0],'G'
          MOV  imgFilename[1],'1'
          call PrintGrid
          ADD  YSTART,75
          MOV  imgFilename[0],'G'
          MOV  imgFilename[1],'2'
          call PrintGrid
          ADD  YSTART,75
          DEC  COUNT
          JNZ  MYLOOP
  ;;==============================================
   
;;;PRINT POWN==================================
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'P'
          MOV  XSTART,0
          MOV  YSTART,75
          MOV  MODE ,0
          MOV  COUNT ,8
  MYLOOP1:
          CALL PRINT
          ADD  XSTART,75
          DEC  COUNT
          JNE  MYLOOP1

          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'P'
          MOV  XSTART,0
          MOV  YSTART,450
          MOV  MODE ,1
          MOV  COUNT ,8
  MYLOOP2:
          CALL PRINT
          ADD  XSTART,75
          DEC  COUNT
          JNE  MYLOOP2
  ;;============================================


  ;;;PRINT LAST ROW==================================
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'R'
          MOV  XSTART,0
          MOV  YSTART,525
          CALL PRINT
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'H'
          MOV  XSTART,75
          MOV  YSTART,525
          CALL PRINT
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'S'
          MOV  XSTART,150
          MOV  YSTART,525
          CALL PRINT
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'Q'
          MOV  XSTART,225
          MOV  YSTART,525
          CALL PRINT
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'K'
          MOV  XSTART,300
          MOV  YSTART,525
          CALL PRINT

          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'S'
          MOV  XSTART,375
          MOV  YSTART,525
          CALL PRINT
          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'H'
          MOV  XSTART,450
          MOV  YSTART,525
          CALL PRINT

          MOV  imgFilename[0],'B'
          MOV  imgFilename[1],'R'
          MOV  XSTART,525
          MOV  YSTART,525
          CALL PRINT
 ;;============================================

  MOV MODE,0
  ;;;PRINT FIRST ROW==================================
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'R'
          MOV  XSTART,0
          MOV  YSTART,0
          CALL PRINT
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'H'
          MOV  XSTART,75
          MOV  YSTART,0
          CALL PRINT
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'S'
          MOV  XSTART,150
          MOV  YSTART,0
          CALL PRINT
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'Q'
          MOV  XSTART,225
          MOV  YSTART,0
          CALL PRINT
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'K'
          MOV  XSTART,300
          MOV  YSTART,0
          CALL PRINT

          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'S'
          MOV  XSTART,375
          MOV  YSTART,0
          CALL PRINT
          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'H'
          MOV  XSTART,450
          MOV  YSTART,0
          CALL PRINT

          MOV  imgFilename[0],'W'
          MOV  imgFilename[1],'R'
          MOV  XSTART,525
          MOV  YSTART,0
          CALL PRINT
 ;;============================================

;;PRINT Highlight CELL===================================================
          MOV  imgFilename[0],'F'         
          MOV  imgFilename[1],'R'
          MOV  XSTART,0             ;PRINT HIGHLIGHT AT THE FIRST CELL OF FIRST PLAYER
          MOV  YSTART,0
          MOV MODE,1
          CALL PRINT

;;==========================================================================
;;                          BONUS 1 
;;==========================================================================
        ;===============Generate RandomPlace================
 PUSH AX
 PUSH BX
 PUSH CX 
 PUSH DX 

 MOV AH,2ch ;Get Current Time 
 INT 21h    ; CH=HOUR , CL=MIN , DH = SEC
 MOV DL,DH 
 MOV DH ,0
 MOV AX , 0
 ADD CL , CH
 MOV CH,0 
 ADD AX , CX 
 ADD AX , DX 

 MOV BL , 31
 DIV BL    ;AL->TIME/31   , AH->TIME%31
 MOV AL , AH
 MOV AH , 0  
 ADD AX , 16 
 MOV RANDOMPLACE , AX 


POP DX 
POP CX 
POP BX
POP AX

      ;==========Print PowerUp In RandomPlace===============
PUSH XSTART 
PUSH YSTART
PUSH AX 
PUSH BX 

MOV AX , RANDOMPLACE
MOV BL , 8
DIV BL ;AL ->ROW NUMB  ,  AH->COLUM NUMB 
PUSH AX 

MOV BL , 75
MUL BL  ;AX->XSTART 
MOV YSTART,AX
POP AX 
MOV AL , AH 
MOV BL,75
MUL BL 
MOV XSTART , AX
MOV imgFilename[0],'Z'
MOV imgFilename[1],'Z'
MOV MODE,1
CALL PRINT

;HERE I RETURN RANDOM PLACE TO EQUALISE PLACE BEC RANGE OF PLACE IS MORE THAN 64
MOV AX,RANDOMPLACE
MOV BL , 4 
MUL BL 
MOV RANDOMPLACE,AX 

 MOV BX , RANDOMPLACE
 MOV STATE0[BX+2],'Z'
 MOV STATE0[BX+3],'Z'


POP BX 
POP AX
POP YSTART 
POP XSTART 



;;==========================================================================
;;  THIS PART OF CODE DO 
;;  WAIT FOR THE KEYBOARD CLICK AND GET IT 
;;=========================================================================
		MOV AH,2ch ;11:39:00
INT 21h  
MOV REAL_SECONDS,DH

        
        CheckKeyPressed:
   ;;=========================================================================


;;-------------------------------NEW SASA-----------------------------------

;;//////////////////////PRINT AND UPDATE TIME OF GAME////////////////////////////////
MOV DL ,80 ;COLUMN
MOV DH,39 ;ROW
MOV BH,0  ;PAGE
MOV AH ,02H ;SET CURSOR
INT 10H

MOV DX , OFFSET MSG_TIME
MOV AH , 9 
INT 21H 

MOV AH,2ch ;11:39:00
INT 21h                               ; CH         Hours (BCD)
                                      ; CL         Minutes (BCD)
                                       ; DH         Seconds (BCD)
;;/////////////////////Min///////////////////////////////
MOV AL , PRINT_MIN_LEFT  ;PRINT LEFT_DIGIT OF MIN
ADD AL , 48
MOV BL , 0CH ;COLOR RED 
MOV BH,0
MOV AH,0EH
INT 10h 


MOV AL , PRINT_MIN_RIGHT   ;PRINT LEFT_DIGIT OF MIN
ADD AL , 48
MOV BL , 0CH ;COLOR RED 
MOV BH,0
MOV AH,0EH
INT 10h 

MOV AL , ':'  
MOV BL , 0FH ;COLOR RED 
MOV BH,0
MOV AH,0EH
INT 10h 


;;//////////////////////////Seconds//////////////////////////
MOV AL , PRINT_SECONDS_LEFT  ;PRINT LEFT_DIGIT OF SEC
ADD AL , 48
MOV BL , 0CH ;COLOR RED 
MOV BH,0
MOV AH,0EH
INT 10h 

CMP DH , REAL_SECONDS
JE IN_SAME_SEC
CMP PRINT_SECONDS_RIGHT,9
JNE NOT_IN_LAST9
CMP PRINT_SECONDS_LEFT,5
JNE IN_9_NOT_IN_59
;;INC MIN -----------------
MOV PRINT_SECONDS_RIGHT,0
MOV PRINT_SECONDS_LEFT,0
CMP PRINT_MIN_LEFT,9
JNE NOT_9_MIN
NOT_9_MIN:
INC PRINT_MIN_RIGHT
;;----------------
JMP EXIT_SECONDS

IN_9_NOT_IN_59:
INC PRINT_SECONDS_LEFT
MOV PRINT_SECONDS_RIGHT,0
JMP EXIT_SECONDS

NOT_IN_LAST9:
INC PRINT_SECONDS_RIGHT

EXIT_SECONDS:
MOV AL , PRINT_SECONDS_RIGHT   ;PRINT LEFT_DIGIT OF SEC
ADD AL , 48
MOV BL , 0CH ;COLOR RED 
MOV BH,0
MOV AH,0EH
INT 10h 
MOV REAL_SECONDS,DH
IN_SAME_SEC:





   ;;=========================================================================   
      

       ;Check that Data Ready
            mov dx , 3FDH		; Line Status Register
        	in al , dx 
            AND al , 1
            Jnz wow
            jmp   Station4
wow:

      ;If Ready read the VALUE in Receive data register
            mov dx , 03F8H
            in al , dx 
cmp al,1
je Text


       mov dx , 3FDH		; Line Status Register
       CHK1: in al , dx 
            AND al , 1
            JZ CHK1

        mov dx , 03F8H
            in al , dx 
            mov PLACEOLD , al

                mov dx , 3FDH		; Line Status Register
       CHK2: in al , dx 
            AND al , 1
            JZ CHK2

        mov dx , 03F8H
            in al , dx 
            mov PLACENEW , al


 CALL MOVE
jmp NOtText
;;Inline Chatting Receiving
Text:

       mov dx , 3FDH		; Line Status Register
       CHK3: in al , dx 
            AND al , 1
            JZ CHK3
        mov dx , 03F8H
            in al , dx 
            mov VALUE , al

cmp VALUE,109
jne wow2
jmp EnterHandling
wow2:
cmp XR,75
je NEWLINE
jmp CONT3

NEWLINE:
;; Check Scroll
cmp YR,46
jne CONTINUE  ;;No Need For Scrolling
mov YR,44
mov XR,0
mov imgFilename[0],'T'
mov imgFilename[1],'T'
push XSTART
push YSTART
mov XSTART,0
mov YSTART,690
mov MODE,1
CALL PrintGrid
pop YSTART
pop XSTART
mov ah,02
mov bh,00
mov dl,0
mov dh,43
int 10h
Mov dx,offset OpponentMSG
mov ah,9
int 21h  
jmp CONT3
CONTINUE: ;;New Line
inc YR
mov XR,0
jmp CONT3
Station4:
jmp CHK

CONT3:   ;;Normal Logic
mov dl,XR
mov ah,2
mov bh,0
mov dh,YR     
int 10h  
inc XR
mov ah,2
mov dl,VALUE
int 21h
jmp NOtText  
EnterHandling:  
cmp YR,46
jne NormalEnter
mov YR,44
mov XR,0
mov imgFilename[0],'T'
mov imgFilename[1],'T'
push XSTART
push YSTART
mov XSTART,0
mov YSTART,690
mov MODE,1
CALL PrintGrid
pop YSTART
pop XSTART
mov ah,02
mov bh,00
mov dl,0
mov dh,43
int 10h

Mov dx,offset OpponentMSG
mov ah,9
int 21h   
jmp NOtText
NormalEnter:  ;;Enter But Not In The Last Row
inc YR
mov XR,0


 




;////////////////////////////////////////////////////
        
 NOtText:      
 





;//////////////////////////////////////////////////////

      CHK:
    MOV AH,01  ;; if something enteresd
    INT 16H
    JZ Station5 ;NO DATA IS ENTERED
    MOV AH,0  ;; clear buffer
    INT 16H                                    ;;SEND
     


        
      
      
     
        CMP AH, 48H     ;SCANCODE FOR UP ARROW
        jne not_up1
        jmp PRESS_UP1
        not_up1:
	
        CMP AH, 50H     ;SCANCODE FOR DOWN ARROW
        jne not_down1
        jmp PRESS_DOWN1
        not_down1:	
      
        CMP AH, 4BH     ;SCANCODE FOR LEFT ARROW
        jne not_left1
        jmp PRESS_LEFT1
        not_left1:
        CMP AH, 4DH     ;SCANCODE FOR UP ARROW
        jne not_right1
        jmp PRESS_RIGHT1
        not_right1:

        CMP AH,1CH     ;SCANCODE FOR UP ENTER
        jne not_enter
        jmp PRESS_ENTER
        not_enter:
;;==========================================================================

        CMP AH, 01H     ;SCANCODE FOR ESC
        jne not_esc
        jmp PRESS_ESC
        not_esc:


mov VALUE,al

cmp VALUE,109
jne wow3
jmp ENTER2
wow3:
cmp XT,75
je NEWLINE2
jmp CONT2
 Station5:
       jmp CheckKeyPressed

NEWLINE2:
cmp YT,41
jne CONTINUE2
mov imgFilename[0],'T'
mov imgFilename[1],'T'
push XSTART
push YSTART
mov XSTART,0
mov YSTART,600
mov MODE,1
CALL PrintGrid
pop YSTART
pop XSTART
;;scrolling 
mov YT,39
mov XT,0
mov ah,02
mov bh,00
mov dl,0
mov dh,38
int 10h
Mov dx,offset PlayerMSG
mov ah,9
int 21h 
jmp CONT2  
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
jmp ok2
ENTER2:
cmp YT,41
jne NormalEnter2
mov imgFilename[0],'T'
mov imgFilename[1],'T'
push XSTART
push YSTART
mov XSTART,0
mov YSTART,600
mov MODE,1
CALL PrintGrid
pop YSTART
pop XSTART
;;scrolling 
mov YT,39
mov XT,0
mov ah,02
mov bh,00
mov dl,0
mov dh,38
int 10h
Mov dx,offset PlayerMSG
mov ah,9
int 21h 
jmp ok2
      Station6:
       jmp not_esc
NormalEnter2:
inc YT
mov XT,0

ok2:

;;;Inline Chatting Transmitting
            mov dx , 3FDH		
            In al , dx 			
            AND al , 00100000b
            JZ skipReading

   
            mov dx , 3F8H		
            mov al,1
            out dx , al 
  
            mov dx , 3FDH		
    AGAINSEND3:  
            In al , dx 			
            AND al , 00100000b
            JZ AGAINSEND3
        mov dx , 3F8H 
        mov al,VALUE
        out dx , al





skipReading:


        
        JMP CheckKeyPressed
        

	
;;==========================================================================
;;  THIS PART OF CODE DO 
;;  1-MOVE HIGHLIGHT OF FIRST PLAYER
;;=========================================================================
        PRESS_UP1:
        MOV BX,YSTART
        SUB BX,75 
        CMP BX,0
        JL Station6
        CALL PrintInState          ;removing the highlight from current cell
        MOV  imgFilename[0],'F' 
        MOV  imgFilename[1],'R'
        MOV MODE,1
        SUB YSTART,75  
	CALL PRINT               ;printing the highlight in the new cell
        JMP CheckKeyPressed

        PRESS_DOWN1:
        MOV BX,YSTART
        ADD BX,75 
        CMP BX,525
        JA JMPGO1
        CALL PrintInState
        MOV  imgFilename[0],'F'
        MOV  imgFilename[1],'R'
        MOV MODE,1
	ADD YSTART,75
        CALL PRINT
        JMPGO1:
        JMP CheckKeyPressed

	PRESS_LEFT1:
        MOV BX,XSTART
        SUB BX,75 
        CMP BX,0
        JL JMPGO1
        CALL PrintInState
        MOV  imgFilename[0],'F'
        MOV  imgFilename[1],'R'
        MOV MODE,1
	SUB XSTART,75
        CALL PRINT
        JMP CheckKeyPressed
	
	PRESS_RIGHT1: 
        MOV BX,XSTART
        ADD BX,75 
        CMP BX,525
        JA JMPGO1
        CALL PrintInState
        MOV  imgFilename[0],'F'
        MOV  imgFilename[1],'R'
        MOV MODE,1
	ADD XSTART,75
        CALL PRINT
        JMP CheckKeyPressed
	
;;==========================================================================
        here:
        JMP CheckKeyPressed
;;==========================================================================
;;  THIS PART OF CODE DO 
;;  1-WHEN FIRST PLAYER PRESSED ENTER ON A CELL
;;  2-THEN CHECK IF THE "SHAPESTORAGE" IS EMPTY OR NOT 
;;     3-IF IT IS EMPTY(START WITH 'Y') WE STORE ITS SHAPE IN "SHAPESTORAGE"
;;     4-AND STORE ITS X,Y IN "PLACESTORAGEX" ,"PLACESTORAGEY"
;;  5-IF IT IS NOT EMPTY GET THE STORED SHAPE AND ITS X,Y
;;     6- DELETE THE OLD SHAPE
;;     7- PRINT THE OLD SHAPE IN CURRENT X,Y   ;
;;=========================================================================

       PRESS_ENTER:
       CMP SHAPESTORAGE[0],'Y'    ;CHECK IF IS EMPTY
       JNE BRIDGE_TO_NOTEMPTY

;;=========================CHECK TIME =======================================  
   PUSH AX 
   PUSH BX 
   PUSH CX 
   PUSH DX
   MOV AH,2ch ;11:39:00
   INT 21h                               ; CH         Hours (BCD)
   CALL GETPLACE                            ; CL         Minutes (BCD)
   MOV BX ,PLACE                            ; DH         Seconds (BCD)
   MOV AL,TIME0[BX]
   ;Check if it is the first move                             
   CMP AL,'X'    
   JE FIRSTMOVE_OR_MORE_THAN_3SEC

   
   MOV AH,CH    ;NEW HOUR IN AH 
   CMP AL,AH     
   JE CHECK_MIN ;IF OLD_HOUR = NEW_HOUR
   DEC AH 
   CMP AL,AH 
   JNE FIRSTMOVE_OR_MORE_THAN_3SEC
   ;CASE 2 ---> CHECK MIN ---> EX: 10:59:59 -> 11:00:01
   MOV AL , TIME0[BX+1]
   MOV AH , CL 
   CMP AL , 59 
   JNE FIRSTMOVE_OR_MORE_THAN_3SEC 
   CMP AH , 00 
   JNE FIRSTMOVE_OR_MORE_THAN_3SEC 
   JMP OUR_LOGIC

   CHECK_MIN:
      MOV BX , PLACE
      MOV AL,TIME0[BX+1]
      MOV AH,CL 
      CMP AL , AH 
      JE OUR_LOGIC
      DEC AH 
      CMP AL , AH 
      JNE FIRSTMOVE_OR_MORE_THAN_3SEC
      JMP OUR_LOGIC




BRIDGE_TO_NOTEMPTY:  
JMP NOTEMPTY



OUR_LOGIC:

    MOV AL,TIME0[BX+2]                     ;Seconds
    CMP DH,AL 
    JA DH_IS_GREATER 
    ; If AL IS GREATER
    SUB AL,DH
    CMP Al,WAITING_TIME
    JAE FIRSTMOVE_OR_MORE_THAN_3SEC
    JMP here
    


    DH_IS_GREATER:
    SUB DH,AL
    CMP DH,WAITING_TIME
    JAE FIRSTMOVE_OR_MORE_THAN_3SEC
    JMP here
    
                         





;;=========================================================================
FIRSTMOVE_OR_MORE_THAN_3SEC:
       POP DX 
       POP CX 
       POP BX 
       POP AX
       ;;EMPTY --> GET ITS PLACE WHICH IS WANTED TO MOVE 
       CALL GETPLACE       
       MOV BX ,place 
      ;;THEN  GET THE SHAPE WHICH IS WANTED TO MOVE
      ;; AND STORE  IT IN  "SHAPESTORAGE"      
       MOV AL,STATE0[BX+2]
       CMP AL,'X'          ;;THIS CHECK IF IT IS EMPY CELL AND PLAYER WANT TO MOVE It WHICH IS FORBIEDDEN                                                  
       JE BRIDGE_TO_here 
        CMP AL,'Z'          ;;THIS CHECK IF IT IS EMPY CELL AND PLAYER WANT TO MOVE It WHICH IS FORBIEDDEN                                                  
       JE BRIDGE_TO_here 
       CMP AL,'B'
       JE BRIDGE_TO_here 
       MOV SHAPESTORAGE[0],AL                           
       MOV AL,STATE0[BX+3]
       MOV SHAPESTORAGE[1],AL

      ;;THEN  GET THE X,Y
      ;; AND STORE  IT IN  "PLACESTORAGEX" ,PLACESTORAGEY
       MOV AX,XSTART                 
       MOV PLACESTORAGEX,AX
       MOV AX,YSTART                         
       MOV PLACESTORAGEY,AX                    
       JMP COMPARSIONS
       BRIDGE_TO_here:
       JMP here 
       
    ;;IF IT IS NOT EMPTY WE DO THE FOLLOWING:
    
;;=========================================================================
;;=====================HIGHLIGHT OF POSSIBLE MOVES=========================
;;=========================================================================
;;=========================================================================
;;==========================COMPARSIONS FOR SHAPE==========================
  COMPARSIONS:

   PUSH XSTART
   PUSH YSTART
   
   MOV AL,SHAPESTORAGE[1]
   CMP Al,'R'
   JE MOVESOFTABEA
   CMP AL,'H'
   JNE NOTMOVEHORSE
   JMP MOVEHORSE
   NOTMOVEHORSE:
   CMP AL,'K'
   JNE NOTMOVEKING
   JMP MOVEKING
   NOTMOVEKING:

   CMP AL,'P'
   JNE NOTMOVEPOWN
   JMP MOVEPOWN
   NOTMOVEPOWN:


   CMP AL,'S'
   JNE NOTMOVEBISHOP
   JMP MOVEBISHOP
   NOTMOVEBISHOP:

   CMP AL,'Q'
   JNE NOTMOVEQUEEN
   MOV THISISAQUEEN,1
   JMP MOVESOFTABEA
   NOTMOVEQUEEN:



   JMP here
;;=========================================================================

MOVESOFTABEA:
;;==========================TABEA=========================================================

;============================================================== 
;;MOTION_IN_XPOSITIVE:

MOTION_IN_XPOSITIVE_MOVES:

ADD XSTART,75
CMP XSTART,600
JE GO_TO_XNEGATIVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_XNEGATIVE

XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_TO_XNEGATIVE

JMP MOTION_IN_XPOSITIVE_MOVES

GO_TO_XNEGATIVE:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

MOTION_IN_XNEGATIVE_MOVES:

SUB XSTART,75
CMP XSTART,-75
JE GO_TO_UP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_UP

XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_TO_UP
JMP MOTION_IN_XNEGATIVE_MOVES


GO_TO_UP:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART


MOTION_IN_UP_MOVES:

SUB YSTART,75
CMP YSTART,-75
JE GO_TO_DOWN
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_DOWN

XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_TO_DOWN
JMP MOTION_IN_UP_MOVES

GO_TO_DOWN:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

MOTION_IN_DOWN_MOVES:

ADD YSTART,75
CMP YSTART,600
JE FINSH_TABEA
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  FINSH_TABEA
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE FINSH_TABEA
JMP MOTION_IN_DOWN_MOVES

FINSH_TABEA:
POP YSTART
POP XSTART
CMP THISISAQUEEN,1
JNE GO_TO_NORMAL

PUSH XSTART
PUSH YSTART
JE MOVEBISHOP

GO_TO_NORMAL:
JMP here 

;;============================BISHOP=======================================
MOVEBISHOP:
UPRIGHT_BISHOP:

ADD XSTART,75
SUB YSTART,75
CMP XSTART,600
JE GO_TO_UPLEFT_BISHOP
CMP YSTART,0
JL  GO_TO_UPLEFT_BISHOP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE GO_TO_UPLEFT_BISHOP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_TO_UPLEFT_BISHOP
JMP UPRIGHT_BISHOP

GO_TO_UPLEFT_BISHOP:
 
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

UPLEFT_BISHOP:

SUB XSTART,75
SUB YSTART,75
CMP XSTART,0
JL GO_DOWNLEFT_BISHOP
CMP YSTART,0
JL  GO_DOWNLEFT_BISHOP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE GO_DOWNLEFT_BISHOP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_DOWNLEFT_BISHOP
JMP UPLEFT_BISHOP

GO_DOWNLEFT_BISHOP:

POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

DOWNLEFT_BISHOP:

SUB XSTART,75
ADD YSTART,75
CMP XSTART,0
JL GO_DOWNRIGTH_BISHOP
CMP YSTART,525
JA GO_DOWNRIGTH_BISHOP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE GO_DOWNRIGTH_BISHOP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE GO_DOWNRIGTH_BISHOP
JMP DOWNLEFT_BISHOP

GO_DOWNRIGTH_BISHOP:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

DOWNRIGTH_BISHOP:
ADD XSTART,75
ADD YSTART,75
CMP XSTART,525
JA END_OF_BISHOP
CMP YSTART,525
JA  END_OF_BISHOP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE END_OF_BISHOP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JE END_OF_BISHOP
JMP DOWNRIGTH_BISHOP

END_OF_BISHOP:
POP YSTART
POP XSTART
MOV THISISAQUEEN,0
JMP here 
;;=========================================================================
;;=========================================================================
;;==========================HORSE==========================================
MOVEHORSE:
;;RIGHTDOWN
ADD XSTART,75
ADD YSTART,150
CMP YSTART,525
JA LEFTDOWN
CMP XSTART,600
JE LEFTDOWN
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE LEFTDOWN
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

LEFTDOWN:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
SUB XSTART,75
ADD YSTART,150
CMP YSTART,525
JA RIGHTUP
CMP XSTART,0
JL RIGHTUP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE RIGHTUP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

RIGHTUP:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD XSTART,75
SUB YSTART,150
CMP YSTART,0
JL LEFTTUP
CMP XSTART,600
JE LEFTTUP
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE LEFTTUP
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
LEFTTUP:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

SUB XSTART,75
SUB YSTART,150
CMP YSTART,0
JL DOWN_RIGHTMOVE
CMP XSTART,0
JL DOWN_RIGHTMOVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE DOWN_RIGHTMOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

DOWN_RIGHTMOVE:

POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

ADD YSTART ,75
ADD  XSTART,150
CMP XSTART,525
JA UP_RIGHTMOVE
CMP YSTART,600
JE UP_RIGHTMOVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE UP_RIGHTMOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

UP_RIGHTMOVE:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

SUB YSTART ,75
ADD  XSTART,150
CMP XSTART,525
JA DOWN_LEFTMOVE
CMP YSTART,0
JL DOWN_LEFTMOVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE DOWN_LEFTMOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT


DOWN_LEFTMOVE:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART


ADD  YSTART ,75
SUB XSTART,150
CMP XSTART,0
JL UP_LEFTMOVE
CMP YSTART,525
JA UP_LEFTMOVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE UP_LEFTMOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

UP_LEFTMOVE:

POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

SUB  YSTART ,75
SUB XSTART,150
CMP XSTART,0
JL END_OF_HORSE
CMP YSTART,0
JL END_OF_HORSE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE END_OF_HORSE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

END_OF_HORSE:
POP YSTART
POP XSTART
JMP here 
;;=========================================================================
;;==========================KING==========================================
MOVEKING:
;;UPLEFT
SUB  YSTART ,75
SUB XSTART,75
CMP XSTART,0
JL UPRIGHT_KING
CMP YSTART,0
JL UPRIGHT_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE UPRIGHT_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

UPRIGHT_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
SUB  YSTART ,75
ADD  XSTART,75
CMP XSTART,525
JA DOWNRIGHT_KING
CMP YSTART,0
JL DOWNRIGHT_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE DOWNRIGHT_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT


DOWNRIGHT_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD  YSTART ,75
ADD  XSTART,75
CMP XSTART,525
JA DOWNLEFT_KING
CMP YSTART,525
JA DOWNLEFT_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE DOWNLEFT_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

DOWNLEFT_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD  YSTART ,75
SUB  XSTART,75
CMP XSTART,0
JL LEFT_KING
CMP YSTART,525
JA LEFT_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE LEFT_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

 LEFT_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
SUB  XSTART,75
CMP XSTART,0
JL RIGHT_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE RIGHT_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

RIGHT_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD  XSTART,75
CMP XSTART,525
JA DOWN_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE DOWN_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT


DOWN_KING:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD  YSTART,75
CMP YSTART,525
JA UP_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE UP_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
UP_KING:

POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
SUB  YSTART,75
CMP YSTART,0
JL ENDOF_KING
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE ENDOF_KING
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
ENDOF_KING:
POP YSTART
POP XSTART
JMP here 
;;=========================================================================
;;================================POWN=====================================
MOVEPOWN:

ADD XSTART,75
ADD YSTART,75
CMP XSTART,525                    ;;EAT RIGHT 
JA EATLEFT_MOVE
CMP YSTART,525
JA EATLEFT_MOVE

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE EATLEFT_MOVE
CMP STATE0[BX+2],'B'             ;;EATLEFT
JNE EATLEFT_MOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

EATLEFT_MOVE:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART


SUB XSTART,75
ADD YSTART,75
CMP XSTART,0
JL FIRST_MOVE
CMP YSTART,525
JA FIRST_MOVE
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE FIRST_MOVE
CMP STATE0[BX+2],'B'
JNE FIRST_MOVE
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

FIRST_MOVE:

POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART

CMP YSTART,75
JNE NOT_FIRST_MOVE
ADD YSTART,75
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE ENDPOWN
CMP STATE0[BX+2],'B'
JE ENDPOWN
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT



 

ADD YSTART,75
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE ENDOF_POWN
CMP STATE0[BX+2],'B'
ENDPOWN:
JE ENDOF_POWN
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT
JMP ENDOF_POWN

NOT_FIRST_MOVE:
POP YSTART
POP XSTART
PUSH XSTART
PUSH YSTART
ADD YSTART,75
CMP YSTART,525
JA ENDOF_POWN
CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE ENDOF_POWN
CMP STATE0[BX+2],'B'
JE ENDOF_POWN
XOR TIME0[BX+3],00000010B
MOV imgFilename[0],'D'
MOV imgFilename[1],'R'
MOV MODE ,1
CALL PRINT

ENDOF_POWN:
POP YSTART
POP XSTART
JMP here 



;;=========================================================================
       NOTEMPTY:

PUSH XSTART
PUSH YSTART
       MOV XSTART,620
MOV YSTART,620
MOV imgFilename[0],'M'
MOV imgFilename[1],'M'
MOV MODE ,1
CALL PRINT

POP YSTART
POP XSTART
;;=========================================================================
;;=========Remove Highlight of possible moves==============================
;;=========================================================================
        MOV BX , 0 
Loop_On_Time0_Elemnts:
        PUSH XSTART 
        PUSH YSTART 
        PUSH BX
        CMP TIME0[BX+3] ,2
        JE REMOVE_WHITE_POSSIBLE_HIGHLIGHT
        CMP TIME0[BX+3],3
        JE REMOVE_WHITE_POSSIBLE_HIGHLIGHT
        JMP CHECK_END_OF_ELEMENTS
        REMOVE_WHITE_POSSIBLE_HIGHLIGHT:
        XOR TIME0[BX+3],00000010B
        ;;=================Get XSTART AND YSTART From BX=============

MOV AX , BX
MOV BL , 4
DIV BL ;AL -> (Row*8 + Col) 
MOV AH,0 
MOV BL , 8 
DIV BL ; AL->ROW AH3->COL

PUSH AX 
MOV BL , 75
MUL BL  ;AX->XSTART 
MOV YSTART,AX
POP AX 
MOV AL , AH 
MOV BL,75
MUL BL 
MOV XSTART , AX
CALL PrintInState



        CHECK_END_OF_ELEMENTS:
        POP BX
        POP YSTART
        POP XSTART
        ADD BX , 4 
        CMP BX , 252 ;;Check This Number
        JBE Loop_On_Time0_Elemnts





;;=========================================================================
;;=========================================================================
;;=========================================================================
;;=========================================================================


       ;; HERE WE PRINT ON THE NEW CELL
;;==========================COMPARSIONS==========================================================
   PUSH XSTART
   PUSH YSTART
   MOV AX,PLACESTORAGEX   
   MOV XOLD,AX
   MOV AX,XSTART
   MOV XNEW,AX 
   MOV AX,PLACESTORAGEY
   MOV YOLD,AX 
   MOV AX,YSTART
   MOV YNEW,AX
 ;XOLD ,YOLD ,XNEW ,YNEW
   MOV AL,SHAPESTORAGE[1]
   CMP Al,'S'
   jE Bishop
   CMP AL,'R'
   JE TABEA11
   CMP AL,'Q'
   JE Queen112
   JMP  STATION_FOR_NEXT_COMPARSIONS




; ADD YOUR COMPARSION HERE :





   JMP CODE1
;;===============================================================================================
;==============================================Bishop============================================
  Bishop:
mov ax,XNEW
cmp ax,XOLD
jne ok
mov bx,YOLD
cmp bx,YNEW
jne ok
jmp HHERE
ok:

mov ax,XNEW
mov bx,XOLD
cmp ax,bx
jg check1
jmp check2
check1:
mov ax,YNEW
mov bx,YOLD
cmp ax,bx
jg move1
jmp move2
check2:
mov ax,YNEW
mov bx,YOLD
cmp ax,bx
jg move3
jmp move4
move1: ;x>,y>
mov ax,XNEW
sub ax,XOLD
mov bx,YNEW
sub bx,YOLD
cmp ax,bx
jz  checkmove1
jmp Invalid 

Queen112:
 JE Queen11

move2: ;x>,y<
mov ax,XNEW
sub ax,XOLD
mov bx,YOLD
sub bx,YNEW
cmp ax,bx
jz  checkmove2
jmp Invalid   
TABEA11:
JMP TABEA
move3: ;x<,y>
mov ax,XOLD
sub ax,XNEW
mov bx,YNEW
sub bx,YOLD
cmp ax,bx
jz  STATIONTOcheckmove3
jmp Invalid
Queen11:
JMP Queen
move4: ;x<,y<
mov ax,XOLD
sub ax,XNEW
mov bx,YOLD
sub bx,YNEW
cmp ax,bx
JNZ KKKDJ
jMP  STATIONTOcheckmove4
KKKDJ:
jmp Invalid
; -----------------------------------------
Invalid:
 CMP IsQueen,1
 jE TABEA12
 JMP HHERE
 ;-------------------------------------------
 ;Loop Till You Reach Destination,Or You Hit A Piece
 checkmove1:
 Add XOLD,75
 Add YOLD,75
 MOV AX,XNEW
 cmp AX,XOLD
 JE GOTOCODE
MOV AX,XOLD
MOV XSTART,AX
MOV AX,YOLD
MOV YSTART,AX
CALL GETPLACE
MOV BX,PLACE
MOV Al,STATE0[BX+2]
CMP AL,'X'
JNE MANGEELSAYED
JMP checkmove1
MANGEELSAYED:
CMP AL,'Z'
JNE FORINVAILDBISHOP
JMP checkmove1

        JMP FORBISHOP
        STATIONTOcheckmove3:   
        JMP checkmove3
        FORBISHOP:



checkmove2:
 Add XOLD,75
 SUB YOLD,75
 MOV AX,XNEW
 cmp AX,XOLD
  GOTOCODE:
 JE FORVAILDBISHOP
 MOV AX,XOLD
 MOV XSTART,AX
 MOV AX,YOLD
 MOV YSTART,AX
 CALL GETPLACE
 MOV BX,PLACE
 MOV Al,STATE0[BX+2]
 CMP AL,'X'
 JNE HSSONA
 JMP checkmove2
 HSSONA: 
 CMP AL,'Z'
 JNE STATIONTOHHERE0
 JMP checkmove2 

TABEA12:
JMP TABEA

         JMP FORBISHOP1  
         STATIONTOcheckmove4:   
         JMP checkmove4
         FORBISHOP1:

 checkmove3:
 SUB XOLD,75
 Add YOLD,75
 MOV AX,XNEW
 cmp AX,XOLD
FORVAILDBISHOP:
 JE STATIONTOCODE0
 MOV AX,XOLD
 MOV XSTART,AX
 MOV AX,YOLD
 MOV YSTART,AX
 CALL GETPLACE
 MOV BX,PLACE
 MOV Al,STATE0[BX+2]
 CMP AL,'X'
FORINVAILDBISHOP:
 JNE SASAELSAYED
 JMP checkmove3
 SASAELSAYED:
 CMP AL,'Z'
 JNE STATIONTOHHERE0
 JMP checkmove3

 checkmove4:
 SUB XOLD,75
 SUB YOLD,75
 MOV AX,XNEW
 cmp AX,XOLD
 JE STATIONTOCODE0
 MOV AX,XOLD
 MOV XSTART,AX
 MOV AX,YOLD
 MOV YSTART,AX
 CALL GETPLACE
 MOV BX,PLACE
 MOV Al,STATE0[BX+2]
 CMP AL,'X'
 JNE ALOMAR
 JMP checkmove4
 ALOMAR:
 CMP AL,'Z'
 JNE STATIONTOHHERE0
 JMP checkmove4
;=========================================================================================
;=========================================Queen===========================================
Queen:
mov IsQueen,1
JMP Bishop
;=======================================STATION(0)=======================================
STATIONTOHHERE0:
JMP TOHHERE
STATIONTOCODE0:
JMP CODE1
;=========================================================================================

;=========================================================================================
;;==========================TABEA=========================================================
  TABEA:
  MOV AX,YOLD
  CMP YNEW,AX          
  JE MOTION_XDIR
  MOV AX,XOLD
  CMP XNEW,AX
  JE MOTION_YDIR
  JMP HHERE
;==============================================================
    MOTION_XDIR:
    MOV AX,XOLD
    CMP XNEW,AX
    JA MOTION_IN_XPOSITIVE
    JB MOTION_IN_XNEGATIVE
;============================================================== 
MOTION_IN_XPOSITIVE:
ADD XOLD,75
MOV BX,XNEW        ; IN +VE DIR
CMP XOLD,BX
JE TOCODE
MOV AX,XOLD
MOV XSTART,AX
CALL GETPLACE
MOV BX,PLACE
MOV AL,STATE0[BX+2]
CMP AL,'X'
JNE STATIONTOHHERE1
JMP MOTION_IN_XPOSITIVE
;==============================================================
MOTION_IN_XNEGATIVE:
SUB XOLD,75
MOV BX,XNEW           ;IN -VE DIR
CMP XOLD,BX
TOCODE:
JE STATIONTOCODE1
MOV AX,XOLD
MOV XSTART,AX
CALL GETPLACE
MOV BX,PLACE
MOV AL,STATE0[BX+2]
CMP AL,'X'
JNE STATIONTOHHERE1
JMP MOTION_IN_XNEGATIVE
;==============================================================
MOTION_YDIR:
    MOV AX,YOLD
    CMP YNEW,AX
    JA MOTION_IN_YPOSITIVE
    JB MOTION_IN_YNEGATIVE
;==============================================================
MOTION_IN_YPOSITIVE:
ADD YOLD,75
MOV BX,YNEW        ; IN +VE DIR
CMP YOLD,BX
JE STATIONTOCODE1
MOV AX,YOLD
MOV YSTART,AX
CALL GETPLACE
MOV BX,PLACE
MOV AL,STATE0[BX+2]
CMP AL,'X'
JNE STATIONTOHHERE1
JMP MOTION_IN_YPOSITIVE
;==============================================================
MOTION_IN_YNEGATIVE:
SUB YOLD,75
MOV BX,YNEW           ;IN -VE DIR
CMP YOLD,BX
JE STATIONTOCODE1
MOV AX,YOLD
MOV YSTART,AX
CALL GETPLACE
MOV BX,PLACE
MOV AL,STATE0[BX+2]
CMP AL,'X'
JNE STATIONTOHHERE1
JMP MOTION_IN_YNEGATIVE
;======================================STATIONT(1)============================================
STATIONTOHHERE1:
JMP TOHHERE
STATIONTOCODE1:
JMP CODE1
;==========================STATION_FOR_NEXT_COMPARSIONS====================================
STATION_FOR_NEXT_COMPARSIONS:
   CMP AL,'H'
   JE HORSE 
   JMP STATION1_FOR_NEXT_COMPARSIONS
;===========================================================================================
;===========================================================================================
;;==========================HORSE===========================================================
HORSE:
MOV AX,XOLD
MOV BX,YOLD
ADD AX,150 ;right down
ADD BX,75
CMP AX,XNEW
JE  right_down_YES
jne right_UP
right_down_YES:
CMP BX,YNEW
jne right_UP
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;
right_UP:
MOV AX,XOLD
MOV BX,YOLD
ADD AX,150
SUB BX,75
CMP AX,XNEW     ;right up
JE right_UP_YES
jne left_down
right_UP_YES:
CMP BX,YNEW
jne left_down
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;
left_down:
MOV AX,XOLD
MOV BX,YOLD
SUB AX,150
ADD BX,75
CMP AX,XNEW     ;left down
JE left_down_YES
jne left_UP
left_down_YES:
CMP BX,YNEW
jne left_UP
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
left_UP:
MOV AX,XOLD
MOV BX,YOLD
SUB AX,150
SUB BX,75       ;left up
CMP AX,XNEW
JE left_UP_YES
jne up_rgiht
left_UP_YES:
CMP BX,YNEW
jne up_rgiht
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
up_rgiht:
MOV AX,XOLD
MOV BX,YOLD
SUB BX,150
ADD AX,75
CMP AX,XNEW     ;up right
JE up_rgiht_YES
jne up_left
up_rgiht_YES:
CMP BX,YNEW
jne up_left
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
up_left:
MOV AX,XOLD
MOV BX,YOLD
SUB BX,150
SUB AX,75
CMP AX,XNEW     ;up left
JE up_left_YES
jne down_right
up_left_YES:
CMP BX,YNEW
jne down_right
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
down_right:
MOV AX,XOLD
MOV BX,YOLD
ADD BX,150
ADD AX,75
CMP AX,XNEW
JE down_right_YES
jne down_left
down_right_YES:
CMP BX,YNEW
jne down_left
jmp CODE1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
down_left:
MOV AX,XOLD
MOV BX,YOLD
ADD BX,150
SUB AX,75
CMP AX,XNEW
JE down_left_YES
jne STATIONTOHHERE2
down_left_YES:
CMP BX,YNEW
jne STATIONTOHHERE2
jmp CODE1
;===========================================================================================
;======================================STATIONT(2)============================================
STATIONTOHHERE2:
JMP TOHHERE
STATIONTOCODE2:
JMP CODE1
;===========================================================================================
;==========================STATION1_FOR_NEXT_COMPARSIONS====================================
STATION1_FOR_NEXT_COMPARSIONS:
   CMP AL,'K'
   JE KING 
 JMP STATION2_FOR_NEXT_COMPARSIONS
;===========================================================================================
;;==========================KING============================================================
KING:
mov AX,XOLD
mov BX,YOLD
ADD AX,75       ;moves to the right
CMP AX,XNEW
je XRYES
jne UPRIGHT
XRYES:
CMP BX,YNEW
jne UPRIGHT
Jmp CODE1
;;;;;;;;;;;
UPRIGHT:
mov AX,XOLD
mov BX,YOLD
SUB BX,75
ADD Ax,75
CMP AX,XNEW
je XURYES
jne UP
XURYES:
CMP BX,YNEW
jne UP
jmp CODE1
;;;;;;;;;;;
UP:
mov AX,XOLD
mov BX,YOLD
SUB BX,75
CMP AX,XNEW
je XUYES
jne UPLEFT
XUYES:
CMP BX,YNEW
jne UPLEFT
jmp CODE1
;;;;;;;;;;
UPLEFT:
mov AX,XOLD
mov BX,YOLD
SUB AX,75
SUB BX,75
CMP AX,XNEW
je XULYES
jne LEFT
XULYES:
CMP BX,YNEW
jne LEFT
jmp CODE1
;;;;;;;;;;;
LEFT:
mov AX,XOLD
mov BX,YOLD
SUB AX,75
CMP AX,XNEW
je XLYES
jne DOWNLEFT
XLYES:
CMP BX,YNEW
jne DOWNLEFT
jmp CODE1
;;;;;;;;;;;;
DOWNLEFT:
mov AX,XOLD
mov BX,YOLD
SUB AX,75
ADD BX,75       
CMP AX,XNEW
je XDLYES
jne DOWN
XDLYES:
CMP BX,YNEW
jne DOWN
jmp CODE1
;;;;;;;;;;;;
DOWN:
mov AX,XOLD
mov BX,YOLD
ADD BX,75       
CMP AX,XNEW
je XDYES
jne DOWNRIGHT
XDYES:
CMP BX,YNEW
jne DOWNRIGHT
jmp CODE1
;;;;;;;;;;;;
DOWNRIGHT:
mov AX,XOLD
mov BX,YOLD
ADD AX,75
ADD BX,75       
CMP AX,XNEW
je XDRYES
jne STATIONTOHHERE3
XDRYES:
CMP BX,YNEW
jne STATIONTOHHERE3;invalid move
jmp CODE1
;===========================================================================================
;======================================STATIONT(3)============================================
STATIONTOHHERE3:
JMP TOHHERE
STATIONTOCODE3:
JMP CODE1
;===========================================================================================
;==========================STATION2_FOR_NEXT_COMPARSIONS====================================
STATION2_FOR_NEXT_COMPARSIONS:
   CMP AL,'P'
   je POWN
   JMP CODE1 ;=====****** 
;===========================================================================================
;==========================================POWN=============================================

POWN:
MOV AX,XOLD
MOV BX,YOLD
cmp BX,75
je tow_moves
;;;;;;
one_move:
ADD BX,75
cmp BX,YNEW
jne TOHHERE2
cmp AX,XNEW
jne check3
;
;jne diagonal_mov_positive 
mov XSTART,AX
mov YSTART,BX
call GETPLACE
mov BX,place
MOV AL ,state0[BX+2];move odam
cmp AL,'X'
je CODE2
cmp AL,'Z'
je CODE2
CMP AL ,'H'
JE CODE2
JMP TOHHERE2 
;
check3:
cmp AX,XNEW
jA diagonal_mov_negative
JL diagonal_mov_positive

diagonal_mov_positive:
ADD AX,75
mov XSTART,AX
mov YSTART,BX
call GETPLACE
mov BX,place
MOV AL ,state0[BX+2]
cmp AL,'B'
je CODE2
jne TOHHERE2

diagonal_mov_negative:
SUB AX,75
mov XSTART,AX
mov YSTART,BX
call GETPLACE
mov BX,place
MOV AL ,state0[BX+2]
cmp AL,'B'
je CODE1
jne TOHHERE2
;;;;;;;;;;;;;
CODE2:
jmp CODE1
TOHHERE2:
jmp TOHHERE


tow_moves:
ADD BX,75
cmp BX,YNEW
jne another_col
cmp AX,XNEW
jne check3
je check_X
another_col:
ADD BX,75
cmp BX,YNEW
je check_X
jne TOHHERE
check_X:
cmp AX,XNEW
jne TOHHERE 
mov XSTART,AX
mov YSTART,BX
call GETPLACE
mov BX,place
MOV AL ,state0[BX+2]
cmp AL,'X'
je CODE1
cmp AL,'Z'
je CODE1
CMP AL,'H'
JE CODE1
JMP TOHHERE
;===========================================================================================
;===========================================================================================


;===========================================================================================
TOHHERE:
 POP AX
 MOV YSTART,AX
 POP AX
 MOV XSTART,AX
 MOV IsQUEEN,0
JMP JUMPTOHHERE
;===========================================================================================
CODE1:
 POP AX
 MOV YSTART,AX
 POP AX
 MOV XSTART,AX
 MOV IsQUEEN,0
 ;;=================Update Time Array================================
   PUSH AX 
   PUSH BX 
   PUSH CX 
   PUSH DX
   MOV AH,2ch    ;New Time 
   INT 21h                                  ; CH         Hours (BCD)
   CALL GETPLACE                            ; CL         Minutes (BCD)
   MOV BX ,PLACE                            ; DH         Seconds (BCD)
   ;;=====================bonus 1===================================
   CMP BX , RANDOMPLACE
   JNE NOT_THE_POWER_PLACE
   MOV WAITING_TIME,2
   NOT_THE_POWER_PLACE:
   MOV TIME0[BX],CH
   MOV TIME0[BX+1],CL 
   MOV TIME0[BX+2],DH
   POP DX 
   POP CX 
   POP BX 
   POP AX 
;;==================================================================

       CALL GETPLACE
       MOV BX,place                                       
       PUSH BX
       MOV AL ,state0[BX+2]
       CMP AL,'W'
       JNE HELLO
       JMP JUMPTOHHERE
       HELLO:
       ;;Check if the killed one is king,then the game is over 
       MOV AL , state0[BX+3]
       CMP AL , 'K'
       JNE CON
       JMP PLAYER_TWO_WIN
       CON:
       MOV AL,state0 [BX]                 
       MOV  imgFilename[0], AL 
       MOV AH, state0[BX+1]          ;printing the background OF THE NEW CELL  TO DELETE THE ANIMY SHAPE IF EXSITS          
       MOV  imgFilename[1], AH  
       MOV MODE,2
       CALL PRINT

        PUSH XSTART
        PUSH YSTART
       
       ;;Here If i killed the PowerUp , i dont need to print it 
        CALL GETPLACE
       MOV BX,place 
     
      MOV AX,BX
      MOV PLACENEW,AL

       MOV AL , state0 [BX+2] 
       CMP AL , 'Z'
       JE ITS_THE_POWER_UP
        

       CALL GETPLACE
       MOV BX,place  
        MOV AL,state0 [BX+2] 
        CMP AL,'X'
        JE GO_TO_POP 
       MOV  imgFilename[0], AL 
       MOV AH, state0[BX+3]               
       MOV  imgFilename[1], AH 
       MOV MODE,1
       MOV AX,XKILLED
       MOV XSTART,AX
       MOV AX,YKILLED
       MOV YSTART,AX
       CALL PRINT
       
       ADD YKILLED,75
       CMP YKILLED,600
       JNE GO_TO_POP
        MOV YKILLED,0
        ADD XKILLED,75

     
JMP GO_TO_POP

ITS_THE_POWER_UP:
MOV BX , RANDOMPLACE
MOV STATE0[BX+2],'X'
MOV STATE0[BX+3],'X'
MOV RANDOMPLACE,1000



      GO_TO_POP:
        POP YSTART
        POP XSTART




       POP BX 

       MOV AL,SHAPESTORAGE[0]
       MOV  imgFilename[0], AL            ;;GET OLD SHAPE AND PRINT IT ON THE NEW CELL
       MOV STATE0[BX+2],AL                                        
       MOV  AL,SHAPESTORAGE[1]
       MOV  imgFilename[1], AL
       MOV  STATE0[BX+3],AL 
;====================================================
;; IF THE SHAPE KING I NEED TO UPDATE KINGPLACEX,KINGPLACEY

CMP SHAPESTORAGE[1],'K'
JNE NOT_KING
MOV AX,XSTART
MOV KINGPLACEX,AX
MOV AX,YSTART
MOV KINGPLACEY,AX
NOT_KING:
;===================================================
       MOV MODE ,0
       CALL PRINT
       MOV  imgFilename[0],'F'         
       MOV  imgFilename[1],'R'    ;PRINT HIGHLIGHT AT THE FIRST CELL
       MOV MODE,1
       CALL PRINT                            
                         
      


   
         JMP GOAT
        JUMPTOHHERE:   
        JMP HHERE

        GOAT:

       MOV AX,XSTART 
       PUSH AX                         
       MOV AX ,YSTART
       PUSH AX  

        ;;GET OLD PLACE  
       MOV AX,PLACESTORAGEX  
       MOV XSTART,AX                         
       MOV AX ,PLACESTORAGEY
       MOV YSTART,AX 
       CALL GETPLACE
       MOV BX,place                  ;;WE DELETE THE OLD SHAPE

      MOV AX,BX
      MOV PLACEOLD,AL

       
       MOV AL,state0 [BX]                 
       MOV  imgFilename[0], AL 
       MOV AL, state0[BX+1]          ;printing the background OF THE OLD PLACE SO THE OLD SHAPE ID DISAPPERED
       MOV  imgFilename[1], AL
       MOV STATE0[BX+2],'X'       ;;UPDATE THE STATE ARRAY
       MOV STATE0[BX+3],'X'
       MOV MODE,2
       CALL PRINT

        POP AX
        MOV YSTART,AX
        POP AX
        MOV XSTART,AX




    ;Check that Transmitter Holding Register is Empty
            mov dx , 3FDH		; Line Status Register
  
            In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAINSEND

    ;If empty put the VALUE in Transmit data register
            mov dx , 3F8H		; Transmit data register
            mov al,0
            out dx , al 


       mov dx , 3FDH		; Line Status Register
    AGAINSEND4:  
            In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAINSEND4

    ;If empty put the VALUE in Transmit data register
            mov dx , 3F8H		; Transmit data register
            mov al,PLACEOLD
            out dx , al 




    ;Check that Transmitter Holding Register is Empty
            mov dx , 3FDH		; Line Status Register
    AGAINSEND1:  
            In al , dx 			;Read Line Status
            AND al , 00100000b
            JZ AGAINSEND1

    ;If empty put the VALUE in Transmit data register
            mov dx , 3F8H		; Transmit data register
            mov al,PLACENEW
            out dx , al 

   AGAINSEND: 

         CALL CHECKKING

        HHERE:
        MOV SHAPESTORAGE[0],'Y'            ;;RETURN THE SHAPE STORAGE EMPTY AGAIN
        MOV SHAPESTORAGE[1],'Y'     
      JMP CheckKeyPressed
;;==========================================================================



 PRESS_ESC:
  ;END GAME
  ;Change to Text MODE
          MOV  AH,0
          MOV  AL,03h
          INT  10h
  ;return control to operating system
          MOV  AH , 4ch
          INT  21H
MAIN ENDP


PrintInState PROC       ;prints the square in 'place'

                ;525
        MOV AX, XSTART      
        MOV BL,SIZE_XY         ;rowNo = XSTART/SIZE_XY
        DIV BL 
        MOV rowNo,AL        
                          
        MOV AX, YSTART                               
        DIV SIZE_XY          ;columnNo = YSTART/SIZE_XY
        MOV columnNo,AL       
        MOV AH,0
           
        MOV BL,8
        MUL BL               ;AX = columnNo * 8                    

        ADD AL,rowNo        ;AX = (columnNo*8) + rowNo   
        MOV BL,4     
        MUL BL               ;AX = [ (columnNo*8) + rowNo ] *4

        Mov place,AX
       
                              
        MOV BX,place            
        MOV AL,state0 [BX]                 
        MOV  imgFilename[0], AL 
        MOV AH, state0[BX+1]          ;printing the background
        MOV  imgFilename[1], AH  
        MOV MODE,2
        CALL PRINT
       
        MOV BX,place            
        MOV AL,TIME0[BX+3] 
        CMP AL,1
        JNE IF_2        
        MOV  imgFilename[0],'D'        
        MOV  imgFilename[1],'R' 
        MOV MODE,1
        CALL PRINT
        JMP CONT
        IF_2:
        CMP AL,2
        JNE IF_3 
        MOV  imgFilename[0],'D'        
        MOV  imgFilename[1],'R' 
        MOV MODE,1
        CALL PRINT
        JMP CONT 
        IF_3:
        CMP AL,3
        JNE CONT 
        MOV  imgFilename[0],'D'        
        MOV  imgFilename[1],'R' 
        MOV MODE,1
        CALL PRINT
        MOV  imgFilename[0],'D'        
        MOV  imgFilename[1],'R' 
        MOV MODE,1
        CALL PRINT



      CONT:

        MOV BX,place                               
        MOV AL,state0 [BX+2]     
        MOV  imgFilename[0], AL       ;printing the PICE                   
        MOV AH, state0[BX+3]  
        MOV  imgFilename[1], AH 
        CMP AL,'X'
        JE EXIT0 
        CMP AL,'W'
         JNE BLACK
         MOV MODE,0
         JMP GOHERE
         BLACK:
         MOV MODE,1
    
        GOHERE:
        CALL PRINT
        EXIT0:
        ret
PrintInState ENDP



GETPLACE PROC  

             ;525
        MOV AX, XSTART      
        MOV BL,SIZE_XY         ;rowNo = XSTART/SIZE_XY
        DIV BL 
        MOV rowNo,AL        
                          
        MOV AX, YSTART                               
        DIV SIZE_XY          ;columnNo = YSTART/SIZE_XY
        MOV columnNo,AL       
        MOV AH,0
           
        MOV BL,8
        MUL BL               ;AX = columnNo * 8                    

        ADD AL,rowNo        ;AX = (columnNo*8) + rowNo   
        MOV BL,4     
        MUL BL               ;AX = [ (columnNo*8) + rowNo ] *4

        Mov place,AX


        ret
GETPLACE ENDP

CHECKKING PROC  

PUSH XSTART
PUSH YSTART

PUSH KINGPLACEX
PUSH KINGPLACEY


;; CHECK IF THERE A POWN CAN EAT KING FROM RIGHT



ADD KINGPLACEX,75
ADD KINGPLACEY,75
CMP KINGPLACEX,525
JA  CHECKIFTHERE_POWN
CMP KINGPLACEY,525
JA  CHECKIFTHERE_POWN
MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX, PLACE

CMP STATE0[BX+2],'B'
JNE CHECKIFTHERE_POWN
CMP STATE0[BX+3],'P'
JNE CHECKIFTHERE_POWN
 
; THERE IS A BLACK POWN SO PRINT CHECK
JMP PRINT_CHECK


CHECKIFTHERE_POWN:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

SUB KINGPLACEX,75
ADD KINGPLACEY,75
CMP KINGPLACEX,0
JL  CHECKIFTHERE_H
CMP KINGPLACEY,525
JA  CHECKIFTHERE_H
MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX, PLACE

CMP STATE0[BX+2],'B'
JNE CHECKIFTHERE_H
CMP STATE0[BX+3],'P'
JNE CHECKIFTHERE_H
 
; THERE IS A BLACK POWN SO PRINT CHECK

JMP PRINT_CHECK


CHECKIFTHERE_H:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY
;;=========================================================================
;;==========================HORSE==========================================

;;RIGHTDOWN
ADD KINGPLACEX,75
ADD KINGPLACEY,150
CMP KINGPLACEY,525
JA LEFTDOWN_CHECK
CMP XSTART,600
JE LEFTDOWN_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE LEFTDOWN_CHECK
CMP STATE0[BX+3],'H'
JNE LEFTDOWN_CHECK


JMP PRINT_CHECK


LEFTDOWN_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY
SUB KINGPLACEX,75
ADD KINGPLACEY,150
CMP KINGPLACEY,525
JA RIGHTUP_CHECK
CMP KINGPLACEX,0
JL RIGHTUP_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE RIGHTUP_CHECK
CMP STATE0[BX+3],'H'
JNE RIGHTUP_CHECK

JMP PRINT_CHECK


RIGHTUP_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY
ADD KINGPLACEX,75
SUB KINGPLACEY,150
CMP KINGPLACEY,0
JL LEFTTUP_CHECK
CMP KINGPLACEX,600
JE LEFTTUP_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE LEFTTUP_CHECK
CMP STATE0[BX+3],'H'
JNE LEFTTUP_CHECK

JMP PRINT_CHECK


LEFTTUP_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

SUB KINGPLACEX,75
SUB KINGPLACEY,150
CMP KINGPLACEY,0
JL DOWN_RIGHTMOVE_CHECK
CMP KINGPLACEX,0
JL DOWN_RIGHTMOVE_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE DOWN_RIGHTMOVE_CHECK
CMP STATE0[BX+3],'H'
JNE DOWN_RIGHTMOVE_CHECK


JMP PRINT_CHECK

DOWN_RIGHTMOVE_CHECK:

POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

ADD KINGPLACEY ,75
ADD  KINGPLACEX,150
CMP KINGPLACEX,525
JA UP_RIGHTMOVE_CHECK
CMP KINGPLACEY,600
JE UP_RIGHTMOVE_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE UP_RIGHTMOVE_CHECK
CMP STATE0[BX+3],'H'
JNE UP_RIGHTMOVE_CHECK


JMP PRINT_CHECK

UP_RIGHTMOVE_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


SUB KINGPLACEY ,75
ADD  KINGPLACEX,150
CMP KINGPLACEX,525
JA DOWN_LEFTMOVE_CHECK
CMP KINGPLACEY,0
JL DOWN_LEFTMOVE_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE DOWN_LEFTMOVE_CHECK
CMP STATE0[BX+3],'H'
JNE DOWN_LEFTMOVE_CHECK


JMP PRINT_CHECK

DOWN_LEFTMOVE_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY



ADD  KINGPLACEY ,75
SUB KINGPLACEX,150
CMP KINGPLACEX,0
JL UP_LEFTMOVE_CHECK
CMP KINGPLACEY,525
JA UP_LEFTMOVE_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE UP_LEFTMOVE_CHECK
CMP STATE0[BX+3],'H'
JNE UP_LEFTMOVE_CHECK


JMP PRINT_CHECK

UP_LEFTMOVE_CHECK:

POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


SUB  KINGPLACEY ,75
SUB KINGPLACEX,150
CMP KINGPLACEX,0
JL END_OF_HORSE_CHECK
CMP KINGPLACEY,0
JL END_OF_HORSE_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE
MOV BX,PLACE
CMP STATE0[BX+2],'B'
JNE END_OF_HORSE_CHECK
CMP STATE0[BX+3],'H'
JNE END_OF_HORSE_CHECK

JMP PRINT_CHECK
END_OF_HORSE_CHECK:

;;=========================================================================
;;==========================TABEA=========================================================
;============================================================== 
;;MOTION_IN_XPOSITIVE:


POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

MOTION_IN_XPOSITIVE_MOVES_CHECK:

ADD KINGPLACEX,75
CMP KINGPLACEX,600
JE GO_TO_XNEGATIVE_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_XNEGATIVE_CHECK

CMP STATE0[BX+2],'B'
JNE MOTION_IN_XPOSITIVE_MOVES_CHECK
CMP STATE0[BX+3],'R'
JNE MOTION_IN_XPOSITIVE_MOVES_CHECK
JE PRINT_CHECK_LABEL
CMP STATE0[BX+2],'B'
JNE MOTION_IN_XPOSITIVE_MOVES_CHECK
CMP STATE0[BX+3],'Q'
JNE MOTION_IN_XPOSITIVE_MOVES_CHECK
JE PRINT_CHECK_LABEL


JMP MOTION_IN_XPOSITIVE_MOVES_CHECK

PRINT_CHECK_LABEL:
JMP PRINT_CHECK


GO_TO_XNEGATIVE_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

MOTION_IN_XNEGATIVE_MOVES_CHECK:

SUB KINGPLACEX,75
CMP KINGPLACEX,-75
JE GO_TO_UP_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  MOTION_IN_XNEGATIVE_MOVES_CHECK

CMP STATE0[BX+2],'B'
JNE MOTION_IN_XNEGATIVE_MOVES_CHECK
CMP STATE0[BX+3],'R'
JNE MOTION_IN_XNEGATIVE_MOVES_CHECK
JE PRINT_CHECK_LABEL1
CMP STATE0[BX+2],'B'
JNE MOTION_IN_XNEGATIVE_MOVES_CHECK
CMP STATE0[BX+3],'Q'
JNE MOTION_IN_XNEGATIVE_MOVES_CHECK
JE PRINT_CHECK_LABEL1


JMP MOTION_IN_XNEGATIVE_MOVES_CHECK


PRINT_CHECK_LABEL1:
JMP PRINT_CHECK



GO_TO_UP_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


MOTION_IN_UP_MOVES_CHECK:

SUB KINGPLACEY,75
CMP KINGPLACEY,-75
JE GO_TO_DOWN_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_DOWN_CHECK

CMP STATE0[BX+2],'B'
JNE MOTION_IN_UP_MOVES_CHECK
CMP STATE0[BX+3],'R'
JNE MOTION_IN_UP_MOVES_CHECK
JE PRINT_CHECK_LABEL2
CMP STATE0[BX+2],'B'
JNE MOTION_IN_UP_MOVES_CHECK
CMP STATE0[BX+3],'Q'
JNE GO_TO_DOWN_CHECK
JE PRINT_CHECK_LABEL2


JMP MOTION_IN_UP_MOVES_CHECK


PRINT_CHECK_LABEL2:
JMP PRINT_CHECK


GO_TO_DOWN_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY

MOTION_IN_DOWN_MOVES_CHECK:

ADD KINGPLACEY,75
CMP KINGPLACEY,600
JE FINSH_TABEA_CHECK

MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  FINSH_TABEA_CHECK

CMP STATE0[BX+2],'B'
JNE MOTION_IN_DOWN_MOVES_CHECK
CMP STATE0[BX+3],'R'
JNE MOTION_IN_DOWN_MOVES_CHECK
JE PRINT_CHECK_LABEL3
CMP STATE0[BX+2],'B'
JNE MOTION_IN_DOWN_MOVES_CHECK
CMP STATE0[BX+3],'Q'
JNE MOTION_IN_DOWN_MOVES_CHECK
JE PRINT_CHECK_LABEL3

JMP MOTION_IN_DOWN_MOVES_CHECK

PRINT_CHECK_LABEL3:
JMP PRINT_CHECK


FINSH_TABEA_CHECK:
POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


;;============================BISHOP=======================================

UPRIGHT_BISHOP_CHECK:

ADD KINGPLACEX,75
SUB KINGPLACEY,75
CMP KINGPLACEX,600
JE GO_TO_UPLEFT_BISHOP_CHECK
CMP KINGPLACEY,0
JL GO_TO_UPLEFT_BISHOP_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_UPLEFT_BISHOP_CHECK

CMP STATE0[BX+2],'X'
JE  UPRIGHT_BISHOP_CHECK


CMP STATE0[BX+3],'S'
JE PRINT_CHECK_LABEL4

CMP STATE0[BX+3],'Q'
JNE GO_TO_UPLEFT_BISHOP_CHECK

JE PRINT_CHECK_LABEL4


JMP UPRIGHT_BISHOP_CHECK



PRINT_CHECK_LABEL4:
JMP PRINT_CHECK




GO_TO_UPLEFT_BISHOP_CHECK:
 POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


UPLEFT_BISHOP_CHECK:

SUB KINGPLACEX,75
SUB KINGPLACEY,75
CMP KINGPLACEX,0
JL GO_TO_DOWNLEFT_BISHOP_CHECK
CMP KINGPLACEY,0
JL GO_TO_DOWNLEFT_BISHOP_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_DOWNLEFT_BISHOP_CHECK

CMP STATE0[BX+2],'X'
JE  UPLEFT_BISHOP_CHECK


CMP STATE0[BX+3],'S'
JE PRINT_CHECK_LABEL5

CMP STATE0[BX+3],'Q'
JNE GO_TO_DOWNLEFT_BISHOP_CHECK

JE PRINT_CHECK_LABEL5


JMP UPLEFT_BISHOP_CHECK

PRINT_CHECK_LABEL5:
JMP PRINT_CHECK

GO_TO_DOWNLEFT_BISHOP_CHECK:


 POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY


DOWNLEFT_BISHOP_CHECK:

SUB KINGPLACEX,75
ADD KINGPLACEY,75
CMP KINGPLACEX,0
JL GO_TO_DOWNRIGHT_BISHOP_CHECK
CMP KINGPLACEY,525
JA GO_TO_DOWNRIGHT_BISHOP_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  GO_TO_DOWNRIGHT_BISHOP_CHECK

CMP STATE0[BX+2],'X'
JE  DOWNLEFT_BISHOP_CHECK


CMP STATE0[BX+3],'S'
JE PRINT_CHECK_LABEL6

CMP STATE0[BX+3],'Q'
JNE GO_TO_DOWNRIGHT_BISHOP_CHECK

JE PRINT_CHECK_LABEL6


JMP DOWNLEFT_BISHOP_CHECK

PRINT_CHECK_LABEL6:
JMP PRINT_CHECK


GO_TO_DOWNRIGHT_BISHOP_CHECK:
 POP KINGPLACEY 
POP KINGPLACEX
PUSH KINGPLACEX
PUSH KINGPLACEY



DOWNRIGHT_BISHOP_CHECK:

ADD KINGPLACEX,75
ADD KINGPLACEY,75
CMP KINGPLACEX,525
JA END_CHECK
CMP KINGPLACEY,525
JA END_CHECK


MOV AX,KINGPLACEX
MOV XSTART,AX
MOV AX,KINGPLACEY
MOV YSTART,AX

CALL GETPLACE

MOV BX,PLACE
CMP STATE0[BX+2],'W'
JE  END_CHECK

CMP STATE0[BX+2],'X'
JE  DOWNRIGHT_BISHOP_CHECK


CMP STATE0[BX+3],'S'
JE PRINT_CHECK_LABE7

CMP STATE0[BX+3],'Q'
JNE END_CHECK

JE PRINT_CHECK_LABE7


JMP DOWNRIGHT_BISHOP_CHECK

PRINT_CHECK_LABE7:
JMP PRINT_CHECK


END_CHECK:




JMP NO_CHECK

PRINT_CHECK:
MOV XSTART,620
MOV YSTART,620
MOV imgFilename[0],'K'
MOV imgFilename[1],'K'
MOV MODE ,0
CALL PRINT

JMP NOTFOUND
NO_CHECK:


MOV XSTART,620
MOV YSTART,620
MOV imgFilename[0],'M'
MOV imgFilename[1],'M'
MOV MODE ,1
CALL PRINT

NOTFOUND:


POP KINGPLACEY
POP KINGPLACEX

POP YSTART 
POP XSTART


        ret
CHECKKING ENDP







MOVE PROC  

;;PLACEOLD  PLACENEW        
PUSH XSTART
PUSH YSTART

MOV AX,0
MOV AL,PLACEOLD

;=======================================================
MOV BL,4
DIV BL
MOV AH,0
MOV BL , 8
DIV BL ;AL ->ROW NUMB  ,  AH->COLUM NUMB 
PUSH AX 

MOV BL , 75
MUL BL  ;AX->XSTART 
MOV YSTART,AX
POP AX 
MOV AL , AH 
MOV BL,75
MUL BL 
MOV XSTART , AX
;=======================================================

MOV AX,0
MOV AL,PLACEOLD
MOV BX,AX

    MOV AL,state0 [BX]                 
    MOV  imgFilename[0], AL 
    MOV AL, state0[BX+1]          ;printing the background OF THE OLD PLACE SO THE OLD SHAPE ID DISAPPERED
    MOV  imgFilename[1], AL
    MOV MODE,2
    CALL PRINT
    MOV AX,0
MOV AL,PLACEOLD
MOV BX,AX
  
    MOV AL, STATE0[BX+2]    
    MOV TEMPSHAPEF,AL
    MOV AL, STATE0[BX+3]
    MOV TEMPSHAPES,AL

    MOV STATE0[BX+2],'X'       ;;UPDATE THE STATE ARRAY
    MOV STATE0[BX+3],'X'
  
;=======================================================


MOV AX,0
MOV AL,PLACENEW

MOV BL,4
DIV BL
MOV AH,0
MOV BL , 8
DIV BL ;AL ->ROW NUMB  ,  AH->COLUM NUMB 
PUSH AX 

MOV BL , 75
MUL BL  ;AX->XSTART 
MOV YSTART,AX
POP AX 
MOV AL , AH 
MOV BL,75
MUL BL 
MOV XSTART , AX


MOV AX,0
MOV AL,PLACENEW
MOV BX,AX

    MOV AL,state0 [BX]                 
    MOV  imgFilename[0], AL 
    MOV AL, state0[BX+1]          ;printing the background 
    MOV  imgFilename[1], AL
    MOV MODE,2
    CALL PRINT

MOV AX,0
MOV AL,PLACENEW
MOV BX,AX


PUSH XSTART
PUSH YSTART

        MOV AL,state0 [BX+2] 
        CMP AL,'X'
        JE NOTX
     
       MOV  imgFilename[0], AL 
       MOV AH, state0[BX+3]               
       MOV  imgFilename[1], AH 
       MOV AX,XKILLED
       MOV XSTART,AX
       MOV AX,YKILLED
       MOV YSTART,AX
       MOV MODE,0
       CALL PRINT
       ADD YKILLED,75
       CMP YKILLED,600
       JNE NOTX
        MOV YKILLED,0
        ADD XKILLED,75


NOTX:

POP YSTART
POP XSTART


MOV AX,0
MOV AL,PLACENEW
MOV BX,AX

  
    MOV AL,TEMPSHAPEF
    MOV STATE0[BX+2],AL       ;;UPDATE THE STATE ARRAY
    MOV AL,TEMPSHAPES
    MOV STATE0[BX+3],AL
 
MOV AX,0
MOV AL,PLACENEW
MOV BX,AX

    MOV AL,state0 [BX+2]                 
    MOV  imgFilename[0], AL 
    MOV AL, state0[BX+3]          ; PRINT THE RES MOVE
    MOV  imgFilename[1], AL
    MOV MODE,1
    CALL PRINT

POP YSTART
POP XSTART

CALL CHECKKING
        ret
MOVE ENDP



END MAIN    


