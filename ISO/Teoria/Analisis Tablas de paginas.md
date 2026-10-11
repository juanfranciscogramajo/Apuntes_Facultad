**El problema de diseño de las Tablas de Páginas**

- La tabla de páginas tiene la función de asociar cada página virtual con un marco de memoria física.
    
- El gran desafío de diseño es un compromiso (trade-off): la traducción debe ser muy rápida (ocurre en cada instrucción), pero la tabla no debe ocupar demasiada memoria RAM, lo cual es un problema en espacios de direcciones grandes como los de 64 bits.
    
- **Entrada de la tabla (PTE):** Suele ocupar 4 u 8 bytes e incluye el número de marco físico y bits de estado: Presente/ausente (V), Protección, Modificada (M), Referenciada (R) y control de caché.
    

### Análisis Comparativo de las 3 Implementaciones

**1. Tabla de 1 Nivel (Tradicional)** Se utiliza un arreglo con una entrada por cada página del espacio virtual del proceso.

- **Ventajas:** Es la más simple. La traducción es directa y rápida, requiriendo solo 2 accesos a memoria (uno a la tabla y otro al dato). Compartir páginas entre procesos es trivial.
    
- **Desventajas:** El tamaño de la tabla es directamente proporcional a todo el espacio virtual, no a la memoria que el proceso realmente usa. Desperdicia muchísima memoria guardando entradas inválidas ("huecos") y debe ubicarse de manera contigua en la RAM. **Es un modelo inviable en sistemas de 64 bits** por el tamaño colosal que alcanzaría.
    

**2. Tabla Multinivel** Se pagina la propia tabla de páginas, organizándola en forma de árbol (niveles), de modo que solo se crean las subtablas que realmente se están utilizando.

- **Ventajas:** Ocupa memoria en función de las páginas en uso, permitiendo aprovechar los espacios dispersos sin consumir RAM en los "huecos". Además, cada subtabla cabe exactamente en un marco de memoria, por lo que no requiere buscar un bloque grande de memoria contigua. Es la opción dominante hoy en día (ej. x86-64).
    
- **Desventajas:** El recorrido es más complejo y **requiere un acceso extra a memoria por cada nivel**. (Ojo con este error frecuente: la tabla multinivel ahorra espacio, pero _no_ acelera la traducción).
    

**3. Tabla Invertida** Se utiliza una única tabla global para todo el sistema, con una entrada por cada marco físico de la memoria RAM.

- **Ventajas:** Su tamaño es fijo, chico y proporcional a la RAM instalada, siendo completamente independiente del inmenso espacio virtual. Esto la hace muy atractiva para 64 bits cuando el espacio virtual supera ampliamente la RAM física.
    
- **Desventajas:** No se puede indexar por número de página; se requiere calcular una función _Hash_ (PID + página virtual) y seguir una cadena en caso de colisiones. Esto hace que la búsqueda sea costosa y que compartir páginas entre procesos sea complejo.
    

**El rol fundamental de la TLB (Translation Lookaside Buffer)**

- Es una memoria caché asociativa ubicada en la MMU que guarda las traducciones de direcciones más recientes.
    
- **Importancia:** La TLB es lo que hace viable la paginación en la vida real. Al encontrar la dirección en la TLB (_hit_), se obtiene el marco sin acceder a la tabla en memoria RAM. Esto oculta el altísimo costo de recorrer los múltiples niveles o de calcular los hashes en la tabla invertida, logrando que el "Tiempo Efectivo de Acceso" sea casi igual de rápido en cualquiera de las implementaciones.
    
- **Error común:** Creer que la TLB reemplaza a la tabla de páginas. Es falso: sigue siendo una caché y, ante un fallo (_miss_), el hardware o el SO siempre deben consultar la tabla original.