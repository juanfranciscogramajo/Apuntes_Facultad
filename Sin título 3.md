## 6. Logística de depósito | Robots autónomos de transporte de carga

Ingeniería de software I 2023 — Parcial Primera Fecha 25/10/23
Una empresa quiere usar robots autónomos para transportar productos dentro de su depósito. Los caminos que deben seguir los robots están compuestos por tramos e intersecciones, formando una red similar a un grafo.
Cuando un robot recibe la orden de realizar una ruta, queda esperando a que un empleado coloque la carga a transportar. Una vez que el empleado confirma que la carga está lista, el robot comienza el recorrido.
Para evitar las colisiones en las intersecciones, los robots cruzan según su prioridad. Cuando un robot llega a una intersección, si hay otro robot y éste tiene prioridad, debe detenerse hasta que reciba una orden de continuar. Cuando recibe dicha orden, el robot selecciona un nuevo tramo y continúa su recorrido.
Si al llegar a la intersección no hay otro robot o bien hay otro robot pero de menor prioridad, simplemente selecciona el siguiente tramo y confirma el cruce por la intersección.
Mientras el robot está en movimiento si detecta algún objeto no identificado en su cercanía debe detenerse y esperar hasta que no detecte el objeto.
Finalmente, cuando el robot llega a destino, se detiene y envía un mensaje para que un empleado retire la carga transportada.
IMPORTANTE: Modele la activación de los motores cuando el robot inicia un movimiento y la desactivación cuando se detiene.
