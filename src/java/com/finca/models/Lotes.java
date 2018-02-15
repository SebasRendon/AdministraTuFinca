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
public class Lotes {
    private int idLote;
    private String Nombre;
    private int CantidadArboles;
    private String NombreSemilla;
    private String Fecha_Siembra;

    public Lotes(int idLote, String Nombre, int CantidadArboles, String NombreSemilla, String Fecha_Siembra) {
        this.idLote = idLote;
        this.Nombre = Nombre;
        this.CantidadArboles = CantidadArboles;
        this.NombreSemilla = NombreSemilla;
        this.Fecha_Siembra = Fecha_Siembra;
    }

    public Lotes(String Nombre, int CantidadArboles, String NombreSemilla, String Fecha_Siembra) {
        this.Nombre = Nombre;
        this.CantidadArboles = CantidadArboles;
        this.NombreSemilla = NombreSemilla;
        this.Fecha_Siembra = Fecha_Siembra;
    }

    public Lotes() {
    }

    public int getIdLote() {
        return idLote;
    }

    public void setIdLote(int idLote) {
        this.idLote = idLote;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getCantidadArboles() {
        return CantidadArboles;
    }

    public void setCantidadArboles(int CantidadArboles) {
        this.CantidadArboles = CantidadArboles;
    }

    public String getNombreSemilla() {
        return NombreSemilla;
    }

    public void setNombreSemilla(String NombreSemilla) {
        this.NombreSemilla = NombreSemilla;
    }

    public String getFecha_Siembra() {
        return Fecha_Siembra;
    }

    public void setFecha_Siembra(String Fecha_Siembra) {
        this.Fecha_Siembra = Fecha_Siembra;
    }
    
    
}
