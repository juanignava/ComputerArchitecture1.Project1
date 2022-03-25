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
    
    call checkSpace
    push esi
        
    cmp byte[eax], 97       ; check if letter = 'a'
    jz .aLetter
    
    cmp byte[eax], 98       ; check if letter = 'b'
    jz .bLetter
    
    cmp byte[eax], 99       ; check if letter = 'c'
    jz .cLetter
    
    cmp byte[eax], 100      ; check if letter = 'd'
    jz .dLetter
    
    cmp byte[eax], 101      ; check if letter = 'e'
    jz .eLetter
    
    cmp byte[eax], 102      ; check if letter = 'f'
    jz .fLetter
    
    cmp byte[eax], 103      ; check if letter = 'g'
    jz .gLetter
    
    cmp byte[eax], 104      ; check if letter = 'h'
    jz .hLetter
    
    cmp byte[eax], 105      ; check if letter = 'i'
    jz .iLetter  
    
    cmp byte[eax], 106      ; check if letter = 'j'
    jz .jLetter 
    
    cmp byte[eax], 107      ; check if letter = 'k'
    jz .kLetter 
    
    cmp byte[eax], 108      ; check if letter = 'l'
    jz .lLetter                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
    
    cmp byte[eax], 109      ; check if letter = 'm'
    jz .mLetter 
    
    cmp byte[eax], 110      ; check if letter = 'n'
    jz .nLetter 
    
    cmp byte[eax], 111      ; check if letter = 'o'
    jz .oLetter 
    
    cmp byte[eax], 112      ; check if letter = 'p'
    jz .pLetter 
    
    cmp byte[eax], 113      ; check if letter = 'q'
    jz .qLetter 
    
    cmp byte[eax], 114      ; check if letter = 'r'
    jz .rLetter
    
    cmp byte[eax], 115      ; check if letter = 's'
    jz .sLetter
    
    cmp byte[eax], 116      ; check if letter = 't'
    jz .tLetter 
    
    cmp byte[eax], 117      ; check if letter = 'u'
    jz .uLetter 
    
    cmp byte[eax], 118      ; check if letter = 'v'
    jz .vLetter 
    
    cmp byte[eax], 119      ; check if letter = 'w'
    jz .wLetter 
    
    cmp byte[eax], 120      ; check if letter = 'x'
    jz .xLetter 
    
    cmp byte[eax], 121      ; check if letter = 'y'
    jz .yLetter 
    
    cmp byte[eax], 122      ; check if letter = 'z'
    jz .zLetter
    
    cmp byte[eax], 44      ; check if letter = ','
    jz .commaLetter 
    
    cmp byte[eax], 46      ; check if letter = '.'
    jz .dotLetter
    
    jmp .endLetter ; no coincidence doesn't print
    
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
    
.bLetter:
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
    push edi
    
    ; vertical line
    mov eax, 5              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
 
.cLetter:
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.dLetter:
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function    
    
    pop edi
    push edi
    
    ; positive slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function    
    
    pop edi
    push edi
    
    ; negative slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function    
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.eLetter:
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
 
.fLetter:
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.gLetter:
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
    mov ebx, 4              ; y1 coordinate
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 4              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter                            

.hLetter:
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
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter                                                                                  

.iLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.jLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; vertical line
    mov eax, 2              ; x1 coordinate
    mov ebx, 5              ; y1 coordinate
    mov ecx, 2              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
.kLetter:
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
    push edi
    
    ; pos slope line
    mov eax, 3              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 3              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
   
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.lLetter:
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
    
.mLetter:
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
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
.nLetter:
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
    
    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.oLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 2              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 2              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 3              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 3              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.pLetter:
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
    mov eax, 5              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.qLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 2              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 2              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 3              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 3              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi    
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.rLetter:
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
    mov eax, 5              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 3              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi    
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.sLetter:
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
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
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
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.tLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
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

.uLetter:
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
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 3              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.vLetter:
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
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.wLetter:
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
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 3              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 5              ; y1 coordinate
    mov ecx, 5              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.xLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.yLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    ;mov edi, ebx            ; edi holds the direction of the binary
    push edi
    
    ; pos slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi

    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.zLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.commaLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 3              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 3              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 3              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.dotLetter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; vertical line
    mov eax, 2              ; x1 coordinate
    mov ebx, 5              ; y1 coordinate
    mov ecx, 2              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; vertical line
    mov eax, 3              ; x1 coordinate
    mov ebx, 5              ; y1 coordinate
    mov ecx, 3              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    jmp .endLetter

.endLetter:
    pop esi
    inc esi                 ; increase the word counter
    inc eax                 ; increase the text direction
    cmp byte[eax], 0        ; if the text is not null analyse next character
    jnz .nextChar
    
.sig1Letter:
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
    push edi
    
    ; vertical line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; vertical line
    mov eax, 6              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    inc esi                 ; increase the word counter
    inc eax                 ; increase the text direction

.sig2Letter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; pos slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 2              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; pos slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 6              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 4              ; x1 coordinate
    mov ebx, 2              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 4              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; neg slope line
    mov eax, 2              ; x1 coordinate
    mov ebx, 4              ; y1 coordinate
    mov ecx, 4              ; x2 coordinate
    mov edx, 6              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax

    inc esi                 ; increase the word counter
    inc eax                 ; increase the text direction

