EXTRN imgFilename:BYTE
EXTRN MODE:BYTE
EXTRN XSTART:WORD
EXTRN YSTART:WORD


;XSTART ,YSTART IS THE START OF PHOTO 




PUBLIC Print

.MODEL SMALL
.STACK 64
.DATA

    YEND          DW  0
    XEND          DW  0

    imgWidth      EQU 75
    imgHeight     EQU 75
    imgFilehandle DW  ?
    imgData       DB  imgWidth*imgHeight dup(0)    ; EVERY ELEMNT IS 96*96PIXAL

.CODE

Print PROC FAR

              MOV  AX , @DATA
              MOV  DS , AX

              MOV  AX,XSTART
              ADD  AX,75                    ;;GET THE END OF PHOTO XEND
              MOV  XEND,AX

              MOV  AX,YSTART
              ADD  AX,75                    ;;GET THE END OF PHOTO YEND
              MOV  YEND,AX



              CALL OpenFile
              CALL ReadData

              LEA  BX , imgData             ; BL contains index at the current drawn pixel
	
              MOV  CX,XSTART                ;COL
              MOV  DX,YSTART                ;ROW
              MOV  AH,0ch
	


    ; Drawing loop

              CMP  MODE,0                   ;;WHITE
              JNE  DRAWBLACK
    drawLoopW:
              MOV  AL,[BX]
              CMP  AL,00H
              JE   NODRAWB
              INT  10h
    NODRAWB:  
              INC  CX
              INC  BX
              CMP  CX,XEND
              JNE  drawLoopW
	
              MOV  CX , XSTART
              INC  DX
              CMP  DX , YEND
              JNE  drawLoopW
              JMP  EXIT
    DRAWBLACK:



              CMP  MODE,1                   ;;BLACK
              JNE  DRAWGREEN
    drawLoopB:
              MOV  AL,[BX]
              CMP  AL,0FH
              JE   NODRAWW
              INT  10h
    NODRAWW:  
              INC  CX
              INC  BX
              CMP  CX,XEND
              JNE  drawLoopB
	
              MOV  CX , XSTART
              INC  DX
              CMP  DX , YEND
              JNE  drawLoopB
              JMP  EXIT

    DRAWGREEN:
    drawLoop: 
              MOV  AL,[BX]
              INT  10h
              INC  CX
              INC  BX
              CMP  CX,XEND
              JNE  drawLoop
	
              MOV  CX , XSTART
              INC  DX
              CMP  DX , YEND
              JNE  drawLoop


    EXIT:     

              call CloseFile
    RET 

Print ENDP

OpenFile PROC

    ; Open file

              MOV  AH, 3Dh
              MOV  AL, 0                    ; read only
              LEA  DX,imgFilename
              INT  21h
   
              MOV  [imgFilehandle], AX
              RET

OpenFile ENDP

ReadData PROC
              MOV  AH,3Fh
              MOV  BX, [imgFilehandle]
              MOV  CX,imgWidth*imgHeight    ; number of bytes to read
              LEA  DX, imgData
              INT  21h
              RET
ReadData ENDP


CloseFile PROC
              MOV  AH, 3Eh
              MOV  BX, [imgFilehandle]
              INT  21h
              RET
CloseFile ENDP



END Print