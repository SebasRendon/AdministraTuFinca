/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.CantidadInsumos;
import com.finca.models.Conectar;
import com.finca.models.FiltrarFechaLote;
import com.finca.models.Insumos;
import com.finca.models.Precios;
import com.finca.models.SalidaInsumos;
import com.finca.models.Trabajadores;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author JhoanSebas
 */
public class InventarioBl {
     private JdbcTemplate jdbcTemplate;

    public InventarioBl() {
        Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
    }
    
       public String CrearInsumo(String nombre, String descripcion )
    {
        String Resultado="";
        try {
            String sql="INSERT INTO insumos(Nombre,Descripcion,CantidadDisponible)VALUES('"+nombre+"','"+descripcion+"',0);";
            this.jdbcTemplate.update(sql);
            Resultado="ok";
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
        
        return Resultado;
                
    }
       
            public String CantidadInsumo(CantidadInsumos cant )
    {
        String Resultado="";
        int total=cant.getPrecio_unitario()*cant.getCantidad();
        try {
            String sql="INSERT INTO insumoscantidad(idInsumo,fecha_compra,Cantidad,Precio_unitario,Total)VALUES("+cant.getIdInsumo()+",'"+cant.getFecha_compra()+"',"+cant.getCantidad()+","+cant.getPrecio_unitario()+","+total+");";
            this.jdbcTemplate.update(sql);            
            Resultado="ok";
            CantidadDisponible(cant.getCantidad(), cant.getIdInsumo());
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
        
        return Resultado;
                
    }
            public void CantidadDisponible(int cantidad,int id)
            {
               String sql1="update insumos set CantidadDisponible=CantidadDisponible+"+cantidad+" where idInsumo="+id+";";
            this.jdbcTemplate.update(sql1); 
            sql1="ok";
            }
            
                   public String CantidadInsumoSalida(SalidaInsumos salida )
    {
        String Resultado="";
        
        try {
            String sql="INSERT INTO salida_insumos(idInsumo,Cantidad,idLote,fecha)VALUES("+salida.getIdInsumo()+","+salida.getCantidad()+","+salida.getIdLote()+",'"+salida.getFecha()+"');";
            this.jdbcTemplate.update(sql);            
            Resultado="ok";
            CantidadSalida(salida.getCantidad(), salida.getIdInsumo());
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
        
        return Resultado;
                
    }
//                   esta funcion descuenta el valor a salir de la cantidad total
                    public void CantidadSalida(int cantidad,int id)
            {
               String sql1="update insumos set CantidadDisponible=CantidadDisponible-"+cantidad+" where idInsumo="+id+";";
            this.jdbcTemplate.update(sql1); 
            sql1="ok";
            }
            
       
         public List ListarInsumos()
    {
        List empleados=null;
       String Sql="SELECT idInsumo,concat('\\'',Nombre,'\\'')Nombre,concat('\\'',Descripcion,'\\'')Descripcion,CantidadDisponible FROM insumos;";
        try {
         empleados=this.jdbcTemplate.queryForList(Sql);
          
        } catch (Exception e) {
        }
       
       return empleados;
    }
         
         public List listarfechalote(FiltrarFechaLote f )
    {
       
        String SQl="select (select sum(total)  from\n" +
" registros r inner join lotes l on r.idLote=l.idLote inner join trabajadores t on r.idTrabajador=t.idTrabajador where t.Cedula="+f.getCedula()+" and r.idLote like '%"+f.getIdLote()+"' and\n" +
" CAST(r.fecha AS DATE) between '"+f.getFechaInicio()+"' AND '"+f.getFechaFin()+"' )suma, concat('\\'',r.fecha,'\\'')fecha, r.Kilos, r.fornales,concat('\\'',l.Nombre,'\\'')Nombre, r.total  from\n" +
" registros r inner join lotes l on r.idLote=l.idLote inner join trabajadores t on r.idTrabajador=t.idTrabajador where t.Cedula="+f.getCedula()+" and r.idLote like '%"+f.getIdLote()+"' and\n" +
" CAST(r.fecha AS DATE) between '"+f.getFechaInicio()+"' AND '"+f.getFechaFin()+"';";
        List Resultado=this.jdbcTemplate.queryForList(SQl);
        return Resultado;
        
    }    
               
         
                public List ListarInsumosSalida()
    {
        List empleados=null;
       String Sql="SELECT concat('\\'',l.Nombre,'\\'')NombreLote,concat('\\'',i.Nombre,'\\'')NombreInsumo,s.Cantidad,concat('\\'',s.fecha,'\\'')fecha FROM salida_insumos s inner join insumos i on s.idInsumo=i.idInsumo inner join lotes l on l.idLote=s.idLote order by s.idSalida desc ;";
        try {
         empleados=this.jdbcTemplate.queryForList(Sql);
          
        } catch (Exception e) {
        }
       
       return empleados;
    }
         
         
               public List ListarCantidadInsumos()
    {
        List empleados=null;
       String Sql="SELECT id,concat('\\'',fecha_compra,'\\'')fecha,concat('\\'',insumos.Nombre,'\\'')Nombre,Cantidad,Precio_unitario,Total  FROM insumoscantidad inner join insumos on insumos.idInsumo=insumoscantidad.idInsumo order by id desc;";
        try {
         empleados=this.jdbcTemplate.queryForList(Sql);
          
        } catch (Exception e) {
        }
       
       return empleados;
    }
            
                 
               public List ListarPrecios()
    {
        List precios=null;
       String Sql="SELECT idPrecio,PrecioKilo,PrecioDia FROM dbfinca.precios; ";
        try {
         precios=this.jdbcTemplate.queryForList(Sql);
          
        } catch (Exception e) {
        }
       
       return precios;
    }
               
                          public int CantidadInsumosDisponibles(int id)
    {
        int disponibles=0;
       String Sql="SELECT CantidadDisponible FROM dbfinca.insumos where idInsumo="+id+";";
        try {
         disponibles=this.jdbcTemplate.queryForInt(Sql);
          
        } catch (Exception e) {
        }
       
       return disponibles;
    }
         
         
    
       
       public boolean ActualizarInsumo(Insumos s){
        boolean Actualizar=false;
        try {                    
            this.jdbcTemplate.update("UPDATE insumos SET Nombre='"+s.getNombre()+"',Descripcion='"+s.getDescricion()+"' WHERE idInsumo ="+s.getId()+";");            
            Actualizar=true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return Actualizar;
    
    } 
       
          
       public boolean ActualizarPrecios(Precios p){
        boolean Actualizar=false;
        try {                    
            this.jdbcTemplate.update("UPDATE precios SET PrecioKilo = "+p.getPrecioKilo()+",PrecioDia = "+p.getPrecioDia()+" WHERE idPrecio = "+p.getIdPrecio()+";");            
            Actualizar=true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return Actualizar;
    
    } 
      
       
       
           public boolean EliminarInsumo(int id){
        boolean Eliminar=false;
        try {
            this.jdbcTemplate.update("delete from insumos where idInsumo=?;",id);            
            Eliminar=true;
        } catch (Exception e) {
        }
        return Eliminar;
    
    }
    
           
           
         
   
}
