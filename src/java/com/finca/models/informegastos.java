/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.models;

/**
 *
 * @author Karen Ospina
 */
public class informegastos {
    private String FechaInicio;
    private String FechaFin;
    private String Idlote; //utilizo string para hacer uso en la consulta de Like
    private String Cedula;

    public informegastos() {
    }

    public informegastos(String FechaInicio, String FechaFin, String Idlote, String Cedula) {
        this.FechaInicio = FechaInicio;
        this.FechaFin = FechaFin;
        this.Idlote = Idlote;
        this.Cedula = Cedula;
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

    public String getIdlote() {
        return Idlote;
    }

    public void setIdlote(String Idlote) {
        this.Idlote = Idlote;
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }
    
    
}
