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
public class Precios {
    private int idPrecio;
    private int PrecioKilo;
    private int PrecioDia;

    public Precios() {
    }
    
    

    public Precios(int idPrecio, int PrecioKilo, int PrecioDia) {
        this.idPrecio = idPrecio;
        this.PrecioKilo = PrecioKilo;
        this.PrecioDia = PrecioDia;
    }

    public int getIdPrecio() {
        return idPrecio;
    }

    public void setIdPrecio(int idPrecio) {
        this.idPrecio = idPrecio;
    }

    public int getPrecioKilo() {
        return PrecioKilo;
    }

    public void setPrecioKilo(int PrecioKilo) {
        this.PrecioKilo = PrecioKilo;
    }

    public int getPrecioDia() {
        return PrecioDia;
    }

    public void setPrecioDia(int PrecioDia) {
        this.PrecioDia = PrecioDia;
    }
    
    
    
    
}
