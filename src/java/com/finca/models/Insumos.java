/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.models;

/**
 *
 * @author JhoanSebas
 */
public class Insumos {
  private int id;
  private String Nombre;
  private String Descricion;

    public Insumos() {
    }

    public Insumos(String Nombre, String Descricion) {
        this.Nombre = Nombre;
        this.Descricion = Descricion;
    }

    public Insumos(int id, String Nombre, String Descricion) {
        this.id = id;
        this.Nombre = Nombre;
        this.Descricion = Descricion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescricion() {
        return Descricion;
    }

    public void setDescricion(String Descricion) {
        this.Descricion = Descricion;
    }
  
  
  
}
