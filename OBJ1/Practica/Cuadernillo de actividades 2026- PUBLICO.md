#  Programación Orientada a Objetos 1 \- Facultad de Informática, UNLP

# 

# Cuadernillo Semestral de Actividades

**Actualizado: 8 de septiembre de 2026**

El presente cuadernillo posee un compilado con todos los ejercicios que se usarán durante el semestre en la asignatura. Los ejercicios están organizados en forma secuencial, siguiendo los contenidos que se van viendo en la materia. 

**Recomendación importante:** 

* No imprimir el cuadernillo porque se va actualizando periódicamente, conforme avancemos con los contenidos de la materia  
* Los contenidos de la materia se incorporan y fijan mejor cuando uno intenta aplicarlos \- no alcanza con ver un ejercicio resuelto por alguien más. Para sacar el máximo provecho de los ejercicios, es importante que asistan a las consultas de práctica habiendo intentado resolverlos (tanto como les sea posible). De esa manera podrán hacer consultas más enfocadas y el docente podrá darles mejor feedback. 

## **Ejercicio 1: WallPost**

### Primera parte

Se está construyendo una red social como Facebook o Twitter. Debemos definir una clase WallPost con los siguientes atributos: un texto que se desea publicar, cantidad de likes (“me gusta”) y una marca que indica si es destacado o no. La clase es subclase de Object.

