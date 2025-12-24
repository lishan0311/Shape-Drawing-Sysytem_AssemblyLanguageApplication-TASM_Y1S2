.model small                                                       ;Define the memory model as small
.stack 100h                                                        ;Set stack size to 256 bytes
.data                                                              ;Start of the data segment
    menuheader db 'Shape Drawing Implementation',13,10             ; Header text with new line
               db '--------------------------------------','$'
                                                                   ; Menu options
     menutext  db '1. Pyramid',13,10
               db '2. Triangle',13,10
               db '3. Rectangle',13,10
               db '4. Square',13,10
               db '5. Diamond',13,10
               db '6. Exit','$'

    menuchoice db 'Enter your choice:','$'                         ; Prompt for user input

       colmsg  db 'Please enter the number of columns (1-9):','$'  ; Message for column input
       rowmsg  db 'Please enter the number of rows (1-9):','$'     ; Message for row input

     input_col db ?                                                ; Variable to store column input
     input_row db ?                                                ; Variable to store row input

       STAR DB ?
     BLANK DB ?
                                               

    errormsg   db 13,10, 'Invalid input, please enter a valid number.','$' ; Error message

    exitmsg    db 'Thank You.','$'                                 ; Exit message
 
    newline    db 13,10, '$'                                       ; Newline character

.code                                                              ; Start of the code segment

