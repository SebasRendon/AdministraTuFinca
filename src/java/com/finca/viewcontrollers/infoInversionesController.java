/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.InformesInversiones;
import com.finca.models.informegastos;
import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



/**
 *
 * @author Rendon
 */
public class infoInversionesController {
  @RequestMapping(value = "infoInversiones.htm",method = RequestMethod.GET)
public ModelAndView VerInversiones()
       {
           ModelAndView mav = new ModelAndView();
           mav.setViewName("infoInversiones");
           return mav;
       }
     InformesInversiones inv= new InformesInversiones();
     
@RequestMapping (value ="informeGeneral.htm",method = RequestMethod.POST)
    @ResponseBody String informeGeneral(informegastos f)
    {
        
        String resultado="";
   List lista=inv.informeGeneral(f);
          for(int i=0; i<lista.size();i++)
            {
                resultado+=lista.get(i)+",";
            }
        return resultado;
    
    
    }



}
