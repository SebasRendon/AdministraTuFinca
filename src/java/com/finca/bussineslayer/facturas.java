/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.Conectar;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author JhoanSebas
 */
public class facturas {
 private JdbcTemplate jdbcTemplate;

    public facturas() {
         Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
    }
    
    public List Facturasxpagar(int Cedula)
    {
        String sql="SELECT r.idRegistro,concat('\\'',r.fecha,'\\'')fecha ,r.Kilos,r.Fornales,r.total,concat('\\'',l.Nombre,'\\'')lote FROM\n" +
" registros r inner join lotes l on r.idLote=l.idLote inner join trabajadores t on r.idTrabajador=t.idTrabajador and\n" +
" r.cancelado=false and t.Cedula="+Cedula+";";
        List resultado=this.jdbcTemplate.queryForList(sql);
        return resultado;
    }
    
        
    public List Facturaspagadas(int Cedula)
    {
        String sql="SELECT r.idRegistro,concat('\\'',r.fecha,'\\'')fecha ,r.Kilos,r.Fornales,r.total,concat('\\'',l.Nombre,'\\'')lote FROM\n" +
" registros r inner join lotes l on r.idLote=l.idLote inner join trabajadores t on r.idTrabajador=t.idTrabajador and\n" +
" r.cancelado=true and t.Cedula="+Cedula+";";
        List resultado=this.jdbcTemplate.queryForList(sql);
        return resultado;
    }
    
    
    public String pagarUnRegstro(int id)
    {
        String Resultado="";
        try {
            String sql="update registros r set r.cancelado=true where r.idRegistro="+id+";";
            this.jdbcTemplate.update(sql);
            Resultado="ok";
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
        
        return Resultado;
                
    }
     public String pagarTodosLosregistros(int Cedula)
    {
        String Resultado="";
        try {
            String sql="update registros r inner join trabajadores t on r.idTrabajador=t.idTrabajador set r.cancelado=true where t.Cedula="+Cedula+";";
            this.jdbcTemplate.update(sql);
            Resultado="ok";
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
        
        return Resultado;
                
    }
    
    
    
     public Integer SumarTotal(int Cedula,int opcion)
    {
        int Resultado=0;
        String sql="SELECT  SUM(total) as total  FROM dbfinca.registros r inner join dbfinca.trabajadores t on t.idTrabajador=r.idTrabajador WHERE\n" +
"r.cancelado=false and t.Cedula="+Cedula+";";           
        String sql1="SELECT  SUM(total) as total  FROM dbfinca.registros r inner join dbfinca.trabajadores t on t.idTrabajador=r.idTrabajador WHERE\n" +
"r.cancelado=true and t.Cedula="+Cedula+";";
        
        try {
            if(opcion==1)
            {
                 Resultado= this.jdbcTemplate.queryForInt(sql); 
            }
            else if(opcion==2)
            {
                 Resultado= this.jdbcTemplate.queryForInt(sql1); 
            }
          
        } catch (Exception e) {
           
        }
        
        return Resultado;
                
    }
     
     
     
    
}
