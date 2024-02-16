LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
; __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

CONST EQU b'00001101'       ; Constante CONST es igual a 13
    
    ORG 0                   ; Indica el inicio del programa

SETUP
    BSF     STATUS,     RP0
    CLRF    TRISB
    MOVLW   b'00011111'
    MOVWF   TRISD
    BCF     STATUS,     RP0
    CLRF    PORTB
    CLRF    PORTD

MAIN
    MOVLW   CONST
    SUBWF   PORTD,      W
    MOVLW   b'11110000'     ; Supone que (PORTD) es menor. 
    BTFSC   STATUS,     C   ; ¿C=0?, ¿(W) negativo?, ¿(PORTD) < CONST? 
    MOVLW   b'01010101'     ; Supone que (PORTD) es mayor. 
    BTFSC   STATUS,     Z   ; ¿Z=0?, ¿son distintos? 
    MOVLW   b'11111111'     ; No, por tanto (PORTD) = NUMERO. 
    MOVWF   PORTB           ; Resultado se visualiza por el puerto de salida. 
    GOTO    MAIN            ; Crea un bucle cerrado e infinito.
    
    END
    