# Taller #1 Métricas y Ensamblador
## Generador de números pseudo-aleatorios
_Por Gabriel Conejo Valerio 2014093542_

### Nociones básicas
Para este generador de números  se utilizará el algoritmo LFSR _(linear-feedback shift register)_ usando el caso de Fibonacci. 

Donde de una entrada de 8 bits dada de un valor semillas se aplicara la siguiente formula: $\ x^{8}+x^{6}+x^{5}+x^{4}+1$ por medio de compuertas XOR, otras practicas como rotación y creación de mascaras se obtendrá el nuevo bit que se agrega en el MSB y se descarta el LSB. Luego los primeros 100 números se almacenarán en memoria tomando en cuenta  que solo se gradaran el en byte 0. 



Este algoritmo se realizará en el simulador de procesador RISC-V: Ripes con los valores por defecto.

### Código

 El código consta de 4 partes 
 
* start: en esta sección se encentran los valores iniciales 
* alfsr: el algoritmo LSFR
* ciclo: el ciclo para guardada los primeros 100 valores pseudo-aleatorios
* end: fin del programa.

### Partes del código  

#### Almacenamiento

En esta parte de **start** se guardan los valores iniciales en los registros: 
```
li a1,0x56  #semilla 0x56-> V
li a2,0x100  #posicion en memoria
li a4,0x64   #numero de iteraciones
``` 
#### Máscaras

En esta parte de **alfsr** se puede explicar los siguiente:
```
li a0,0x80          
and t1,a0,a1
```
El código anterior crea un mascara en el bit 8 y se le aplica una mascara para obtener solo el valor en el bit necesario mediante la instrucción and.

#### Rotación
En esta parte de **alfsr** puede explicar los siguiente:

```
slli a1,a1,0x19 
```
El código anterior realiza una rotación la cual se explica como el relleno de 0 en el LSB en el registro a1 un total 0x19 en hexadecimal  que corresponde a 25  ceros su utilidad en este programa es desechar el MSB manteniendo los bytes 1,2 y 3 en cero con  el uso de la instrucción srli que es el análogo del código anterior. 

#### Ciclo

En esta parte de **ciclo** puede explicar los siguiente:

```
addi a3,a3,0x1  
addi a2,a2,0x4     
sw a1,0(a2)
blt a3,a4,alfsr
j end 
```

Se realizan la suma del contador, mem_pos; se guarda el nuevo valor generado por LFSR, se pregunta si a3 es menor que a4 si lo es  salta al la sección de alfsr y sino sigue la siguiente linea y esta salta la fin.


### Ejecución del código  

