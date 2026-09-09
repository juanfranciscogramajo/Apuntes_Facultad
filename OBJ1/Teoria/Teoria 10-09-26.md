## 1. Conceptos Básicos
* **Herencia**: Mecanismo que permite a una clase heredar estructura (variables) y comportamiento (métodos) de otra clase. Es una estrategia de reúso de código y de conceptos[cite: 2].
* **Herencia simple en Java**: En Java solo tenemos herencia simple (una clase solo puede extender de una superclase).
* **Característica transitiva**: Si una clase `C` hereda de `B` y `B` hereda de `A`, entonces `C` también hereda de `A`.
* Ejemplo:
![[Pasted image 20260909150039.png|248]]
* **Vocabulario básico**:
  * La clase hija es la **subclase** (hereda o extiende a otra)[cite: 2].
  * La clase padre es la **superclase**[cite: 2].
* **La prueba del "Es-un"**: Regla clave para saber si la herencia está bien aplicada[cite: 2]. Si suena natural en el dominio, es probable que esté bien (ej: una `CuentaCorriente` es una `CuentaBancaria`)[cite: 2]. Un contraejemplo: un `Circulo` NO es un `Punto` (el círculo *tiene* un punto de centro, usa composición y no herencia)[cite: 2].
* **Principio de sustitución de Liskov (LSP)**: Si usamos una clase que es extendida, deberíamos poder usar cualquiera de sus subclases y que el programa siga siendo válido (que sigan pasando los tests).

---

## 2. Búsqueda de Métodos (Method Lookup) y Overriding
* **Method Lookup**: Cuando un objeto recibe un mensaje, busca en su clase un método que corresponda con ese mensaje.
  * **Con herencia**: Si no lo encuentra en su clase, busca en la superclase de su clase, y así sucesivamente hacia arriba hasta encontrarlo o lanzar error. La búsqueda termina apenas encuentra la primera coincidencia[cite: 2].
* **Overriding (sobrescribir métodos)**: 
  * Ocurre si una subclase tiene un método con el mismo nombre y parámetros que uno de la superclase.
  * El método de la superclase queda **oculto** y siempre que le manden el mensaje al objeto ejecuta el método de la subclase.
  * En ese método puedo hacer algo adicional además del comportamiento heredado.

---

## 3. `this` vs `super`
* **Similitud**: Tanto `super` como `this` funcionan como pseudo-variables y hacen referencia al **mismo objeto** que ejecuta el método (al receptor).
* **Diferencia**: Usar `super` cambia la forma en la que se hace el *method lookup*.
  * `this`: Inicia la búsqueda del método desde la clase real del objeto receptor.
  * `super`: Inicia la búsqueda a partir de la superclase directa. Se usa exclusivamente para **extender** comportamiento heredado.

---
## 4. `super` en Constructores
* Los constructores en Java **no se heredan**[cite: 2].
* Si quiero usar el comportamiento de inicialización del constructor padre, lo invoco usando `super(...)`.
* **Regla obligatoria**: La llamada a `super(...)` debe ser la **primera sentencia** en el constructor de la subclase[cite: 2].

```java
public CuentaBancaria(Persona titular) {
    this.titular = titular;
}

public CuentaCorriente(Persona titular, double saldoInicial, double limiteDescubierto) {
    super(titular); // Debe ser la primera línea
    this.saldo = saldoInicial;
    this.limiteDescubierto = limiteDescubierto;[cite: 1, 2]
}
```

---
## 5. Clases y Métodos Abstractos
* **Clase abstracta**: Clase que no tiene instancias (no se puede hacer `new` de ella)[cite: 1, 2]. Tiene variables y métodos[cite: 1]. Su función es encapsular y organizar la estructura y comportamiento común a sus subclases[cite: 1, 2].  
* **Método abstracto**: Es un método que solo declara su firma pero no está implementado (no tiene cuerpo ni llaves `{}`)[cite: 1, 2]. Actúa como un gancho que obliga a ser implementado en sus subclases concretas[cite: 1, 2].

---

## 6. Tipos y Tipado en OO
* **Tipo**: Conjunto de firmas de operaciones/métodos (nombre, tipo y orden de argumentos)[cite: 1, 2].
* Cada **clase** en Java define un tipo[cite: 1, 2].
* Cada **interfaz** en Java define un tipo[cite: 1, 2].
* Cuando una clase **implementa una interfaz**, es un sub-tipo de ella[cite: 1, 2].
* Cuando una clase **subclasifica (hereda de) a otra**, es un sub-tipo de ella[cite: 1, 2].
* **Tipo de una variable**: Es el que se indica estáticamente al declararla[cite: 1, 2].
* **Tipo de un método**: Es el tipo del valor que retorna[cite: 1, 2].
* **Tipo de un constructor**: Es la clase del objeto que construye[cite: 1, 2].

---

## 7. Visibilidad
* **Variable de instancia `private` en superclase A**:
  * Las instancias de las subclases tendrán esa variable de instancia en su memoria[cite: 1, 2].
  * En los métodos de las subclases no se puede hacer referencia directa a ella por su nombre[cite: 1, 2].
* **Método `m()` `private` en superclase A**:
  * Solo puede usarse internamente dentro de esa clase[cite: 1, 2].
  * En los métodos de las subclases no se puede invocar enviando el mensaje `m()` a `this`[cite: 1, 2].
* **Variables y métodos `protected`**:
  * Se pueden ver, acceder y utilizar directamente desde las subclases[cite: 1, 2].

---

## 8. Criterios en OBJ1
* El ocultamiento de información favorece el **bajo acoplamiento** (reduce dependencias entre clases)[cite: 1, 2].
* Las variables de instancia van **siempre privadas por defecto**[cite: 1, 2].
* Si en una subclase, para extender o especializar comportamiento, se depende de ese conocimiento interno, recién ahí se cambia la visibilidad de las variables a **`protected`** (`#` en los diagramas UML)[cite: 1, 2].
