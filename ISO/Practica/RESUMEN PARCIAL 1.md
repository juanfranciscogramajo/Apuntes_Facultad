# Clase 1
- **SO:** Gestiona HW, controla procesos etc, intermediario usuario y HW, comodiada eficiencia evolucion 
- **Desde la perspectiva del usuario:** El SO funciona como una capa de abstracción sobre la arquitectura, presentando un entorno más simple de manejar. Desde este enfoque, las aplicaciones son los "clientes" 
    
- **Desde la perspectiva del sistema (Administración de recursos):** El SO es un administrador implacable que maneja los recursos de hardware para uno o más procesos. Maneja dispositivos de entrada/salida y memoria secundaria, y permite la ejecución simultánea de procesos mediante la **multiplexación**, tanto en tiempo (turnando el uso de la CPU) como en espacio (dividiendo la memoria).
## Componentes
- **El Kernel (Núcleo):** Se encuentra permanentemente cargado en la memoria principal y es el encargado absoluto de administrar los recursos del hardware. Implementa servicios críticos como la gestión de memoria, de CPU, de procesos, de la concurrencia y de la entrada/salida.
- Shell: GUI (Graphical User Interface) – CUI (Command User Interface) – CLI (Command Line Interface)
- Herramientas: editores, compi, libr.
## Servicios Provistos por el SO

El documento detalla que el Sistema Operativo se encarga de ofrecer una amplia gama de servicios esenciales:

- **Procesador:** Se encarga de la planificación, de manejar prioridades, de multiplexar la carga de trabajo y de asegurar la "justicia" (fairness) entre procesos para que no ocurran bloqueos totales.
    
- **Memoria:** Administra las jerarquías de memoria, maneja la relación entre memoria física y virtual, y asegura la protección para que los programas que se ejecutan concurrentemente no interfieran entre sí.
    
- **Almacenamiento y Dispositivos:** Oculta las dependencias del hardware subyacente, administra accesos simultáneos y gestiona el sistema de archivos (directorios, accesos a medios externos).
    
- **Control de Errores y Seguridad:** Detecta y responde a anomalías tanto internas como externas (errores de hardware, fallos de memoria, cálculos aritméticos erróneos, accesos no permitidos, e incapacidad para cumplir peticiones de las aplicaciones).
    
- **Contabilidad:** Recoge estadísticas de uso, monitorea el rendimiento, anticipa futuras necesidades de actualización del equipo e interactúa con el usuario mediante el Shell.
# Clase 2
### Modos de ejecucion
- bit de cpu indica modo actual
- Instrucciones privilegiadas se hacen modo supervisor o kernel
- Modo usuario solo su espacio de direcciones propias
- El sist arranca en modo supervisor, cuando ejecuta un proceso modo usuario. Si int vuelve.
### Protección de la CPU (Interrupción de Clock): 
Para evitar que un proceso acapare la CPU, se implementa un reloj de hardware con un contador. El kernel le asigna un valor que se decrementa con cada "tick". Al llegar a cero, el hardware interrumpe al proceso y le devuelve el control al SO para que pueda ejecutar otro programa.
    
### Protección de la Memoria: 
El hardware permite definir los límites del espacio de direcciones de un proceso (usualmente mediante un registro base y un registro límite). El kernel carga estos registros mediante instrucciones privilegiadas y el hardware verifica (en cada acceso) que las direcciones lógicas se encuentren dentro de los límites permitidos, generando un error si el programa intenta excederlos.
    
### Protección de E/S: 
Las instrucciones de E/S están catalogadas como privilegiadas y solo pueden ejecutarse en Modo Kernel.

### System Calls : 
**Definición:** Son la interfaz y el mecanismo por el cual los programas en Modo Usuario acceden a los servicios del SO.
**Ejecución:** Los parámetros de la llamada se pasan mediante registros, bloques de memoria o la pila (stack). Al invocar la llamada (ej. `read()`), se genera un _trap_ hacia el kernel. El sistema pasa a Modo Supervisor, invoca al manejador de la System Call (_Sys call handler_), ejecuta la función privilegiada y luego retorna el control al programa de usuario.
**Categorías:** Se dividen en llamadas de control de procesos, manejo de archivos, manejo de dispositivos, mantenimiento de información y comunicaciones.
	**Control de Procesos**
	Se encargan de administrar el ciclo de vida, la ejecución y las prioridades de los procesos y sus hilos.
    
    - fork(): Crea un nuevo proceso hijo que es una copia idéntica del proceso padre.
        
    - execve(): Reemplaza la imagen central del proceso por un nuevo programa ejecutable.
        
    - waitpid(): Pausa la ejecución del programa a la espera de que un proceso hijo termine.
        
    - exit(): Termina la ejecución del proceso y devuelve un código de estado.

**Manejo de Archivos**
	Permiten leer, escribir, crear y modificar los atributos de los archivos en el almacenamiento.

-  `read(file, buffer, nbytes)` lee una cantidad definida de bytes de un archivo y los deposita en un buffer de memoria temporal.
- `open()` (abrir un archivo), 
- `write()` (escribir datos) y 
- `close()` (cerrar el archivo).
- `touch` (cambia fechas de acceso y modificación) 
- `chmod` (modifica los permisos de lectura, escritura o ejecución) 
- `chown` o `chgrp` (cambian el propietario o el grupo del archivo).

**Mantenimiento de Información del Sistema**
Permiten consultar y alterar parámetros de la configuración operativa, gestionar tiempos o manipular señales de interrupción del sistema.
    
- `alarm()`: Configura el reloj de alarma del sistema para que envíe una notificación en una cantidad de segundos.
- `pause()`: Suspende al proceso llamador hasta que el sistema intercepte la próxima señal.
- `sigaction()`: Define la acción específica que debe ejecutar el sistema al recibir una señal determinada.
- `kill()`: Envía una señal a un proceso objetivo, usualmente para forzar su terminación.
 
**Comunicaciones (y Sincronización)**
Coordinan el intercambio de información, los mensajes y el orden de ejecución entre múltiples procesos que funcionan al mismo tiempo (concurrencia).
Comunicaciones puras: Llamadas como `pipe()` (crea una tubería de comunicación en memoria) o `socket()` (abre una conexión de red).

**Manejo de Dispositivos**
Gestionan el hardware periférico y solicitan acceso exclusivo o de lectura/escritura a recursos físicos como impresoras, discos extraíbles o pantallas.

- `ioctl()` (input/output control en UNIX), que permite manipular parámetros muy específicos del hardware que no se ajustan a una simple lectura o escritura, como expulsar una bandeja de CD o configurar la velocidad de un puerto serie.