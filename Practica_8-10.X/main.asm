LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
__CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

    ORG 0                           ; Indica el inicio del programa

SETUP                               ; Etiqueta SETUP
    BSF     STATUS,     RP0         ; Cambiar al banco 1
    CLRF    TRISB                   ; Todos los pines del puerto B son de salida
    MOVLW   b'00011111'
    MOVWF   TRISD                   ; Los ultimos 5 pines del puerto D son de entrada
    BCF     STATUS,     RP0         ; Cambiar al banco 0
    CLRF    PORTB                   ; Limpiar el puerto B
    CLRF    PORTD                   ; Limpiar el puerto D

LOOP                                ; Etiqueta LOOP
    MOVF    PORTD, 0                ; Leer los pines del puerto D y mover el resultado al registro W
    MOVWF   PORTB                   ; Mover el resultado al puerto B

    SLEEP                           ; Entrar en modo standby

    END