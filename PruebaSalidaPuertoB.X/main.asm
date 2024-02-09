; Programa para probar el puerto B como una salida en el PIC16F877A. Esta
; programado para un oscilador de 16 MHz.

LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
; __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

DELAY_COUNTER_1 EQU 0x20
DELAY_COUNTER_2 EQU 0x21
DELAY_COUNTER_3 EQU 0x22

    ORG 0

SETUP
    BSF     STATUS,     RP0
    CLRF    TRISB
    BCF     STATUS,     RP0
    CLRF    PORTB
    BSF     PORTB,      0

MAIN
    CALL    DELAY_PROC
    RLF     PORTB,      1
    GOTO    MAIN

DELAY_PROC
    MOVLW   b'11111111'
    MOVWF   DELAY_COUNTER_1
    MOVWF   DELAY_COUNTER_2
    MOVLW   b'00111111'
    MOVWF   DELAY_COUNTER_3
    CALL    DELAY_LOOP_PROC
    RETURN

DELAY_LOOP_PROC
    DECFSZ  DELAY_COUNTER_1,    1
    GOTO    DELAY_LOOP_PROC
    DECFSZ  DELAY_COUNTER_2,    1
    GOTO    DELAY_LOOP_PROC
    DECFSZ  DELAY_COUNTER_3,    1
    GOTO    DELAY_LOOP_PROC
    RETURN
    
    END