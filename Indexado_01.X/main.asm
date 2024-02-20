LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
__CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

    ORG     0

Inicio
    BSF     STATUS,     RP0
    CLRF    TRISB
    MOVLW   b'00011111'
    MOVWF   TRISD
    BCF     STATUS,     RP0
    CLRF    PORTB                   ; Limpiar el puerto B
    CLRF    PORTD                   ; Limpiar el puerto D
Principal
    MOVF    PORTD,      W
    ANDLW   b'00000111'
    ADDWF   PCL,        F
Tabla
    GOTO    Configuracion0
    GOTO    Configuracion1
    GOTO    Configuracion2
    GOTO    Configuracion3
    GOTO    Configuracion4
    GOTO    Configuracion5
    GOTO    Configuracion6
    GOTO    Configuracion7
Configuracion0
    MOVLW   b'00001010'             ;Configuracion
    GOTO    ActivaSalida
Configuracion1
    MOVLW   b'00001001'             ;Configuracion 1.
    GOTO    ActivaSalida
Configuracion2
    MOVLW   b'00100011'             ;Configuracion 2.
    GOTO    ActivaSalida
Configuracion3
    MOVLW   b'00001111'             ;Configuracion 3.
    GOTO    ActivaSalida
Configuracion4
    MOVLW   b'00100000'             ;Configuracion 4.
    GOTO    ActivaSalida
Configuracion5
    MOVLW   b'00000111'             ;Configuracion 5.
    GOTO    ActivaSalida
Configuracion6
    MOVLW   b'00010111'             ;Configuracion 6.
    GOTO    ActivaSalida
Configuracion7
    MOVLW   b'00111111'             ;Configuracion 7.
ActivaSalida
    MOVWF   PORTB                   ;Visualiza por el puerto de salida
    GOTO Principal
    
    END
