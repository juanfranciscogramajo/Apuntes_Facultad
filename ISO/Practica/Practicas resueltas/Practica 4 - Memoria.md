1. A y B provocan fallos y el c y d fallan por direcciones invalidas.
2. Rep equit= -
   P1 = 10, P2 = 10, P3 = 10, P4 = 10
   Rep prop =
   P1 = 15x40/ 63 = 10
   P2 y P3 = 20x40 / 63 = 13
   P4 = 8x40 / 63 = 5
3. **FIFO (_First In, First Out_):** El peor en rendimiento; al sacar simplemente la página más antigua, puede desalojar una página que se usa constantemente y provocar fallos inmediatos.
    
- **Segunda Chance:** Mejora a FIFO al evitar sacar páginas que fueron referenciadas hace poco.
    
- **LRU (_Least Recently Used_):** Es la mejor aproximación práctica porque saca la página que lleva más tiempo sin usarse, aprovechando la localidad temporal.
    
- **OPT (Óptimo):** Garantiza la menor tasa posible de fallos de página (es el límite teórico ideal), aunque es imposible de implementar en la práctica.