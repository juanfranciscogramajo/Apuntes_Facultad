
## 7. Vigilancia nocturna / Seguridad industrial | Dron de vigilancia autónomo
Modele el comportamiento de un dron de vigilancia que patrulla una zona industrial durante la noche.
El proceso comienza cuando el dron es activado por el sistema central y entra en modo espera, posado en su base de carga con la batería al 100%. En este estado, el dron permanece inactivo, pero con los sensores activos y atento a posibles movimientos o ruidos inusuales. Se asume que mientras el dron se encuentra en modo espera, la batería se carga automáticamente, sin requerir que dicha operación sea representada en el modelo.

  

Cuando el dron detecta un movimiento, su comportamiento varía según el origen:

- Si el movimiento se detecta en el perímetro externo, el dron pone en marcha sus hélices, ilumina la zona con sus luces y comienza a inspeccionar desde la altura. La inspección en altura dura 10 segundos, luego si no se confirma la presencia de un intruso, el dron vuelve a la base.

- Si el movimiento se detecta dentro del predio, el dron pone en marcha sus hélices, ilumina la zona con sus luces y comienza a patrullar. Cada 10 segundos el dron verifica la presencia de un intruso, emitiendo un pitido en caso de no detectarlo. Si transcurre un minuto y no se confirma la presencia de un intruso el dron vuelve a la base.

  

Durante la patrulla o inspección, si el dron confirma la presencia de un intruso, pasa al modo seguimiento, en el que enfoca su cámara en el objetivo y activa una sirena disuasoria. En este modo, el dron consume un 15% de batería cada 10 segundos debido al uso intensivo de sensores y motores.

  

El dron permanece en modo seguimiento hasta que ocurre alguno de los siguientes eventos:

- El intruso abandona la zona.

- La batería desciende por debajo del 20%.

  

Si la batería desciende por debajo del 20% o el intruso abandona la zona en el seguimiento, el dron vuelve a la base, enviando un mensaje a la central informando del acontecimiento.

  

En cualquier momento, si el operador emite una orden de cierre de jornada, el dron finaliza el proceso.

**