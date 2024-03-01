LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
__CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

DIGITO_0 EQU b'00111111'
DIGITO_1 EQU b'00000110'
DIGITO_2 EQU b'01011011'
DIGITO_3 EQU b'01001111'
DIGITO_4 EQU b'01100110'
DIGITO_5 EQU b'01101101'
DIGITO_6 EQU b'01111101'
DIGITO_7 EQU b'00000111'
DIGITO_8 EQU b'01111111'
DIGITO_9 EQU b'01101111'
DIGITO_A EQU b'01110111'
DIGITO_B EQU b'01111100'
DIGITO_C EQU b'00111001'
DIGITO_D EQU b'01011110'
DIGITO_E EQU b'01111001'
DIGITO_F EQU b'01110001'

    ORG     0
    
Inicio
    BSF     STATUS,     RP0
    CLRF    TRISB
    MOVLW   b'00001111'
    MOVWF   TRISD
    BCF     STATUS,     RP0
    CLRF    PORTB                   ; Limpiar el puerto B
    CLRF    PORTD                   ; Limpiar el puerto D
Main
    MOVF    PORTD,      W
    ANDLW   b'00001111'
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
    GOTO    Configuracion8
    GOTO    Configuracion9
    GOTO    ConfiguracionA
    GOTO    ConfiguracionB
    GOTO    ConfiguracionC
    GOTO    ConfiguracionD
    GOTO    ConfiguracionE
    GOTO    ConfiguracionF
Configuracion0
    MOVLW   DIGITO_0             ;Configuracion
    GOTO    ActivaSalida
Configuracion1
    MOVLW   DIGITO_1             ;Configuracion
    GOTO    ActivaSalida
Configuracion2
    MOVLW   DIGITO_2             ;Configuracion
    GOTO    ActivaSalida
Configuracion3
    MOVLW   DIGITO_3             ;Configuracion
    GOTO    ActivaSalida
Configuracion4
    MOVLW   DIGITO_4             ;Configuracion
    GOTO    ActivaSalida
Configuracion5
    MOVLW   DIGITO_5             ;Configuracion
    GOTO    ActivaSalida
Configuracion6
    MOVLW   DIGITO_6             ;Configuracion
    GOTO    ActivaSalida
Configuracion7
    MOVLW   DIGITO_7             ;Configuracion
    GOTO    ActivaSalida
Configuracion8
    MOVLW   DIGITO_8             ;Configuracion
    GOTO    ActivaSalida
Configuracion9
    MOVLW   DIGITO_9             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionA
    MOVLW   DIGITO_A             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionB
    MOVLW   DIGITO_B             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionC
    MOVLW   DIGITO_C             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionD
    MOVLW   DIGITO_D             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionE
    MOVLW   DIGITO_E             ;Configuracion
    GOTO    ActivaSalida
ConfiguracionF
    MOVLW   DIGITO_F             ;Configuracion
    GOTO    ActivaSalida
ActivaSalida
    MOVWF   PORTB
    GOTO    Main
    
    END