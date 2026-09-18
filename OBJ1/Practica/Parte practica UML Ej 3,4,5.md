# Ejercicio 3 
---

- Inversor
  - inversiones
- inversiones
  - valor actual
  - inversiones en acciones
  - inversiones en plazo fijo 
- Inversion acciones
  - cantidad
  - nombre 
  - valor unitario
- inversion en plazo fijo
  - monto depositado
  - fecha inicial
  - porcentaje de interes diario
  - porcentaje de interes 
```plantuml
@startuml
hide circle
skinparam classAttributeIconSize 0
class Inversor {
}

abstract class Inversion {
}

class InversionEnAcciones {
  nombre: String
  cantidad: Integer
  valorUnitario: Real
}

class InversionEnPlazoFijo {
  fechaDeConstitucion: LocalDate
  montoDepositado: Real
  porcentajeDeInteres: Real
}

Inversor -> "*" Inversion : cartera >
Inversion <|-- InversionEnAcciones
Inversion <|-- InversionEnPlazoFijo
@enduml
```



---

# Ejercicio 4 
---

- Persona:
	- Nombre
	- direccion de correo electronico
	- saldo en creditos
- video:
  - titulo
  - descripcion
  - precio en creditos
- comentario: 
  - texto
  - fecha realizado
- compra 
  - fecha
  - precio

```plantuml
@startuml VideosMusicales

class Persona {
  -nombre : String
  -direccionDeCorreoElectronico : String
  -saldoEnCreditos : real
}

class Video {
  -titulo : String
  -descripcion : String
  -precioEnCreditos : real
}

class Comentario {
  -texto : String
  -fechaRealizado : date
}

class Compra {
  -fecha : date
  -precio : real
}

Persona "1" --> "0..*" Video : "Publica"
Persona "1" --> "0..*" Compra : "Historial"
Video "1" --> "0..*" Comentario : "Tiene"
Comentario "0..*" --> "1" Persona : "Escrito por"

Compra "0..*" --> "1" Video : "Adquiere"
Compra "0..*" --> "1" Persona : "Comprador"

@enduml
```
## Ejercicio 5
