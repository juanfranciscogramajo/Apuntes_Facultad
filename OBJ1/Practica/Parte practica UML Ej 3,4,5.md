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
```
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

![[Pasted image 20260917195355.png]]

---

# Ejercicio 4 
---

- Persona:
	- Nombre
	- direccion de correo electronico
	- saldo en creditos
	- videos en venta
- video:
  - titulo
  - comentarios
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