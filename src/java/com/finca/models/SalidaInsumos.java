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
public class SalidaInsumos {
    private int idSalida;
    private int idInsumo;
    private int Cantidad;
    private int idLote;
    private String fecha;

    public SalidaInsumos() {
    }

    public SalidaInsumos(int idInsumo, int Cantidad, int idLote, String fecha) {
        this.idInsumo = idInsumo;
        this.Cantidad = Cantidad;
        this.idLote = idLote;
        this.fecha = fecha;
    }

    public int getIdSalida() {
        return idSalida;
    }

    public void setIdSalida(int idSalida) {
        this.idSalida = idSalida;
    }

    public int getIdInsumo() {
        return idInsumo;
    }

    public void setIdInsumo(int idInsumo) {
        this.idInsumo = idInsumo;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getIdLote() {
        return idLote;
    }

    public void setIdLote(int idLote) {
        this.idLote = idLote;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
    
    
}
