/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.Conectar;
import com.finca.models.Registros;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Acer
 */
public class BuscarTrabajadorBL {
    private JdbcTemplate jdbcTemplate;

    public BuscarTrabajadorBL() {
        Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
    }
    
    public List BuscarTrabajador(String Criterio)
    {
        String SQl="select t.idTrabajador,t.cedula, concat('\\'',Nombre,'\\'')Nombre,concat('\\'',t.Apellido,'\\'')Apellido ,concat('\\'',t.Telefono,'\\'')Telefono from trabajadores t where t.Cedula like '%"+Criterio+"%'\n" +
" or t.Nombre like '%"+Criterio+"%' or t.Apellido Like '%"+Criterio+"%' or t.Telefono \n" +
" like'%"+Criterio+"%';";
        List Resultado=this.jdbcTemplate.queryForList(SQl);
        return Resultado;
        
    }
    
    public List TraerLotes()
    {
        String Sql="SELECT idLote,concat('\\'',Nombre,'\\'')nombre  FROM dbfinca.lotes;";
        List Resultado= this.jdbcTemplate.queryForList(Sql);
        return Resultado;
    }
    
    public int precios(int opcion)
    {
        String sql="";
        if(opcion==1)
        {
           sql="SELECT PrecioKilo FROM precios;";
        }
        else if(opcion==2)
        {
            sql="SELECT PrecioDia FROM precios;";
        }
        int Resultado=this.jdbcTemplate.queryForInt(sql);
        
        return Resultado;
        
    }
    
    public boolean guardarRegistro(Registros R)
    {
        boolean guardar= false;
        try {
            this.jdbcTemplate.update("INSERT INTO registros(idTrabajador,Kilos,Fornales,idLote,total,cancelado,Descripcion)VALUES("+R.getIdTrabajador()+","+R.getKilos()+","+R.getFornales()+","+R.getIdLote()+","+R.getTotal()+","+R.isCancelado()+",'"+R.getDescripcion()+"');");
            guardar=true;
        } catch (Exception e) {
        }

        return guardar;
        
    }
    
}
