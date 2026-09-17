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
  - Class Inversor{
{field} valor de inversion: real
{field} cartera de inversiones: inversiones
}
Class Inversiones{
{field} valor actual: real
{field} inversion en acciones: List< Inversion_acciones>
{field} inversion en plazo fijo: List<Inversion_en_plazo_fijo>
}
Class Inversion_acciones{
{field} cantidad
{field}nombre 
{field} valor unitario
}
Class Inversion_en_plazo_fijo{
{field} monto depositado
{field} fecha inicial
{field} porcentaje de interes diario
{field} porcentaje de interes 
}
Inversor-->> Inversiones 