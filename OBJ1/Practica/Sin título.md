package ar.edu.unlp.info.oo1.Ej9_Mamiferos;

import java.time.LocalDate;

public class Mamifero {

private String identificador;

private String especie;

private LocalDate fechaDeNacimiento;

private Mamifero padre;

private Mamifero madre;

public Mamifero(String especie) {

this.identificador = "";

this.especie = especie;

this.fechaDeNacimiento = LocalDate.now();

this.padre = null;

this.madre = null;

}

public String getIdentificador() {

return this.identificador;

}

  

public void setIdentificador(String identificador) {

this.identificador = identificador;

}

  

public String getEspecie() {

return this.especie;

}

  

public void setEspecie(String especie) {

this.especie = especie;

}

  

public LocalDate getFechaDeNacimiento() {

return this.fechaDeNacimiento;

}

  

public void setFechaDeNacimiento(LocalDate fechaDeNacimiento) {

this.fechaDeNacimiento = fechaDeNacimiento;

}

  

public Mamifero getPadre() {

return this.padre;

}

  

public void setPadre(Mamifero padre) {

this.padre = padre;

}

  

public Mamifero getMadre() {

return this.madre;

}

  

public void setMadre(Mamifero madre) {

this.madre = madre;

}

public Mamifero getAbueloMaterno() {

return this.getMadre().getPadre();

}

public Mamifero getAbuelaMaterno() {

return this.getMadre().getMadre();

}

public Mamifero getAbueloPaterno() {

return this.getPadre().getPadre();

}

public Mamifero getAbuelaPaterno() {

return this.getPadre().getMadre();

}

  

public Boolean tieneComoAncestroA(Mamifero unMamifero) {

}

}