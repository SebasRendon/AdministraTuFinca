/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.LotesBl;
import com.finca.models.Lotes;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 *
 * @author JhoanSebas
 */
@Controller
public class LotesController {
    LotesBl lotes=new LotesBl();
    
    @RequestMapping(value = "CrearLote.htm",method = RequestMethod.POST)
    @ResponseBody String crearLote(Lotes lote)
    {
        String Resultado=lotes.insertarLotes(lote);
        return Resultado;
    }
    
    
     @RequestMapping(value = "TraerLotes.htm",method = RequestMethod.POST)
    @ResponseBody String TraerLotes()
    { String Resultado="";
        List lita=lotes.lotesLita();
         for(int i=0; i<lita.size();i++)
            {
                Resultado+=lita.get(i)+",";
            }
        return Resultado;
    }
    
      @RequestMapping(value = "ActualizarLotes.htm",method = RequestMethod.POST)
    @ResponseBody String ActualizarLotes(Lotes lote)
    { 
        String Resultado=lotes.Actualizar(lote);        
         
        return Resultado;
    }
    
}
