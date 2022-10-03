; CODE BY SALIM AND FOYSAL
;201-15-3117 & 201-15-3442

.MODEL SMALL
.STACK 100H
.DATA 
MSG1 db "                           ** Welcome to 8086 Bank**                           $"     
MSG2 db 10,13, "                                   4 OCT 2022                           $"                                                                                                          
MSG3 db 10,13, "Account Number     : 201-15-3117 $"  
MSG4 db 10,13, "Accountholder Name : Salim Reza Joy $"
MSG5 db 10,13, "Current Balance    :  $"     


MSG6 db 10,13, "Press an Option Between 1 and 2 Or Press any Key to Exit : ",10,13,"1. Deposite ",10,13,"2. Withdraw ",10,13,"OR any to Exit",10,13,10,13,"Enter a choice: $"
MSG7 db 10,13, "Ammount to Deposite    :  $"   
MSG8 db 10,13, "Ammount to Withdraw    :  $"   

MSG9 db 10,13, "Thank You $"
         
newLine db 10,13, "$" 

currentBalance db '0'


.CODE
MAIN PROC 
    
    
    MOV AX,@Data 
    MOV DS,AX    
    
    UPPER:
    LEA DX,MSG1
    MOV AH,9
    INT 21H   
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H     
    
    ;Newline 
    MOV AH, 09
    MOV DX, offset newLine
    int 21H

    LEA DX,MSG3
    MOV AH,9
    INT 21H  
    
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG5
    MOV AH,9
    INT 21H  
    
    MOV BL, currentBalance 
   
    
    MOV AH,2
    MOV DL,BL
    INT 21H  
    
    
    ;Newline 
    MOV AH, 09
    MOV DX, offset newLine
    int 21H
    
    LEA DX,MSG6
    MOV AH,9
    INT 21H 
    
    ;input
    
    MOV ah,01
    int 21h
    MOV BL,AL
    
    CMP BL,'1'
    JE GOTOSUM 
    
    
    
    CMP BL,'2'
    JE GOTOSUB
    
    JMP EXIT
   
    MOV AX,02
    MOV BX,03
    int 10h 
    
    LOOP Upper
      
    GOTOSUM:
    LEA DX,MSG7
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    MOV  BL,AL
    SUB BL,48
    ADD BL,currentBalance
    MOV currentBalance,BL
    
    MOV AX,02
    MOV BX,03
    int 10H   
    
    JMP Upper
    
     
    
    GOTOSUB: 
    LEA DX,MSG8
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV  BL,AL 
    SUB currentBalance,BL
    ADD currentBalance,'0'   
        
    MOV AX,02
    MOV BX,03
    int 10H
      
    JMP Upper 
    
    
    Exit:  
    LEA DX,MSG9
    MOV AH,9
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN

    