Una de las funciones ppal del so admin y org de mem ppal.
SO debe: 
- llevar registro de partes de mem usadas y no.
- asignar espacio a procesos en mem ppal
- liberar espacio de mem a procesos q terminaron
- que el programador no se preocupe por admin la memoria.
- Los procesos no deben acceder ni referenciar a dir de mem de otros procesos.
- Procesos compartan y usen eficientemente la mem
- Rango de direcciones 2^n-1
## Segmentacion
- Tabla de segmentos:  permite mapear la dir logica en fisica, contiene:
  - base: dir fisica de comienzo del segmento
  - limit: longitud del segmento.
- Segment-table base register (STBR): apunta a la ubicación de la tabla de segmentos. 
- Segment-table length register (STLR) : cantidad de segmentos de un programa