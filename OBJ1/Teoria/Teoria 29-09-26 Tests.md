# Resumen de Testing (Objetos 1 - UNLP)[cite: 2]

## 1. Conceptos Fundamentales
* **Bug / Error:** Ocurre cuando el programa no hace algo que debería hacer, hace algo mal o directamente falla/revienta[cite: 3].
* **Qué es testear:** Asegurarse de que el programa hace lo que se espera, lo hace como se espera y no falla[cite: 4].
* **Obstáculos y mitos del testing:**
  * Dejar el testing para el final o asumir que exige demasiadas combinaciones, planificación y recursos[cite: 7].
  * Considerarlo una tarea repetitiva o creer falsamente que "alcanza con programar bien" o que "testear es tarea de otro"[cite: 7].
  * La incomodidad de que el objetivo explícito del testing sea encontrar bugs[cite: 7].

---

## 2. Tipos de Tests
* **Clasificación general:** Tests funcionales, no funcionales, de unidad, de integración, de regresión, punta a punta (E2E), automatizados, de carga, de performance, de aceptación, de UI, de accesibilidad, Alpha/Beta y tests A/B[cite: 6].
* **Test de Unidad:** 
  * Evalúa la unidad mínima del programa en aislamiento (en POO es el método)[cite: 8].
  * Confirma que acepta el rango esperado de entradas y retorna el valor esperado[cite: 8].
  * Analiza parámetros, precondiciones (estado previo del objeto) y postcondiciones (objeto retornado y estado final del objeto)[cite: 8].
* **Tests Automatizados:**
  * Utilizan software para guiar la ejecución y controlar los resultados[cite: 9].
  * Requieren diseñar y mantener código de prueba, el cual pasa a formar parte del software como indicador de calidad[cite: 9].
  * Tienen un costo de reejecución mínimo una vez programados[cite: 9].

---

## 3. Automatización con JUnit 5
* **JUnit (familia xUnit):** Herramienta para simplificar la creación, ejecución aislada y reporte de tests de unidad en Java[cite: 10, 11].
* **Estructura y Anatomía de una suite:**
  * **Una clase de test por cada clase a testear**[cite: 12].
  * **Fixture (`@BeforeEach`):** Método que inicializa los objetos y estado necesarios antes de cada test[cite: 12, 14].
  * **Métodos de test (`@Test`):** Verifican comportamientos específicos[cite: 12].
  * **Teardown (`@AfterEach`):** Limpia recursos si es necesario[cite: 12].
* **Independencia entre tests:** Cada método de test es independiente; JUnit crea una nueva instancia de la clase de test y ejecuta el `@BeforeEach` antes de cada `@Test`[cite: 14].
* **Aserciones frecuentes:** `assertEquals`, `assertNotEquals`, `assertNotNull`, `assertSame`, `assertTrue`, `assertFalse`, `assertThrows`[cite: 17].

---

## 4. Cobertura (Coverage)
* **Definición:** Medida para evaluar qué tan completos son los tests automatizados[cite: 19].
* **Métricas principales:** Clases cubiertas, métodos cubiertos, líneas cubiertas, condicionales (`true`/`false`) y caminos o ramas (*branches*) recorridos[cite: 19].
* **Criterio de aplicación:** No siempre se busca el 100% de cobertura; se debe equilibrar el esfuerzo con el nivel de riesgo del artefacto[cite: 19, 21].

---

## 5. Estrategias para Diseño de Casos de Prueba
* **Criterio general:** Se diseña buscando combinaciones de valores (de estado y parámetros) que maximicen la probabilidad de encontrar errores con la menor cantidad de pruebas posibles[cite: 22].
* **Valores válidos:** En la materia se testean únicamente las entradas/estados claramente especificados dentro del comportamiento esperado[cite: 23].

### Estrategia 1: Particiones de Equivalencia
* **Concepto:** Divide las entradas en conjuntos de casos que prueban lo mismo o revelan el mismo bug[cite: 24].
* **Selección:** Se toma un representante dentro del conjunto válido y representantes fuera del mismo[cite: 24].

### Estrategia 2: Valores de Borde (Boundary Values)
* **Concepto:** Dado que los errores suelen acumularse en los límites entre particiones, se evalúan las fronteras de parámetros y estados (máximos/mínimos, vacío/lleno, 0, etc.)[cite: 29].
* **Análisis con 3 valores:** Para cada frontera ordenada, se prueba el valor del límite y sus dos vecinos inmediatos[cite: 38].

---

## 6. Testing en Orientación a Objetos (OO1)
* **Aislamiento y colaboraciones:** Cada clase se testea por separado. Si una clase depende de otra interfaz o componente, se testea su comportamiento evitando duplicar las pruebas de la dependencia[cite: 42].
* **Clases Abstractas:** Para testear métodos concretos definidos en clases abstractas, basta con instanciar cualquiera de sus subclases concretas[cite: 45, 47].
* **Alcance en OO1:**
  * Se testea a través de la interfaz pública del objeto[cite: 46].
  * No es necesario testear `getters`, `setters` ni constructores triviales que no contengan lógica de riesgo[cite: 46].

---

## 7. Tests Automatizados y Agentes de IA
* **Especificación y guía:** Los tests sirven para comunicar explícitamente al agente de IA qué resultado se espera[cite: 48].
* **Retroalimentación:** Ejecutar tests tras cambios generados por la IA permite detectar y corregir errores rápidamente[cite: 48].
* **Supervisión humana:** Los tests generados automáticamente por IA deben revisarse, ya que el agente puede replicar interpretaciones erróneas del problema[cite: 48].