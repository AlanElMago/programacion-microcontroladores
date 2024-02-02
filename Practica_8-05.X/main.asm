LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
; __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF

MASK EQU b'11111111'		    ; Mascara para invertir los bits con la operacion XOR

    ORG 0

SETUP
    BSF	    STATUS,	RP0	    ; Cambiar al banco 1
    CLRF    TRISB		    ; Todos los pines del puerto B son de salida
    MOVLW   b'00011111'
    MOVWF   TRISD		    ; Los ultimos 5 pines del puerto D son de entrada
    BCF	    STATUS,	RP0	    ; Cambiar al banco 0

LOOP
    MOVF    PORTD,	0	    ; Leer los pines del puerto D y mover el resultado al registro W
    XORLW   MASK		    ; Operacion XOR del constante MASK con el registro W
    MOVWF   PORTB		    ; Mover el resultado de la operacion (W) al puerto B
    GOTO    LOOP		    ; Ir a la etiqeta LOOP

    END