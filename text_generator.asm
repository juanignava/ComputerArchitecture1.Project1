; Text generator program
; this program reads a text document and generates a binar that represents
;   text in a graphic way.
; Student: Juan Ignacio Navarro
; Computer Architecture - Project 1
; Compile with: nasm -f elf text_generator.asm
; Link with: ld -m elf_i386 text_generator.o -o text_generator
; Run with: ./text_generator

%include 'functions.asm'

SECTION .data
; text file
textFilename db 'message.txt', 0h   ; the filename to read
textFileSize db 1764                ; the maximum amount of characters on the file 

; binary file
binaryFilename db 'binary.txt', 0h    ; the filename to write
binaryFileSize db 63756

SECTION .bss
textFileContents resb 1764,      ; variable to store file contents
binaryFileContents resb 63756    ; variable to store the binary result

SECTION .text
global _start

_start:
    mov ebp, esp; for correct debugging
       
    ; open the file
    mov ecx, 0                  ; flag for readonly access mode (O_RDONLY)
    mov ebx, textFilename       ; filename from the text to open
    mov eax, 5                  ; invoke SYS_OPEN (kernel opcode 5)
    int 80h                     ; call the kernel

    
    ; read the file   
    mov edx, textFileSize       ; number of bytes to read - one for each letter of the file
    mov ecx, textFileContents   ; move the memory address of our file contents variable into ecx
    mov ebx, eax                ; move the opened file descriptor into ebx
    mov eax, 3                  ; invoke SYS_READ (kernel opcode 3)
    int 80h                     ; call the kernel
    
    ; close the file
    mov     ebx, ebx            ; not needed but used to demonstrate that SYS_CLOSE takes a file descriptor from EBX
    mov     eax, 6              ; invoke SYS_CLOSE (kernel opcode 6)
    int     80h                 ; call the kernel
    
    ; fill binary array with ones
    mov eax, binaryFileContents ; load the binaryFile into the eax register
    call fillOnes               ; fill the file with ones first
    
    ; fill the zeros
    mov eax, textFileContents   ; load the direction of the file contents
    mov ebx, binaryFileContents ; loas the direction of the binary file
    call readText
    
    ; open the binary file   
    mov     ecx, 1              ; flag for writeonly access mode (O_WRONLY)
    mov     ebx, binaryFilename ; binary file name
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel
    
    ; write in the file
    mov     edx, binaryFileSize   ; number of bytes to write - one for each letter of our contents string
    mov     ecx, binaryFileContents ; move the memory address of our contents string into ecx
    mov     ebx, eax            ; move the file descriptor of the file we created into ebx
    mov     eax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel
    
    
    call quit                   ; call our quit function
    
    
;-----------------------------
; void ReadText
; receive the the direction of the 
; text and analyse it character by character to
; draw the respective image
; eax -> holds direction of the text
; ebx -> holds direction of the binary
readText:
    push eax
    push ebx
    push ecx
    push esi
    mov esi, ebx
    call drawNewLines
    mov esi, 0              ; character counter
    
.nextChar:
    cmp byte[eax], 97       ; check if letter = 'a'
    jz .aLetter
    jmp .endLetter          ; no coincidence doesn't print
    
.aLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 2              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
    
.endLetter:

    inc esi                 ; increase the word counter
    inc eax                 ; increase the text direction
    cmp byte[eax], 0        ; if the text is not null analyse next character
    jnz .nextChar

.finish:
    pop esi
    pop ecx
    pop ebx
    pop eax
    ret

;------------------------------------------
; void drawNewLines()
; add the new line character in the memory to see
; better the document
; input: esi -> direction
drawNewLines:
    push esi
    push eax
    push ecx
    push edx
    push ebx
    mov ebx, 0                 ; ebx is the counter of bytes
    mov cl, 10                 ; save the ascii of a new line in the given direction
    mov byte[esi + ebx], cl
    