Para realizar este ejercicio, utilice el recurso que se encuentra en el sitio de la cátedra (o que puede descargar desde [acá](https://drive.google.com/file/d/1Hhkc1OzKPpx3HZzFW0SgDmvpEHqHluN6/view?usp=sharing)). Para importar el proyecto, siga los pasos explicados en el documento “*Trabajando con proyectos Maven*, *importar un proyecto”*. 

Una vez importado, dentro del mismo, debe completar la clase WallPost de acuerdo a la siguiente especificación:

public class WallPost() {

/\*

\* Permite construir una instancia del WallPost.

\* Luego de la invocación de este constructor, el objeto creado debe tener los 

\* siguientes valores iniciales texto: “Undefined post”, no debe estar marcado 

\* como destacado y la cantidad de “Me gusta” debe ser 0\.

\*/

public WallPost()

/\*

\* Retorna el texto descriptivo de la publicación

\*/

public String getText() 

/\*

\* Asigna el texto descriptivo de la publicación

\*/

public void setText (String descriptionText)

/\*

\* Retorna la cantidad de “me gusta”

\*/

public int getLikes() 

/\*

 \* Incrementa la cantidad de likes en uno.

\*/

public void like() 

/\*

 \* Decrementa la cantidad de likes en uno. Si ya es 0, no hace nada.

\*/

public void dislike()

/\*

 \* Retorna true si el post está marcado como destacado, false en caso contrario

\*/

public boolean isFeatured() 

/\*

 \* Cambia el post del estado destacado a no destacado y viceversa.

\*/

public void toggleFeatured()

}

 

### Segunda parte

Utilice los tests provistos por la cátedra para comprobar que su implementación de Wallpost es correcta. Estos se encuentran en el mismo proyecto, en la carpeta test, clase WallPostTest.

Para ejecutar los tests simplemente haga click derecho sobre el proyecto y utilice la opción Run As \>\> JUnit Test. Al ejecutarlo, se abrirá una ventana con el resultado de la evaluación de los tests. Siéntase libre de investigar la implementación de la clase de test. Ya veremos en detalle cómo implementarlas. 

![][image1]

En el informe, Runs indica la cantidad de test que se ejecutaron. En Errors se indica la cantidad que dieron error y en Failures se indica la cantidad que tuvieron alguna falla, es decir,  los resultados no son los esperados. Abajo, se muestra el Failure Trace del test que falló. Si lo selecciona, mostrará el mensaje de error correspondiente a ese test, que le ayudará a encontrar la falla. Si hace click sobre alguno de los test, se abrirá su implementación en el editor. 

### Tercera parte

Una vez que su implementación pasa los tests de la primera parte puede utilizar la ventana que se muestra a continuación, la cual permite inspeccionar y manipular el post (definir su texto, hacer like / dislike y marcarlo como destacado).

![][image2]

Para visualizar la ventana, sobre el proyecto, usar la opción del menú contextual Run As \>\> Java Application. La ventana permite cambiar el texto del post, incrementar la cantidad de likes, etc. El botón Print to Console imprimirá los datos del post en la consola. 

## **Ejercicio 2: Balanza Electrónica**

En el taller de programación ud programó una balanza electrónica. Volveremos a programarla, con algún requerimiento adicional. 

En términos generales, la Balanza electrónica recibe productos (uno a uno), y calcula dos totales: peso total y precio total. Además, la balanza puede poner en cero todos sus valores. 

La balanza no guarda los productos. Luego emite un ticket que indica el número de productos considerados, peso total, precio total.

**Tareas**:

1) **Implemente:**

Cree un nuevo proyecto Maven llamado balanzaElectronica, siguiendo los pasos del documento “*Trabajando con proyectos Maven, crear un proyecto Maven nuevo*”. En el paquete correspondiente,  programe las clases que se muestran a continuación. 

![][image3]

![][image4]

Observe que no se documentan en el diagrama los mensajes que nos permiten obtener y establecer los atributos de los objetos (accessors). Aunque no los incluimos, verá que los tests fallan si no los implementa. Consulte con el ayudante para identificar, a partir de los tests que fallan, cuales son los accessors necesarios (pista: todos menos los setters de balanza). 

Todas las clases son subclases de Object.

Nota: Para las fechas, utilizaremos la clase java.time.LocalDate. Para crear la fecha actual, puede utilizar LocalDate.now(). También es posible crear fechas distintas a la actual. Puede investigar más sobre esta clase en [https://docs.oracle.com/en/java/javase/11/docs/api/index.html](https://docs.oracle.com/en/java/javase/11/docs/api/index.html)

2) **Probando su implementación:**

Para realizar este ejercicio, utilice el recurso que se encuentra en el sitio de la cátedra o que puede descargar desde este [link](https://drive.google.com/file/d/1fHnoPWbw1UtGYaVmcTa70B-lTUGQo4ED/view?usp=sharing). En este caso, se trata de dos clases, BalanzaTest y ProductoTest, las cuales debe agregar dentro del paquete tests. Haga las modificaciones necesarias para que el proyecto no tenga errores. 

Si todo salió bien, su implementación debería pasar las pruebas que definen las clases agregadas en el paso anterior. El propósito de estas clases es ejercitar una instancia de la clase Balanza y verificar que se comporta correctamente. 

## **Ejercicio 3: Inversores**

Estamos desarrollando una aplicación móvil para que un <font color="#ffff00">inversor</font> pueda conocer el estado de sus inversiones. El sistema permite manejar dos tipos de inversiones: <font color="#ffff00">Inversión en acciones</font> e <font color="#ffff00">inversión en plazo fijo</font>. En todo momento, se desea poder conocer el <font color="#8064a2">valor</font> actual de cada inversión y de las inversiones realizadas por el inversor.  
   
Para las<font color="#ffff00"> inversiones en acciones</font> el valor actual se calcula multiplicando el<font color="#4bacc6"> valor unitario</font> de una acción por la cantidad de acciones que se posee. De las <font color="#4bacc6">acciones</font> se conoce el <font color="#4bacc6">nombre</font> que las identifica en el mercado de valores, un inversor puede invertir en diferentes acciones con diferentes <font color="#4bacc6">valores unitarios.</font> Por su parte, para los <font color="#ffff00">plazo fijos</font>, el <font color="#00b0f0">valor actual </font>consiste en el cálculo del valor inicial de constitución del plazo fijos sumando los intereses diarios desde la <font color="#00b0f0">fecha</font> de constitución hasta hoy.   
   
De las <font color="#ffff00">inversiones en acciones</font> es importante poder conocer su <font color="#00b0f0">nombre</font>, la <font color="#00b0f0">cantidad de acciones</font> en las que se invertirá y el <font color="#00b0f0">valor unitario </font>de cada acción. Por su parte, los <font color="#ffff00">plazos fijos</font> se constituyen en una <font color="#00b0f0">fecha</font>, es importante conocer el <font color="#00b0f0">monto depositado</font> y cuál es el <font color="#00b0f0">porcentaje de interés</font> que genera.   
   
Por último, el valor de <font color="#00b0f0">inversión actual</font> de un <font color="#ffff00">inversor</font> es la suma de los valores actuales de todas las inversiones que posee. Un inversor puede <font color="#00b050">agregar</font> y <font color="#00b050">sacar</font> inversiones de su cartera de inversiones cuando lo desee. Las inversiones pueden ser tanto en acciones como en plazo fijos y pueden estar mezcladas.   
   
**Tareas:**  
Utilizando el siguiente template visto en teoría  
![][image5]

1. Realice la lista de conceptos candidatos utilizando las estrategias vistas en teoría (categorías de clases conceptuales e identificación de frases nominales)  
2. Grafique el modelo de dominio usando UML.  
3. Actualice el modelo de dominio incorporando los atributos a los conceptos  
4. Agregue asociaciones entre conceptos, indicando para cada una de ellas la categoría a la que pertenece, de acuerdo a lo explicado en la teoría, y demás atributos, según sea necesario.

## **Ejercicio 4: Videos musicales**

Se desea desarrollar una plataforma dedicada a la compra y venta de videos musicales. Las personas podrán publicar sus propios videos y adquirir aquellos compartidos por otros miembros de la comunidad.

De cada persona se conoce su nombre, una dirección de correo electrónico que la identifica y un saldo de créditos. Además, puede tener videos musicales puestos a la venta. Cada vez que otra persona compra uno de sus videos, recibe un ingreso que se suma automáticamente a su saldo de créditos, el cual luego puede utilizar para realizar sus propias compras dentro de la plataforma.

Los videos disponibles en la plataforma se describen mediante un título, una breve descripción, comentarios y un precio expresado en créditos. Cada comentario incluye un texto, la persona que lo escribió y la fecha en que fue realizado. Cada vez que una persona compra un video, se descuentan créditos de su saldo, estos se transfieren al autor del contenido, y el video adquirido se registra en su historial junto con la fecha de compra.

Se debe permitir que una persona recargue créditos en su cuenta, actualizando así su saldo disponible. También debe permitir comprar un video, siempre que la persona cuente con créditos suficientes. Si la compra se concreta, se descuentan los créditos correspondientes de su saldo, se acreditan al autor del video y el video se incorpora a su historial, junto con la fecha de compra y el precio pagado en créditos. Si la persona no tiene créditos suficientes, la compra no se realiza.

Deberá permitir calcular cuántos créditos gastó una persona desde una fecha determinada. Para ello, se deberán considerar las compras realizadas a partir de esa fecha y sumar el precio pagado en cada una.

La persona que publicó un video podrá modificar su precio. Este cambio sólo afectará a las compras futuras y no deberá alterar el precio registrado en las compras realizadas con anterioridad.

Finalmente, cualquier persona podrá agregar un comentario a un video. De cada comentario se registrará el texto, la persona que lo escribió y la fecha en que fue realizado.

**Tareas:**  
Utilizando el template visto en teoría

1. Realice la lista de conceptos candidatos utilizando las estrategias vistas en teoría (categorías de clases conceptuales e identificación de frases nominales)  
2. Grafique el modelo de dominio usando UML.  
3. Actualice el modelo de dominio incorporando los atributos a los conceptos  
4. Agregue asociaciones entre conceptos, indicando para cada una de ellas la categoría a la que pertenece, de acuerdo a lo explicado en la teoría, y demás atributos, según sea necesario.

## **Ejercicio 5: Servicio de recolección de residuos (\*)**

(\*) Este ejercicio tiene ajustes menores en la redacción, respecto a su primera versión

Una empresa encargada de la recolección de residuos desea gestionar el servicio prestado a sus usuarios para emitir las facturas correspondientes.

De cada usuario se conoce su nombre y domicilio. Se considera que cada usuario recibe el servicio en un único domicilio, donde se registra periódicamente los residuos retirados. Por cada usuario se registra la cantidad de residuos comunes y la cantidad de residuos reciclables, ambas cantidades expresadas en kg. 

La empresa cuenta con un **cuadro tarifario** que establece el precio por kilogramo de residuos comunes recolectados: este precio puede ser actualizado periódicamente, por ejemplo, ante cambios en los costos del servicio. Los residuos reciclables no generan costo adicional, y su cantidad se utiliza para determinar si corresponde aplicar una bonificación.

Para emitir la factura de un usuario se tiene en cuenta todos los registros de recolección de un mes. La factura debe contener:

* El usuario a quien corresponde  
* La fecha de emisión  
* La bonificación aplicada, si corresponde  
* Los registros facturados  
* El monto final que debe pagar

El costo del servicio se calcula multiplicando la cantidad de residuos comunes por el precio por kilogramo establecido en el cuadro tarifario.

Para determinar si corresponde una bonificación, se calcula el **índice de separación de residuos**, dividiendo la cantidad de residuos reciclables por la cantidad total de residuos recolectados:

![][image6]

Si el índice de separación de los registros facturados es mayor que 0,30, el usuario recibe una bonificación del 10 % sobre el costo del servicio.

**Tareas**

1. Realice una lista de conceptos candidatos.  
2. Grafique el modelo de dominio utilizando UML.  
3. Actualice el modelo de dominio incorporando los atributos correspondientes a cada concepto.  
4. Agregue las asociaciones entre los conceptos. Para cada asociación, indique la categoría a la que pertenece de acuerdo con lo explicado en la teoría e incluya los demás atributos que considere necesarios.

## **Ejercicio 6: Presupuestos** 

Un presupuesto se utiliza para detallar los precios de un conjunto de productos que se desean adquirir. Se realiza para una fecha específica y es solicitado por un cliente, proporcionando una visión de los costos asociados.

El siguiente diagrama muestra un diseño para este dominio. 

 

**Tareas**:

1) **Implemente:**

Defina el proyecto “Presupuesto” y dentro de él implemente las clases que se observan en el diagrama. Ambas son subclases de Object. 

2) **Discuta y reflexione**

