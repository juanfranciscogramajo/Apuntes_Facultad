![[WhatsApp Image 2026-10-01 at 23.43.41.jpeg]]

## Punto 2?

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
0: 0 / 4096 