EXTRN imgFilename:BYTE
EXTRN YSTART:WORD


PUBLIC PrintGrid

.MODEL SMALL
.STACK 64
.DATA

    YEND          DW  0


    imgWidth      EQU 600
    imgHeight     EQU 75
    imgFilehandle DW  ?
    imgData       DB  imgWidth*imgHeight dup(0)    ; EVERY ELEMNT IS 96*96PIXAL

.CODE

PrintGrid PROC FAR

              MOV  AX , @DATA
              MOV  DS , AX

              MOV  AX,YSTART
              ADD  AX,75                    ;;GET THE END OF PHOTO YEND
              MOV  YEND,AX

              CALL OpenFile
              CALL ReadData
              LEA  BX , imgData             ; BL contains index at the current drawn pixel
              MOV  CX,0                     ;COL
              MOV  DX,YSTART                ;ROW
              MOV  AH,0ch

    ; Drawing loop
    drawLoop: 
              MOV  AL,[BX]
              INT  10h
              INC  CX
              INC  BX
              CMP  CX,600
              JNE  drawLoop
	
              MOV  CX , 0
              INC  DX
              CMP  DX , YEND
              JNE  drawLoop

              call CloseFile
          RET    

PrintGrid ENDP

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



END PrintGrid