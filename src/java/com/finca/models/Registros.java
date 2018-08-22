/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.models;

/**
 *
 * @author Acer
 */
public class Registros {
    private int idRegistros;
    private String fecha;
    private int idTrabajador;
    private int kilos;
    private float Fornales;
    private int idLote;
    private float Total;
    private boolean cancelado; 
    private String Descripcion;
    
    public Registros() {
    }

    public Registros(int idRegistros, String fecha, int idTrabajador, int kilos, float Fornales, int idLote, float Total, boolean cancelado, String Descripcion) {
        this.idRegistros = idRegistros;
        this.fecha = fecha;
        this.idTrabajador = idTrabajador;
        this.kilos = kilos;
        this.Fornales = Fornales;
        this.idLote = idLote;
        this.Total = Total;
        this.cancelado = cancelado;
        this.Descripcion = Descripcion;
    }

    public Registros(String fecha, int idTrabajador, int kilos, float Fornales, int idLote, float Total, boolean cancelado, String Descripcion) {
        this.fecha = fecha;
        this.idTrabajador = idTrabajador;
        this.kilos = kilos;
        this.Fornales = Fornales;
        this.idLote = idLote;
        this.Total = Total;
        this.cancelado = cancelado;
        this.Descripcion = Descripcion;
    }
    

    public int getIdRegistros() {
        return idRegistros;
    }

    public void setIdRegistros(int idRegistros) {
        this.idRegistros = idRegistros;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdTrabajador() {
        return idTrabajador;
    }

    public void setIdTrabajador(int idTrabajador) {
        this.idTrabajador = idTrabajador;
    }

    public int getKilos() {
        return kilos;
    }

    public void setKilos(int kilos) {
        this.kilos = kilos;
    }

    public float getFornales() {
        return Fornales;
    }

    public void setFornales(float Fornales) {
        this.Fornales = Fornales;
    }

    public int getIdLote() {
        return idLote;
    }

    public void setIdLote(int idLote) {
        this.idLote = idLote;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public boolean isCancelado() {
        return cancelado;
    }

    public void setCancelado(boolean cancelado) {
        this.cancelado = cancelado;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    

   
    
}