Preste atención a los siguientes aspectos:

* ¿Cuáles son las variables de instancia de cada clase?  
* ¿Qué variables inicializa? ¿De qué formas se puede realizar esta inicialización?   
* ¿Qué ventajas y desventajas encuentra en cada una de ellas?

3) **Probando su código:** 

Utilice los [tests provistos](https://drive.google.com/file/d/1MtUjbqj3gswY1wXxstg5JP1vsi_71W4n/view?usp=sharing)  para confirmar que su implementación ofrece la funcionalidad esperada. En este caso, se trata de dos clases: ItemTest y PresupuestoTest, que debe agregar dentro del paquete tests. Haga las modificaciones necesarias para que el proyecto no tenga errores. Siéntase libre de explorar las clases de test para intentar entender qué es lo que hacen.  

## **Ejercicio 7: Balanza mejorada**

Realizando el ejercicio de los presupuestos, aprendimos que un objeto puede tener una colección de otros objetos. Con esto en mente, ahora queremos mejorar la balanza implementada  en el ejercicio 2\.

**Tarea 1**  
Mejorar la balanza para que recuerde los productos ingresados (los mantenga en una colección). Analice de qué forma puede realizarse este nuevo requerimiento e implemente el mensaje   
*public List\<Producto\> getP*roductos()  
que retorna todos los productos ingresados a la balanza (en la compra actual, es decir, desde la última vez que se la puso a cero).

¿Qué cambio produce este nuevo requerimiento en la implementación del mensaje *ponerEnCero()* ?

¿Es necesario, ahora, almacenar los totales en la balanza? ¿Se pueden obtener estos valores de otra forma?

**Tarea 2**  
Con esta nueva funcionalidad, podemos enriquecer al Ticket, haciendo que él también conozca a los productos (a futuro podríamos imprimir el detalle). Ticket también debería entender el mensaje  *public List\<Producto\> getP*roductos().

* ¿Qué cambios cree necesarios en Ticket para que pueda conocer a los productos?   
* ¿Estos cambios modifican las responsabilidades ya asignadas de realizar cálculo del precio total?. ¿El ticket adquiere nuevas responsabilidades que antes no tenía?

**Tarea 3**  
Después de hacer estos cambios, ¿siguen pasando los tests? ¿Está bien que sea así?

## **Ejercicio 8: Figuras y cuerpos**

**Figuras en 2D**

En Taller de Programación definió clases para representar figuras geométricas. Retomaremos ese ejercicio para trabajar con Cuadrados y Círculos.

El siguiente diagrama de clases documenta los mensajes que estos objetos deben entender. 

## ![][image7]

Fórmulas y mensajes útiles:

* Diámetro del círculo: radio \* 2  
* Perímetro del círculo: π \* diámetro  
* Área del círculo: π \* radio 2  
* π se obtiene enviando el mensaje \#pi a la clase Float (Float pi) (ahora Math.PI) 

**Tareas**:

1) **Implementación:**  
   Defina un nuevo proyecto figurasYCuerpos. Implemente las clases Círculo y Cuadrado, siendo ambas subclases de Object. Decida usted qué variables de instancia son necesarias. Puede agregar mensajes adicionales si lo cree necesario.  
