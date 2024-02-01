# Introducción
Este repositorio es para realizar las actividades de programación para la materia de Programación en Microcontroladores en lenguaje ensamblador MPASM para el PIC16F877A.

# Convenciones
Para empezara desarrollar un projecto en ensamblador, se necesita poner el siguiente codigo al principio a cada archivo fuente .asm.

```
LIST P=16f877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
; __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para Entrenador
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF
```

Después se necesita declarar las constantes, por ejemplo:
```
CONST EQU b'00001101'		    ; Constante CONST es igual a 13
```

Y al final el contador de localización:
```
ORG 0			                  ; Indica el inicio del programa
```
