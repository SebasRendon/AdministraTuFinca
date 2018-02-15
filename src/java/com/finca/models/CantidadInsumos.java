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
public class CantidadInsumos {
    private int id;
    private int idInsumo;
    private String fecha_compra;
    private int Cantidad;
    private int Precio_unitario ; 

    public CantidadInsumos(int idInsumo, String fecha_compra, int Cantidad, int Precio_unitario) {
        this.idInsumo = idInsumo;
        this.fecha_compra = fecha_compra;
        this.Cantidad = Cantidad;
        this.Precio_unitario = Precio_unitario;
    }

    public CantidadInsumos() {
    }

    public CantidadInsumos(int id, int idInsumo, String fecha_compra, int Cantidad, int Precio_unitario) {
        this.id = id;
        this.idInsumo = idInsumo;
        this.fecha_compra = fecha_compra;
        this.Cantidad = Cantidad;
        this.Precio_unitario = Precio_unitario;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdInsumo() {
        return idInsumo;
    }

    public void setIdInsumo(int idInsumo) {
        this.idInsumo = idInsumo;
    }

    public String getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(String fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getPrecio_unitario() {
        return Precio_unitario;
    }

    public void setPrecio_unitario(int Precio_unitario) {
        this.Precio_unitario = Precio_unitario;
    }
    
    
    
            
    
}