2) **Discuta y reflexione**  
   ¿Qué variables de instancia definió? ¿Pudo hacerlo de otra manera? ¿Qué ventajas encuentra en la forma en que lo realizó? 

**Cuerpos en 3D**

Ahora que tenemos Círculos y Cuadrados, podemos usarlos para construir cuerpos (en 3D) y calcular su volumen y superficie o área exterior. 

- Vamos a pensar a un cilindro como "un cuerpo que tiene una figura 2D como cara basal y que tiene una altura (vea la siguiente imagen)". Es decir, si en el lugar de la figura2D tuviera un círculo, se formaría el siguiente cuerpo 3D.

![][image8]

- Si reemplazamos la cara basal por un rectángulo, tendremos un prisma (una caja de zapatos).

El siguiente diagrama de clases documenta los mensajes que entiende un cuerpo3D. 

![][image9]

Fórmulas útiles:

* El área o superficie exterior de un cuerpo es:   
  2\* área-cara-basal \+ perímetro-cara-basal \* altura-del-cuerpo  
* El volumen de un cuerpo es: área-cara-basal \* altura

Más info interesante: A la figura que da forma al cuerpo (el círculo o el cuadrado en nuestro caso) se le llama directriz. Y a la recta en la que se mueve se llama generatriz. En [wikipedia (Cilindro)](https://es.wikipedia.org/wiki/Cilindro)[^1] se puede aprender un poco más al respecto.

**Tareas**:

1) **Implementación**

	Implemente la clase Cuerpo 3D, la cuál es subclase de Object. Decida usted qué variables de instancia son necesarias. También decida si es necesario hacer cambios en las figuras 2D.

2) **Pruebas automatizadas**  
   Siguiendo los ejemplos de ejercicios anteriores, ejecute [las pruebas automatizadas provistas](https://drive.google.com/file/d/1T8GJDK5b_eIBtsvovJgnrY1ce6BRb5fH/view?usp=drive_link). En este caso, se trata de tres clases (CuerpoTest, TestCirculo y TestCuadrado) que debe agregar dentro del paquete tests. Haga las modificaciones necesarias para que el proyecto no tenga errores.  Si algún test no pasa, consulte al ayudante.   
3) **Discuta y reflexione**  
   Discuta con el ayudante sus elecciones de variables de instancia y métodos adicionales. ¿Es necesario todo lo que definió?