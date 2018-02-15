/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.Conectar;
import com.finca.models.Lotes;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author JhoanSebas
 */
public class LotesBl {
JdbcTemplate jdbcTemplate;
    public LotesBl() {
         Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
        
    }
    
   public String insertarLotes(Lotes lote)
   {
       String resultado="";
       try {
           String Sql="INSERT INTO lotes(Nombre,CantidadArboles,NombreSemilla,Fecha_Siembra)VALUES('"+lote.getNombre()+"',"+lote.getCantidadArboles()+",'"+lote.getNombreSemilla()+"','"+lote.getFecha_Siembra()+"');";
       this.jdbcTemplate.update(Sql);
       resultado="ok";
       } catch (Exception e) {
           resultado=e.getMessage();
       }
       
       return resultado;
   }
   
    public String Actualizar(Lotes lote)
   {
       String resultado="";
       try {
           String Sql="UPDATE lotes SET Nombre = '"+lote.getNombre()+"',CantidadArboles ="+lote.getCantidadArboles()+",NombreSemilla = '"+lote.getNombreSemilla()+"',Fecha_Siembra = '"+lote.getFecha_Siembra()+"' WHERE idLote = "+lote.getIdLote()+";";
       this.jdbcTemplate.update(Sql);
       resultado="ok";
       } catch (Exception e) {
           resultado=e.getMessage();
       }
       
       return resultado;
   }
    
   
     public List lotesLita()
    {
        String sql="SELECT idLote,concat('\\'',Nombre,'\\'')nombre,CantidadArboles,concat('\\'',NombreSemilla,'\\'')NombreSemilla,concat('\\'',Fecha_Siembra,'\\'')fecha FROM dbfinca.lotes;";
        List resultado=this.jdbcTemplate.queryForList(sql);
        return resultado;
    }
    

}
