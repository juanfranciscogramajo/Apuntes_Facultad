## Parte 1
### a) Describa qué tipos de problemas se pueden modelar utilizando Redes de Petri. 
Se pueden modelar sistemas dinamicos y concurrentes.
### b) Enumere y explique elementos, vistos en teoría, que se utilizan para modelar las Redes de Petri. 
| Componente        | Representación Gráfica  | Función y Significado                                                                                                                                                                                              |
| :---------------- | :---------------------: | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Sitio (Place)** |  Círculo ($\bigcirc$)   | Modela un **estado** o una **condición** del sistema (según el punto de vista de interpretación adoptado)[cite: 1].                                                                                                |
| **Transición**    | Barra o línea ($\vert$) | Modela un **evento** o una **acción**[cite: 1].                                                                                                                                                                    |
| **Arco**          |     Flecha ($\to$)      | Conecta de manera unidireccional un sitio con una transición o una transición con un sitio[cite: 1]. **Regla estricta:** Nunca conecta sitio con sitio ni transición con transición[cite: 1].                      |
| **Marca (Token)** |    Punto ($\bullet$)    | Elemento dinámico que se aloja dentro de los sitios[cite: 1]. Su función es habilitar o deshabilitar transiciones para gobernar la ejecución de la red[cite: 1]. Un sitio puede contener más de un token[cite: 1]. |
### c) Explique que son las marcas o tokens. 
Elemento dinámico que se aloja dentro de los sitios. Su función es habilitar o deshabilitar transiciones para gobernar la ejecución de la red. Un sitio puede contener más de un token.
### d) Explique qué significa una transición que tiene salidas pero no entradas.
**Significado:** Al no tener sitios ni arcos de entrada que condicionen su activación, **está siempre habilitada** y espera ilimitados tokens.
### e) Explique qué significa una transición que tiene entradas pero no salidas.
Se habilita cuando sus sitios de entrada cuentan con los tokens requeridos, pero al dispararse no produce ni deposita tokens en ningún nuevo lugar.