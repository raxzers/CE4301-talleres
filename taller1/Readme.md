# Taller #1 Métricas y Ensamblador
## Generador de numeros pseudo-aleatorios
_Por Gabriel Conejo Valerio 2014093542_

### Nociones basicas
Para este generador de numeros  se utiliizara el algoritmo LFSR _(linear-feedback shift register)_ usando el caso de fibonnaci. 

Donde de una entrada de 8 bits dada de un valor semillas se aplicara la siguiente formula: $\ x^{8}+x^{6}+x^{5}+x^{4}+1$ por medio de compuetas XOR, otras practicas como rotacion y creacion de mascaras se obtendrá el nuevo bit que se agrega en el MSB y se descarta el LSB. Luego los primeros 100 números se almacenarán en memoria tomoando en cuenta  que solo se guadaran el en byte 0. 



Este algoritmo se relaizará en el simulador de procesador RISC-V: Ripes con los valoeres por defecto.

### Código

 El código consta de 4 partes 
 
* start: en esta seccions se encuntran los valores iniciales 
* alfsr: el algoritmo LSFR
* ciclo: el ciclo para guardada los primeros 100 valores pseudo-aleatorios
* end: fin del programa.

### Partes del codigo 


En esta parte de start se guardan los valores iniciales en los registros: 
```
li a1,0x56  #semilla 0x56-> V
li a2,0x100  #posicion en memoria
li a4,0x64   #numero de iteraciones
``` 

En esta parte de alfsr podeo explicar los siguiente:
```
li a0,0x80          
and t1,a0,a1
```
el codigo anterior crea un mascara en el bit 8 y se le aplica una mascara para obtener solo el valor en el bit necesario mediante la intruccion and.