Main Proc
        mov ax, @data                                              ; Load data segment into AX
        mov ds, ax                                                 ; Move AX into DS

        menu:  mov ah, 09h                                         ; DOS function to print a string
               mov dx, offset menuheader
               int 21h                                             ; Display menu header
   

               mov ah, 09h                                        
               mov dx, offset newline
               int 21h                                             ; Print newline

               mov ah,09h
               mov dx, offset menutext
               int 21h                                             ; Print menu options

               mov ah, 09h
               mov dx, offset newline
               int 21h                                             ; Print newline

               mov ah, 09h
               mov dx, offset menuchoice
               int 21h                                             ; Ask for user choice

               mov ah, 01h
               int 21h                                             ; Read user input from keyboard

               mov ah, 09h
               mov dx, offset newline
               int 21h                                             ; Print newline
                
               cmp al,'1'                                          ; Compare input with '1'
               je pyramid                                          ; Jump to pyramid drawing if matched

               cmp al,'2'
               je near_tri                                   	   ; Jump to triangle drawing if matched

               cmp al,'3'
               je near_rec                                         ; Jump to rectangle drawing if matched

               cmp al,'4'                                     
               je near_square                                      ; Jump to square drawing if matched

               cmp al,'5'
               je near_diamond                                     ; Jump to diamond drawing if matched

               cmp al,'6'
               je near_exitProgram                                 ; Jump to exit if matched

               jmp error                                           ; If none matched,show error


    near_tri:
               jmp tri                                             ; Jump to triangle function


    near_rec:
               jmp rec                                             ; Jump to rectangle function

    near_square:
               jmp square                                          ; Jump to suqare function

    near_diamond:
               jmp dia                                             ; Jump to circle function

    near_exitProgram:
               jmp exitProgram                                     ; Jump to exit program

     error:
               mov ah,09h
               mov dx, offset errormsg
               int 21h                                             ; Display error message
            
               jmp menu                                            ; Return to menu



     pyramid:
              mov ah,09h                                           ; Set function to display string
              mov dx, offset rowmsg                                ; Load the address of row message
              int 21h                                              ; Interrupt 21h to display row message (prompt user for input)


              mov ah,01h                                           ; Set function to take user input (single character)
              int 21h                                              ; Interrupt 21h to get the input
              sub al,'0'                                           ; Convert ASCII digit to integer by subtracting '0'
              mov input_row, al                                    ; Store input value in input_row        

              cmp al,1                                             ; Check if the input is less than 1
              jl error_pyramid_row                                    ; If yes, jump to error_pyramid_row
              cmp al,9                                             ; Check if the input is greater than 9
              jg error_pyramid_row                                    ; If yes, jump to error_pyramid_row

              jmp draw_pyramid                                     ; If valid input, jump to draw the pyramid

       error_pyramid_row:             
               mov ah, 09h                                         ; Set function to display error message
               mov dx, offset errormsg                             ; Load error message address
               int 21h                                             ; Interrupt 21h to display error message

              jmp pyramid                                          ; Go back to take input again

       draw_pyramid:
              mov ah, 09h                                          ; Set function to display newline
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Interrupt 21h to print a newline

              mov cl, input_row                                    ; Load number of rows into CL
              mov bx,1                                             ; Set the initial number of stars to 1
           
     pyramid_row_loop:
              push cx                                              ; Save row counter on stack

              mov ah,2                                             ; Set function to print character
              mov dl,' '                                           ; Space character to center the pyramid

     pyramid_space_loop:
              int 21h                                              ; Print space
              loop pyramid_space_loop                               ; Loop until CL reaches zero (spaces are printed)

              mov cx,bx                                            ; Load the number of stars to print
              mov dl, '*'                                          ; Set '*' as the printing character

     pyramid_column_loop:
              int 21h                                              ; Print '*'
              loop pyramid_column_loop                              ; Loop until CX reaches zero

              mov ah,09h                                           ; Set function to print newline
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Print a newline

              add bx,2                                             ; Increase number of stars for next row

              pop cx                                               ; Restore row counter from stack
              loop pyramid_row_loop                                 ; Repeat loop for the number of rows

              mov ah,01h                                           ; Wait for user input
              int 21h                                                

              cmp al,0Dh                                           ; Check if Enter key is pressed
              jmp menu                                             ; Return to menu



	tri:
              mov ah,09h                                           ; Prepare for string output
              mov dx, offset rowmsg                                ; Load thr address of rowmsg to display message
              int 21h                                              ; Print message asking for number of rows

              mov ah,01h                                           ; Read a single character input for the user
              int 21h                                              ; Dos interrupt to read input
              sub al, '0'                                          ; Convert ASCII digit to numerical value
              mov input_row, al                                    ; Store the row count in input_row variable

              cmp al,1                                             ; Check if input is less than 1
              jl error_Tri_row                                    ; If input is invalid,jump to error message
              cmp al,9                                             ; Check if input is greater than 9
              jg error_Tri_row                                    ; If input is invalid,jump to error message

             jmp draw_Tri                                         ; Jump to the function that draws the triangle

       error_Tri_row:             
              mov ah, 09h                                          ; Prepare for string output
              mov dx, offset errormsg                              ; Load error message address
              int 21h                                              ; Print error message


              jmp tri                                              ; Jump back to re-enter row input


     draw_Tri:
              mov ah, 09h                                          ; Prepare for string output
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Print newline for spacing

              mov ah,02                                            ; Prepare for character output
              mov bl,input_row                                     ; Store input row count in BL register
              mov ch,1                                             ; Initialize CH to 1 (row counter)

    Tri_line_loop:
              mov bl, input_row                                    ; Reload input_row value in BL
              mov cl,bl                                            ; Copy BL (total rows) into CL
              sub cl,ch                                            ; Compute spaces needed before stars

    Tri_space_loop:
              cmp cl,0                                             ; Check if there are spaces to print
              je Tri_print_star                                   ; If no spaces left, print stars
              mov dl,' '                                           ; Load space character
              int 21h                                              ; Print space
              dec cl                                               ; Decrement space counter
              jmp Tri_space_loop                                  ; Loop until spaces are printed

    Tri_print_star:
              mov cl,ch                                            ; Set CL to current row number

     Tri_star_loop:
              cmp cl,0                                             ; Check if there are stars to print
              je Tri_new_line                                     ; If no stars left, go to new line
              mov dl,'*'                                           ; Load '*' character
              int 21h                                              ; Print star
              dec cl                                               ; Decrease star counter

              jmp Tri_star_loop                                   ; Loop until stars are printed


      Tri_new_line:
              mov ah,02                                            ; Prepare for new line character output
              mov dl,10                                            ; Load newline character
              int 21h                                              ; Print newline

              inc ch                                               ; Increase row counter for next row
              mov al,bl                                            ; Load input_row value
              inc al                                               ; Increment total row count
              cmp ch,al                                            ; Check if all rows are printed
              jl Tri_line_loop                                    ; If not, repeat loop

              mov ah,01h                                           ; Prepare to read a single character input
              int 21h                                              ; DOS interrupt to read input

              cmp al,0Dh                                           ; Compare input with carriage return (Enter key)
              jmp menu                                             ; Return to the menu



        rec   :mov ah,09h
               mov dx, offset colmsg
               int 21h                                             ;Prompt for column input

               mov ah,01h
               int 21h                                             ; Read input character
               sub al, '0'                                         ; Convert ASCII to integer
               mov input_col, al                                   ; Store input

               cmp al,1                                            ; Check if input is <1
               jl error_rec_col                                    ; If yes, show error
               cmp al,9                                            ; Check if input is >9
               jg error_rec_col                                    ; If yes,show error

               jmp rec_row
                                                                   ; Proceed to row input
       error_rec_col:             
               mov ah, 09h
               mov dx, offset errormsg
               int 21h                                             ; Show error
                                                                  
               jmp rec                                             ; Re-enter column input

      rec_row:
               mov ah, 09h
               mov dx, offset newline
               int 21h                                             ; Print newline          

               mov ah,09h
               mov dx, offset rowmsg
               int 21h                                             ; Prompt for row input

               mov ah, 01h
               int 21h                                             ; Read input character
               sub al, '0'                                         ; Convert ASCII to integer
               mov input_row, al                                   ; Store input

               cmp al,1                                            ; Validate input
               jl error_rec_row
               cmp al,9
               jg error_rec_row

               jmp draw_rec                                        ; Proceed to draeing

       error_rec_row:
               mov ah, 09h
               mov dx, offset errormsg
               int 21h                                             ; Show error

               jmp rec_row                                         ; Re-enter row input


      draw_rec:
               mov ah, 09h
               mov dx, offset newline
               int 21h                                             ; Print newline           

               mov al, input_row
               mov ch, al                                          ; Store row count in CH

     rec_row_loop:
               mov al, input_col
               mov cl, al                                          ; Store column count in CL

    rec_column_loop:
               mov dl,'*'                                          ; Print'*'
               mov ah,2
               int 21h

               mov dl,' '                                          ; Print space
               int 21h
               dec cl
               jne rec_column_loop                                 ; Loop until column count is reached

               mov ah,02
               mov dl,10                                           ; Newline
               int 21h

               dec ch
               jne rec_row_loop                                    ; Loop until row count is reached

               mov ah,01h
               int 21h                                             ; DOS interrupt to read input
                                                                 
               cmp al,0Dh                                          ; Compare input with carriage return
               jmp menu                                            ; Jump back to the menu

                                     

       square:
              mov ah,09h                                           ; Set function to display string
              mov dx, offset rowmsg                                ; Load row message address
              int 21h                                              ; Display row message

              mov ah,01h                                           ; Set function to take user input
              int 21h                                              ; Read input from user
              sub al,'0'                                           ; Convert ASCII to integer
              mov input_row, al                                    ; Store input in input_row

              cmp al,1                                             ; Check if input is less than 1
              jl error_square_row                                  ; If yes, jump to error handler
              cmp al,9                                             ; Check if input is greater than 9
              jg error_square_row                                  ; If yes, jump to error handler

              jmp draw_square                                      ; Jump to drawing square pattern

       error_square_row:             
              mov ah, 09h                                          ; Set function to display error message
              mov dx, offset errormsg                              ; Load error message
              int 21h                                              ; Display error message

              jmp square                                           ; Retry input

        draw_square:
              mov ah, 09h                                          ; Set function to display newline
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Print newline

              mov ch,input_row                                     ; Store the number of rows in CH
              mov bl,ch                                            ; Copy the value to BL

      square_row_loop:
              mov cl,ch                                            ; Load column count

      square_column_loop:
              mov dl,'*'                                           ; Set '*' as the printing character
              mov ah,2                                             ; Set function to print character
              int 21h                                              ; Print '*'
 
              mov dl,' '                                           ; Set ' ' (space) as printing character
              int 21h                                              ; Print space
              dec cl                                               ; Decrement column counter
              jne square_column_loop                               ; Loop to print '*' and spaces in a row

              mov ah,09h                                           ; Set function to print newline
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Print newline

              dec bl                                               ; Decrement row counter
              jne square_row_loop                                  ; Loop until all rows are printed
 
              mov ah,01h                                           ; Wait for user input
              int 21h

              cmp al,0Dh                                           ; Check if Enter key is pressed
              jmp menu                                             ; Return to menu


            
         dia: MOV CX,5                                             ; Set CX=5
              MOV BX,1                                             ; Set bx=1
              
          up_dia:
              PUSH CX                                              ; Save CX on the stack to restore later
    
    
          dia_space:
              MOV AH,2 
    	      MOV DL,32                                            ; ASCII code for space (' ')
   	      INT 21H                                              ; Print space
   	      LOOP dia_space                                       ; Repeat until CX = 0
     
    
    	      MOV CX,BX                                            ; Set CX= BX

   	 up_stars:
    	      MOV AH,2
    	      MOV DL,'*'                                           ; ASCII code for '*'
   	      INT 21H                                              ; Print '*'
    	      LOOP up_stars                                        ; Repeat for CX times
    
    	      MOV AH,2
    	      MOV DL,10                                            ; ASCII code for newline
    	      INT 21H
    	      MOV DL,13                                            ; ASCII code for carriage return
    	      INT 21H                                              ; Move to the next line
    
    	      INC BX
    	      INC BX                                               ; Increase BX by 2
    
    	      POP CX                                               ; Restore CX from the stack
    	      LOOP up_dia                                          ; Repeat outer loop for the next row
    
    
    	      MOV CX,4                                             ; Set CX = 4 (number of rows for the inverted pyramid)
    	      MOV BH,7                                             ; BH = 7 (initial number of stars)
    	      MOV BL,2                                             ; BL = 2 (initial number of spaces) 
     
    	      MOV STAR,BH                                          ; Store number of stars  
     	      MOV BLANK,BL                                         ; Store number of spaces
    
   	inv_pyr:
    	      CMP BLANK,0
    	      JE inv_stars                                         ; If BLANK = 0, jump to L5 (start printing stars)
	      MOV AH,2
    	      MOV DL,32                                            ; ASCII code for space (' ')
    	      INT 21H                                              ; Print space
    	      DEC BLANK                                            ; Decrease space counter 
    	      CMP BLANK,0
    	      JMP inv_pyr                                          ; Repeat until all spaces are printed 

        
   	inv_stars:
    	      MOV AH,2
    	      MOV DL,'*'                                           ; ASCII code for '*'
    	      INT 21H
    	      DEC STAR                                             ; Decrease star counter  
    	      CMP STAR,0
    	      JNE inv_stars                                        ; Repeat until all stars are printed 
 
    	      MOV AH,2
    	      MOV DL,10                                            ; ASCII code for newline
    	      INT 21H
    	      MOV DL,13                                            ; ASCII code for carriage return
    	      INT 21H                                              ; Move to the next line  
    
    	      DEC BH
    	      DEC BH                                               ; Decrease the number of stars by 2  
    	      MOV STAR,BH                                          ; Update STAR for the next row  
    
    	      INC BL
    	      MOV BLANK,BL                                         ;Increase the number of leading spaces  
    
    	      LOOP inv_pyr                                         ; Repeat for the next row in the inverted pyramid 

	
              mov ah,01h                                           ; Read user input
              int 21h                                              ; Wait for key press

              cmp al,0Dh                                           ; Check if Enter key is pressed
              jmp menu                                             ; Return to menu



 exitProgram: mov ah, 09h                                          ; Set function to print newline
              mov dx, offset newline                               ; Load newline address
              int 21h                                              ; Print newline

              mov ah, 09h                                          ; Set function to display exit message
              mov dx, offset exitmsg                               ; Load exit message address
              int 21h

              mov ah, 4ch                                          ; Set function to terminate program
              int 21h                                              ; Terminate program

main endp
end main                                                           ; End of the program

               



