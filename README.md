# Introducción
Este repositorio es para realizar las actividades de programación para la materia de Programación en Microcontroladores en lenguaje ensamblador MPASM para el PIC16F877A.

# Convenciones
## Configuración del editor
### Tabulaciones a espacios
Activen la opcion de convertir tabulaciones a espacios en ```Tools -> Options -> Editor```. Aseguren también que el número de espacios por identación sea igual a 4 y el tamaño de tabulación igual a 8.

![image](https://github.com/AlanElMago/programacion-microcontroladores/assets/53925066/3ee095cb-4f35-48e4-ac02-7abbe7a19ca0)

## Código Fuente
### Encabezado
Para empezara desarrollar un projecto en ensamblador, se necesita poner el siguiente codigo al principio a cada archivo fuente .asm:
```
LIST P=16F877A
#include "p16f877a.inc"

; Configuracion para PicSimLab
; __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF

; Configuracion para el entrenador en fisico
; __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _BOREN_ON & _LVP_OFF & _CPD_OFF & _WRT_OFF & _CP_OFF
```
Es importante dejar comentado la configuración para el entrandor en físico y descomentar la configuración para el PicSimLab al momento de subir cambios de código ensamblador. Esto es para que se pueda verificar rápidamente el funcionamiento de los programas utilizando el PicSimLab.

Después se necesita declarar las constantes (si es que se necesita,) por ejemplo:
```
CONST EQU b'00001101'       ; Constante CONST es igual a 13
```

Y al final el contador de localización:
```
ORG 0                       ; Indica el inicio del programa
```
### Inicialización
Es importante limpiar los puertos de entrada y salida al final de la fase de inicialización porque es posible que los puertos del PIC16F877A tengan grabado los bits de un programa que haya corrido anteriormente.
```
SETUP
    ; -- Codigo de configuracion ---
    CLRF      PORTB
    CLRF      PORTD
```
