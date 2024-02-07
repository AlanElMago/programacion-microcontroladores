LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
__CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
    
CONST EQU b'00000101'		    ; Constante CONST es igual a 13

    ORG 0			    ; Indica el inicio del programa

SETUP				    ; Etiqueta SETUP
    BSF	    STATUS,	RP0	    ; Cambiar al Banco 1
    CLRF    TRISB		    ; Todos los pines del puerto B son de salida
    MOVLW   b'00011111'
    MOVWF   TRISD		    ; Los ultimos 5 pines del puerto D son de entrada
    BCF	    STATUS,	RP0	    ; Cambiar al Banco 0
    CLRF    PORTB
    CLRF    PORTD

LOOP				    ; Etiqueta LOOP
    RRF	    PORTD,	0	    ; Leer los pines del puerto D, rotar los bits una posicion a la izquierda y guardar el resultado al registro W
    BCF     STATUS,	C	    ; Limpiar el bit de acarreo (C)
    MOVWF   PORTB		    ; Mover el resultado (W) al puerto B
    GOTO    LOOP		    ; Ir a la etiqueta LOOP
    
    END