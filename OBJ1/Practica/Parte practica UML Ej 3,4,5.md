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
  - tectp
  - autor
  - fecha realizado
- compra 
  - Comprador: persona
  - Autor
  - video
  - fecha
  - precio

```plantuml
@startuml
Class Persona {
{field} - nombre: string	
{field} - direccionDeCorreoElectronico: string
{field} - saldoEnCreditos: real
}

Class Video {
{field} - titulo: String
{field} - descripcion: String
{field} - precioEnCreditos: real
}

Class Comentario { 
{field} - texto: String
{field} - fechaRealizado: date
} 

Class Compra { 
{field} - fecha: date
{field} - precio: real
}
Persona "1" --> "*" Video : "Compra"
Video "1" -> "*" Comentario
Compra "1" -> "1" Video
Compra "1" -> "2" Persona

@enduml
```