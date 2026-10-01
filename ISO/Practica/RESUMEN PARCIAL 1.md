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
## Modos de 