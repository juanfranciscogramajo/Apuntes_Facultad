Criterios de aceptación (Registrarse): 

Escenario 1: Registro exitoso.

Dado el mail [redesP@gmail.com](mailto:redesP@gmail.com) que no es encuentra registrado y el cuil 20-9999-7 que no se encuentra registrado

Cuando se ingresa mail [redesP@gmail.com](mailto:redesP@gmail.com), cuil 20-9999-7, contraseña 4321 y presiona “Registrarse”

Entonces el sistema valida el registro e informa “Registro exitoso”.

  

Escenario 2: Registro fallido por mail ya existente

Dado el mail [juanpablo@gmail.com](mailto:juanpablo@gmail.com) que se encuentra registrado.

Cuando se ingresa el mail juan[pablo@gmail.com](mailto:pablo29@gmail.com), cuil 20-8888-1, contraseña 1022 y presiona “Registrarse”

Entonces el sistema informa “El mail ya se encuentra registrado”.

  

Escenario 3: Registro exitoso por cuil ya existente

Dado el cuil 27-4433-1 que se encuentra registrado

Cuando se ingresa el mail [peter@gmail.com](mailto:peter@gmail.com), cuil 27-4433-1, contraseña 0909 y presiona “Registrarse”.

Entonces el sistema informa “El cuil ya se encuentra registrado”