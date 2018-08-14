/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.models;

/**
 *
 * @author Rendon
 */
public class FiltrarFechaLote {
    
    private String FechaInicio;
    private String FechaFin;
    private int Cedula;
    private String IdLote ;

    public FiltrarFechaLote() {
    }

    public FiltrarFechaLote(String FechaInicio, String FechaFin, int Cedula, String IdLote) {
        this.FechaInicio = FechaInicio;
        this.FechaFin = FechaFin;
        this.Cedula = Cedula;
        this.IdLote = IdLote;
    }
    
    
    

    public String getFechaInicio() {
        return FechaInicio;
    }

    public void setFechaInicio(String FechaInicio) {
        this.FechaInicio = FechaInicio;
    }

    public String getFechaFin() {
        return FechaFin;
    }

    public void setFechaFin(String FechaFin) {
        this.FechaFin = FechaFin;
    }

    public int getCedula() {
        return Cedula;
    }

    public void setCedula(int Cedula) {
        this.Cedula = Cedula;
    }

    public String getIdLote() {
        return IdLote;
    }

    public void setIdLote(String IdLote) {
        this.IdLote = IdLote;
    }
    
    
}
