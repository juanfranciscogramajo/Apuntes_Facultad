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
- c) el kernel lo detecta por el bit de modificacion. El kernel si el bit m=0 pisa directamente, si es 1 realiza una op extra de E/S, carga la pag en marco reservado.
1. 1, 2, 15, 4, 6, 2, 1, 5, 6, 10, 4, 6, 7, 9, 1, 6, 12, 11, 12, 2, 3, 1, 8, 1, 13, 14, 15, 3, 8
   
segunda chance

|     | 1   | 2   | 15  | 4   | 6   | 2   | 1   | 5   | 6   | 10  | 4   | 6   | 7   | 9   | 1   | 6   | 12  | 11  | 12  | 2   | 3   | 1   | 8   | 1   | 13  | 14  | 15  | 3   | 8   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| f1  | 1   | 1   | 1   | 1   | 1   | 1   | 1*  | 1   | 1   | 1   | 4   | 4   | 4   | 4   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| f2  |     | 2   | 2   | 2   | 2   | 2*  | 2*  | 2   | 2   | 2   | 2   | 2   | 7   | 7   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| f3  |     |     | 15  | 15  | 15  | 15  | 15  | 5   | 5   | 5   | 5   | 5   | 5   | 9   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| f4  |     |     |     | 4   | 4   | 4   | 4   | 4   | 4   | 10  | 10  | 10  | 10  | 10  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| f5  |     |     |     |     | 6   | 6   | 6   | 6   | 6*  | 6*  | 6   | 6*  | 6*  | 6*  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
|     | X   | X   | X   | X   | X   |     |     | X   |     | X   | X   |     | X   | X   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
