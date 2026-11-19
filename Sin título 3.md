## 6. Logística de depósito | Robots autónomos de transporte de carga

Ingeniería de software I 2023 — Parcial Primera Fecha 25/10/23
Una empresa quiere usar robots autónomos para transportar productos dentro de su depósito. Los caminos que deben seguir los robots están compuestos por tramos e intersecciones, formando una red similar a un grafo.
Cuando un <font color="#7030a0">robot recibe la orden de realizar una ruta</font>, queda<font color="#ff0000"> esperando</font> a que un empleado coloque la carga a transportar. Una vez que el <font color="#7030a0">empleado confirma que la carga está lista</font>, el robot <font color="#00b0f0">comienza el recorrido.</font>
Para evitar las colisiones en las intersecciones, los robots cruzan según su prioridad. Cuando un robot <font color="#7030a0">llega a una intersección</font>, si<font color="#6425d0"> hay otro robot y éste tiene prioridad</font>, debe <font color="#00b0f0">detenerse</font> hasta que <font color="#6425d0">reciba una orden de continuar</font>. Cuando recibe dicha orden, el <font color="#00b0f0">robot selecciona un nuevo tramo y continúa su recorrido.</font>
Si al <font color="#7030a0">llegar a la intersección no hay otro robot o bien hay otro robot pero de menor prioridad, </font>simplemente <font color="#00b0f0">selecciona el siguiente tramo y confirma el cruce por la intersección</font>.
Mientras el robot está en movimiento <font color="#7030a0">si detecta algún objeto no identificado </font>en su cercanía debe <font color="#00b0f0">detenerse y esperar hasta que no detecte el objeto.</font>
Finalmente, cuando el<font color="#6425d0"> robot llega a destino,</font> se <font color="#00b0f0">detiene y envía un mensaje para que un empleado retire la carga transportada.</font>
IMPORTANTE: Modele la activación de los motores cuando el robot inicia un movimiento y la desactivación cuando se detiene.
