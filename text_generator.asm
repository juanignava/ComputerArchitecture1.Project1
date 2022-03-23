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
    
    ; add the signature
    ;mov bl, 123
    ;mov eax, textFileContents
    ;call iprintLF
    ;add eax, 1762
    ;call iprintLF
    ;inc eax
    ;mov byte[eax], bl
    ;mov bl, 124
    ;inc eax
    ;mov byte[eax], bl
    
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