.sig3Letter:
    push eax
    push ebx
    push ecx
    push edx
    
    mov edi, ebx            ; edi holds the direction of the binary
    push edi

    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 3              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 3              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    push edi
    
    ; horizontal line
    mov eax, 2              ; x1 coordinate
    mov ebx, 5              ; y1 coordinate
    mov ecx, 6              ; x2 coordinate
    mov edx, 5              ; y2 coordinate
    call drawLine           ; call draw line function
    
    pop edi
    
    pop edx
    pop ecx
    pop ebx
    pop eax
   

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
    
    mov eax, esi
    mov edx, 0
    mov ecx, 42         ; the amount of characters that fit in a line
    div ecx             ; eax / 42. eax gets the qoutient and edx the remainder
    push edx
    mov ecx, 253        ; the amount of pixels in a line
    mul ecx             ; eax * 253. eax saves the result
    mov ecx, 6          ; because each line has 6 pixels of height
    mul ecx             ; eax * 6
    add edi, eax        ; add to the array direction the total amount of pixels for the lines
    pop edx
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
    
    cmp edx, ebx        ; if y2 < y1, it is a positive slope line (in this program we consider them as 45 deg) 
    jl .slopeLinePos
    
    cmp edx, ebx        ; if y2 > y1, it is a negative slope line (in this program we condider then as 45 deg)
    jg .slopeLineNeg
    
    jmp .finish         ; if it is neither of the options dont do the drawing
    
.verticalLine:
    add edi, 253        ; since the first line doesn't has anything add 253 (the necessary to go to the next line)
    sub ebx, 1          ; substract 1 until the y1 becomes 0
    sub edx, 1          ; also substract the value of edx
    cmp ebx, 1
    jnz .verticalLine   ; if it is not 0 then the line is not printed yet
    
.verLineAux:
    mov al, 48         
    mov byte[edi], al   ; add a 0 in this space of memory ('0' ascii is 48)
    add edi, 253        ; increase edi by 253 for a new line
    inc ebx
    cmp ebx, edx        ; if y1 > y2 then the process is over
    jg .finish
    jmp .verLineAux     ; if y1 <= y2 then go for the next line
        
.horizontalLine:
    add edi, 253        ; pass to a new line until we reaxh the y level
    sub ebx, 1
    cmp ebx, 1
    jnz .horizontalLine ; jump to auxiliar function to print horizontal line

.horLineAux:
    mov bl, 48         
    mov byte[edi], bl   ; add a 0 in this space of memory ('0' ascii is 48)
    inc edi             ; increase the direction by a unit
    inc eax             ; increase the y1 to cover the rest of the line
    cmp eax, ecx        ; when y1 > y2 then the line is already painted
    jg .finish
    jmp .horLineAux     ; if y1 < y2 continue painting

.slopeLinePos:
    add edi, 253        ; pass to a new line until we reaxh the y level
    sub edx, 1     
    sub ebx, 1          ; also substract the other line
    cmp edx, 1
    jnz .slopeLinePos   ; jump to auxiliar function to print pos slope line
    sub edi, eax
    add edi, ecx    
    
.slopePosAux:
    mov al, 48         
    mov byte[edi], al   ; add a 0 in this space of memory ('0' ascii is 48)
    add edi, 252        ; increase edi by 253 for a new line
    inc edx
    cmp edx, ebx        ; if y1 > y2 then the process is over
    jg .finish
    jmp .slopePosAux    ; if y1 <= y2 then go for the next line 
    
.slopeLineNeg:
    add edi, 253        ; pass to a new line until we reaxh the y level
    sub ebx, 1     
    sub edx, 1          ; also substract the other line
    cmp ebx, 1
    jnz .slopeLineNeg   ; jump to auxiliar function to print pos slope line   
    
.slopeNegAux:
    mov al, 48         
    mov byte[edi], al   ; add a 0 in this space of memory ('0' ascii is 48)
    add edi, 254        ; increase edi by 253 for a new line
    inc ebx
    cmp ebx, edx        ; if y1 < y2 then the process is over
    jg .finish
    jmp .slopeNegAux    ; if y1 >= y2 then go for the next line    
                        
.finish:
    ret
    
;-----------------------------------------
; void checkSpace() 
; esi -> counter of letters
; eax -> direction of the text   
checkSpace:
    push eax
    push ebx
    push ecx
    push edx

    mov ebx, eax        ; save in ebx the current direction
    mov eax, esi        ; eax is needed for the operations
    mov ecx, 42         ; 42 is the amount of characters that fit in a line
    mov edx, 0          ; for a correct functionality of div
    div ecx             ; save eax = eax / 42 and edx = eax % 42
    sub ecx, edx        ; ecx saves the amount of characters left in the line
    
    mov eax, 0          ; let eax be a counter
    
.loop:
    cmp byte[ebx], 0    ; stop counting if the character is a null
    jz .decide
    inc eax             ; increase the counter and the direction of analysis
    inc ebx
    cmp byte[ebx], 32   ; comparte the value in the direction with an space (ascci 32)
    jnz .loop

.decide:
    cmp eax, ecx        ; if the amount of characters before the space is less than the ones that fit
    jle .finish
    sub ecx, 1          
    add esi, ecx        ; add more to the character counter to avoid cutting the word
    
.finish:
    pop edx
    pop ecx
    pop ebx
    pop eax
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
 
;------------------------------------------
; void exit()
; Exit program and restore resources
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret