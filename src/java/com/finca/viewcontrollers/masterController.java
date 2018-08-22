
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.BuscarTrabajadorBL;
import com.finca.models.Registros;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Acer
 */
@Controller
public class masterController {
    
    BuscarTrabajadorBL Buscar= new BuscarTrabajadorBL();
    
    @RequestMapping(value ="masterpage.htm",method = RequestMethod.GET )
    public ModelAndView master()
    {
        ModelAndView mav= new ModelAndView();
        mav.setViewName("masterpage");
        return mav;
    }
    
    @RequestMapping(value ="AddRegistros.htm",method = RequestMethod.GET )
    public ModelAndView Registro()
    {
       ModelAndView mav= new ModelAndView();
        mav.setViewName("AddRegistros");
        return mav; 
    }
    
    @RequestMapping(value = "BuscarTrabajador.htm",method = RequestMethod.POST)
    public @ResponseBody String BuscarEmpleado(String Criterio)
    {
        String Resultado="";
        try {
            List Consulta=Buscar.BuscarTrabajador(Criterio);
            for(int i=0; i<Consulta.size();i++)
            {
                Resultado+=Consulta.get(i)+",";
            }
        } catch (Exception e) {
        }
        return  Resultado;
    }
   
            @RequestMapping(value = "traerLotes.htm",method = RequestMethod.POST)
    public @ResponseBody String TraerLotes()
    {
        String Resultado="";
        try {
            List Consulta=Buscar.TraerLotes();
            for(int i=0; i<Consulta.size();i++)
            {
                Resultado+=Consulta.get(i)+",";
            }
        } catch (Exception e) {
        }
        return  Resultado;
    }
    
    @RequestMapping(value = "traerPrecio.htm",method = RequestMethod.POST)
    public @ResponseBody String TraerPrecio(int opcion)
    {
        String Total="";
        try {
            int resultado=Buscar.precios(opcion);
           Total=String.valueOf(resultado);
        } catch (Exception e) {
        }
        return  Total;
    }
    
      @RequestMapping(value = "GuardarRegistro.htm",method = RequestMethod.POST)
    public @ResponseBody String GuardarRegistro(Registros R)
    {
       String finalR="";
        if(Buscar.guardarRegistro(R))
        {
             finalR="Guardado Con Exito";
        }
       
        return  finalR;
    }
    
}
