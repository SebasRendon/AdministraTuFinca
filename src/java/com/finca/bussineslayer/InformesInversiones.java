/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.bussineslayer;

import com.finca.models.Conectar;
import com.finca.models.informegastos;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Rendon
 */
public class InformesInversiones {
     private JdbcTemplate jdbcTemplate;

    public InformesInversiones() {
         Conectar cn= new Conectar();
        this.jdbcTemplate= new JdbcTemplate(cn.conectar());
    }
   
    
      public List informeGeneral(informegastos f)
    {
        
        
        String sql=" select ( select sum(total) from registros r inner join  trabajadores t on r.idTrabajador=t.idTrabajador\n" +
"inner join lotes l on l.idLote=r.idLote  where r.cancelado=1 and l.idLote like'%"+f.getIdlote()+"'\n" +
" and t.Cedula like '%"+f.getCedula()+"' and cast(r.fecha as date)  between '"+f.getFechaInicio()+"' and '"+f.getFechaFin()+"') as 'total',\n" +
" concat('\\'',l.Nombre,'\\'')lote, t.Cedula,concat('\\'',t.Nombre,'\\'')nombre,concat('\\'',r.fecha,'\\'')fecha, \n" +
" r.Kilos, r.Fornales, r.total as 'subtotal' from registros r inner join\n" +
" trabajadores t on r.idTrabajador=t.idTrabajador inner join lotes l on l.idLote=r.idLote  where r.cancelado=1 and l.idLote like'%"+f.getIdlote()+"'\n" +
" and t.Cedula like '%"+f.getCedula()+"' and cast(r.fecha as date)  between '"+f.getFechaInicio()+"' and '"+f.getFechaFin()+"' order by r.fecha; ";
        List resultado=this.jdbcTemplate.queryForList(sql);
        return resultado;
    }
}
