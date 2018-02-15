/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.Conectar;
import com.finca.models.Trabajadores;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author JhoanSebas
 */
public class GuardarTrabajador {

    private JdbcTemplate jdbcTemplate;

    public GuardarTrabajador() {
        Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
    }
    
    public boolean guardarEmpleado(Trabajadores t){
        boolean guardar=false;
        try {
            this.jdbcTemplate.update("INSERT INTO trabajadores(Cedula,Nombre,Apellido,Telefono)VALUES"
                    + "("+t.getCedula()+",'"+t.getNombre()+"','"+t.getApellido()+"','"+t.getTelefono()+"');");
            
            guardar=true;
        } catch (Exception e) {
        }
        return guardar;
    
    }
    public int verificarCedula(int cedula)
    {
        int contador=0;
        String sql="select count(Cedula) from trabajadores where Cedula="+cedula+";";
        contador=this.jdbcTemplate.queryForInt(sql);
        return contador;
    }
    
       public boolean ActualizarEmpleado(Trabajadores t){
        boolean Actualizar=false;
        try {
            this.jdbcTemplate.update("UPDATE trabajadores SET Cedula="+t.getCedula()+",Nombre='"+t.getNombre()+"',Apellido='"+t.getApellido()+"',Telefono='"+t.getTelefono()+"' WHERE idTrabajador ="+t.getIdTrabajador()+";");            
            Actualizar=true;
        } catch (Exception e) {
        }
        return Actualizar;
    
    }
       
          public boolean EliminarEmpleado(int id){
        boolean Eliminar=false;
        try {
            this.jdbcTemplate.update("delete from trabajadores where idTrabajador=?;",id);            
            Eliminar=true;
        } catch (Exception e) {
        }
        return Eliminar;
    
    }
    
    public List ListarEmpleados()
    {
        List empleados=null;
       String Sql="SELECT idTrabajador,Cedula,concat('\\'',Nombre,'\\'')Nombre,concat('\\'',Apellido,'\\'')Apellido,concat('\\'',Telefono,'\\'')Telefono FROM trabajadores;";
        try {
         empleados=this.jdbcTemplate.queryForList(Sql);
          
        } catch (Exception e) {
        }
       
       return empleados;
    }
    
    
    
}
