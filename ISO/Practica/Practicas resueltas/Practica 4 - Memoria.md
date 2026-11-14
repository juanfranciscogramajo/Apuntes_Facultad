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
| f1  | 1   | 1   | 1   | 1   | 1   | 1   | 1*  | 1   | 1   | 1   | 4   | 4   | 4   | 4   | 4   | 4   | 12  | 12  | 12* | 12* | 12* | 12* | 12  | 12  | 12  | 12  | 15  | 15  | 15  |
| f2  |     | 2   | 2   | 2   | 2   | 2*  | 2*  | 2   | 2   | 2   | 2   | 2   | 7   | 7   | 7   | 7   | 7   | 11  | 11  | 11  | 11  | 11  | 8   | 8   | 8   | 8   | 8   | 3   | 3   |
| f3  |     |     | 15  | 15  | 15  | 15  | 15  | 5   | 5   | 5   | 5   | 5   | 5   | 9   | 9   | 9   | 9   | 9   | 9   | 2   | 2   | 2   | 2   | 2   | 13  | 13  | 13  | 13  | 8   |
| f4  |     |     |     | 4   | 4   | 4   | 4   | 4   | 4   | 10  | 10  | 10  | 10  | 10  | 1   | 1   | 1   | 1   | 1   | 1   | 3   | 3   | 3   | 3   | 3   | 14  | 14  | 14  | 14  |
| f5  |     |     |     |     | 6   | 6   | 6   | 6   | 6*  | 6*  | 6   | 6*  | 6*  | 6*  | 6*  | 6*  | 6   | 6   | 6   | 6   | 6   | 1   | 1   | 1*  | 1*  | 1*  | 1   | 1   | 1   |
|     | X   | X   | X   | X   | X   |     |     | X   |     | X   | X   |     | X   | X   | X   |     | X   | X   |     | X   | X   | X   | X   |     | X   | X   | X   | X   | X   |
FIFO

|     | 1   | 2   | 15  | 4   | 6   | 2   | 1   | 5   | 6   | 10  | 4   | 6   | 7   | 9   | 1   | 6   | 12  | 11  | 12  | 2   | 3   | 1   | 8   | 1   | 13  | 14  | 15  | 3   | 8   |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| f1  | 1   | 1   | 1   | 1   | 1   | 1   | 1   | 5   | 5   | 5   | 5   | 5   | 5   | 5   | 5   | 6   | 6   | 6   | 6   | 6   | 6   | 1   | 1   | 1   | 1   | 1   | 1   | 3   | 3   |
| f2  |     | 2   | 2   | 2   | 2   | 2   | 2   | 2   | 2   | 10  | 10  | 10  | 10  | 10  | 10  | 10  | 12  | 12  | 12  | 12  | 12  | 12  | 8   | 8   | 8   | 8   | 8   | 8   | 8   |
| f3  |     |     | 15  | 15  | 15  | 15  | 15  | 15  | 15  | 15  | 15  | 15  | 7   | 7   | 7   | 7   | 7   | 11  | 11  | 11  | 11  | 11  | 11  | 11  | 13  | 13  | 13  | 13  | 13  |
| f4  |     |     |     | 4   | 4   | 4   | 4   | 4   | 4   | 4   | 4   | 4   | 4   | 9   | 9   | 9   | 9   | 9   | 9   | 2   | 2   | 2   | 2   | 2   | 2   | 14  | 14  | 14  | 14  |
| f5  |     |     |     |     | 6   | 6   | 6   | 6   | 6   | 6   | 6   | 6   | 6   | 6   | 1   | 1   | 1   | 1   | 1   | 1   | 3   | 3   | 3   | 3   | 3   | 3   | 15  | 15  | 15  |
|     | X   | X   | X   | X   | X   |     |     | X   |     | X   | X   |     | X   | X   | X   | X   | X   | X   |     | X   | X   | X   | X   |     | X   | X   | X   | X   |     |

