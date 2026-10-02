![[WhatsApp Image 2026-10-01 at 23.43.41.jpeg]]

## Punto 1 
![[Pasted image 20261002164703.png]]
## Punto 2

Tenés que imaginarte a los dos competidores entrando al sistema:

1. **El proceso CPU-Bound (Carga de CPU):** Es un proceso "pesado" (como renderizar un video). Quiere usar el procesador sin parar.
    
    - **Resultado:** Termina hundido en la peor cola, atrapado detrás de otros procesos pesados. El algoritmo lo perjudicó.
        
2. **El proceso I/O-Bound (Carga de E/S):** Es un proceso interactivo o que lee mucho disco. Su comportamiento típico es: usa la CPU un ratito muy corto (ejemplo, 1 unidad de tiempo) y enseguida pide leer un archivo, por lo que se bloquea voluntariamente.
    - Como no agotó su quantum de 2, la regla dice que al volver de la E/S **se queda en la Cola Alta**.
        
    - **Resultado:** Vive eternamente en la cola VIP (la de mayor prioridad). El algoritmo lo **beneficia**. 
    ### La regla general del tamaño del Quantum en Round Robin
    - **Quantum muy GRANDE (beneficia a CPU-Bound):** Si ponés un Q infinito o muy grande (ej. Q=100), Round Robin degenera y se convierte en un algoritmo FCFS (First Come First Served). Los procesos de CPU son felices porque agarran el procesador y no los interrumpe nadie hasta que terminan. Los procesos de E/S sufren porque, si quedan detrás de un proceso pesado, tienen que esperar una eternidad solo para usar la CPU un milisegundo y volver a bloquearse.
    - **Quantum muy CHICO (beneficia a I/O-Bound / Interactivos):** Si el Q es cortito (ej. Q=1 o 2), la CPU rota rapidísimo entre todos. El proceso de E/S consigue la CPU rápido, manda su instrucción al disco/teclado y libera el procesador. El proceso de CPU sufre porque lo interrumpen constantemente.
    - Ojo con la contra:_ Un quantum demasiado chico genera mucho **overhead** (sobrecarga), porque el sistema operativo gasta más tiempo haciendo el Cambio de Contexto (guardar y cargar registros) que ejecutando código útil.


## Punto 3 
0: 
pagina = 0 / 4096 = 0, 
Desplazamiento = 0 mod 4096 = 0, 
dir fisica = 5x4096 = 20480
5000:
pagina = 5000 / 4096 = 1
desplazamiento 5000 mod 4096 = 904
direccion fisica = (3x 4096) + 904= 13192
7500: 
Pagina = 7500 / 4096 = 1
Desplazamiento = 7500 mod 4096 = 3404
direccion fisica = (3x4096) + 3404 = 15692
9000:
pagina = 9000/ 4096 = 2
desplazamiento = 9000 mod 4096 = 808
Direccion fisica = (11x4096) + 808 = 45864
16383:
Pagina = 16383 / 4096 = 3
Desplaza =16383 mod 4096 = 4095
Direccion fisica = 4095
## Punto 4
 **Datos base:**

- Espacio de direcciones virtuales = **64 bits**.
    
- Direccionamiento al byte (1 dirección = 1 Byte).
    
- Tamaño de página = **4 KiB** = 4096 Bytes = $2^{12}$ Bytes.
 *a*) ¿Cuál sería el tamaño máximo de un proceso?**

El tamaño máximo está delimitado por el espacio de direcciones virtuales que soporte la arquitectura. Como es de 64 bits y cada dirección es 1 Byte, el tamaño máximo es de **$2^{64}$ Bytes** (lo que equivale a 16 Exbibytes o EiB).

**b) ¿Cuántas páginas puede tener un proceso?**

Se calcula dividiendo el tamaño máximo virtual por el tamaño de la página.

- Páginas = $2^{64} \text{ Bytes} / 2^{12} \text{ Bytes}$ = **$2^{52}$ páginas máximas**.
    

**c) Si cada entrada en la tabla de páginas es de 8 Bytes, ¿cuál sería el tamaño máximo que podría alcanzar la misma?**

Multiplicás la cantidad máxima de páginas posibles por lo que pesa cada entrada en la tabla.

- Tamaño tabla = $2^{52} \text{ páginas} \times 8 \text{ Bytes}$ ($2^3$ Bytes) = **$2^{55}$ Bytes** (lo que equivale a 32 PebiBytes o PiB).
    

**d) ¿Cuántos marcos tendrá la memoria física si disponemos de 8 GiB?**

Se calcula dividiendo el tamaño total de la memoria RAM (física) por el tamaño del marco (que siempre es igual al tamaño de la página, $2^{12}$ Bytes).

- Memoria RAM = 8 GiB = $8 \times 1024 \times 1024 \times 1024 \text{ Bytes}$ = $2^3 \times 2^{30}$ = $2^{33} \text{ Bytes}$.
    
- Cantidad de marcos = $2^{33} \text{ Bytes} / 2^{12} \text{ Bytes}$ = **$2^{21}$ marcos** (esto es exactamente $2.097.152$ marcos de memoria).
    

**e) Si el proceso necesita 10500 Bytes para sus datos, ¿cuántas páginas se necesitan para almacenarlos?**

Hay que dividir los bytes requeridos por el tamaño de la página (4096) y, como no se puede tener media página, redondear siempre hacia arriba.

- $10500 / 4096 \approx 2,56$.
    
- El proceso ocupará 2 páginas enteras ($8192$ Bytes) y requerirá una tercera página para alojar los $2308$ Bytes restantes.
    
- **Se necesitan 3 páginas** (tené en cuenta que la tercera página va a sufrir de _fragmentación interna_).