.loop:
    inc ebx                     ; increase counter 
    mov edx, 0                  ; edx has to be 0 before division
    mov ecx, 253                ; divide eax/253 and if there is no remainder that is a new line character position
    mov eax, ebx
    div ecx

    cmp edx, 0
    jnz .loop                   ; if there is remainder try with the next character
    
    mov cl, 10                  ; save the ascii of a new line in the given direction
    mov byte[esi + ebx], cl     
    
    mov ecx, 252                ; check the amount of lines analysed
    cmp eax, ecx                ; if 252 have been analysed then finish the process
    jnz .loop
    
.finish:
    pop ebx
    pop edx
    pop ecx
    pop eax
    pop esi
    ret

;------------------------------------------
; void DrawLine()
; this function draws a line given two points in the
; parameters
; input: (eax, ebx) -> corresponds to the first point (x1, y1)
; input: (ecx, edx) -> corresponds to the second point (x2, y2)
; input: esi -> corresponds to the character counter 
; input: edi -> the actual direction of the binary file
drawLine:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edx, 0
    mov ecx, 42         ; the amount of characters that fit in a line
    div ecx             ; eax / 42. eax gets the qoutient and edx the remainder
    mov ecx, 252        ; the amount of pixels in a line
    mul ecx             ; eax * 253. eax saves the result
    mov ecx, 6          ; because each line has 6 pixels of height
    mul ecx             ; eax * 6
    add edi, eax        ; add to the array direction the total amount of pixels for the lines
    mov eax, edx        ; add the own line pixels
    mul ecx             ; multiply by 6, each character has 6 pixels
    add edi, eax        ; complete the own line addition of pixels
        
    pop edx
    pop ecx
    pop ebx
    pop eax
  
    add edi, eax        ; add the x1 coordinate to begin the calculations where it has to be
    
    cmp eax, ecx
    jz .verticalLine    ; if both x coordinates are the same, it is a vertical line
    
    cmp ebx, edx
    jz .horizontalLine  ; if both y coordinates are the same, it is an horizontal line
    
    jmp .finish         ; if it is neither of the options dont do the drawing
    
.verticalLine:
    add edi, 253        ; since the first line doesn't has anything add 253 (the necessary to go to the next line)

    mov al, 48         
    mov byte[edi], al   ; add a 0 in this space of memory ('0' ascii is 48)
    
    inc ebx
    cmp ebx, edx        ; if y1 > y2 then the process is over
    jg .finish
    jmp .verticalLine   ; if y1 <= y2 then go for the next line
        
.horizontalLine:
    add edi, 253        ; pass to a new line until we reaxh the y level
    sub ebx, 1
    cmp ebx, 0
    jnz .horLineAux     ; jump to auxiliar function to print horizontal line

.horLineAux:
    mov bl, 48         
    mov byte[edi], bl   ; add a 0 in this space of memory ('0' ascii is 48)
    inc edi             ; increase the direction by a unit
    inc eax             ; increase the y1 to cover the rest of the line
    cmp eax, ecx        ; when y1 > y2 then the line is already painted
    jg .finish
    jmp .horLineAux     ; if y1 < y2 continue painting
            
.finish:
    ret


;------------------------------------------
; void fillOnes()
; Fill the resultant binary file with ones (to avoid trash in
;  memory to interfere later
; input -> eax: direction of the binary file
fillOnes: 
   push eax                 
   push ecx
   push ebx 
   mov ecx, 0                   ; ecx will hold the counter
 
.fillNext:
   mov bl, 49                   ; 49 is ascii for '1'
   mov byte[eax + ecx], bl      ; add '1' into the direction given
   inc ecx                      ; increase the counter
   mov ebx, 63756               ; 63756 is the total amount of pixels in the image

   cmp ecx, ebx                 ; compare 63756 with the counter to finish the process
   jnz .fillNext
   
   inc ecx
   mov bl, 0                    ; 49 is ascii for 'null'
   mov byte[eax + ecx], bl      ; add 'null' into the direction given
   
.finish:
   pop ebx
   pop ecx
   pop eax
   ret 
