/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.facturas;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author JhoanSebas
 */
@Controller
public class HistorialController {
    facturas facturas=new facturas();
    @RequestMapping(value = "Historial.htm",method = RequestMethod.GET)
    public ModelAndView Historial()
    {
        ModelAndView mav= new ModelAndView();
        mav.setViewName("Historial");
       return mav;
    }
  
    @RequestMapping(value = "Facturasporpagar.htm",method = RequestMethod.POST)
    public @ResponseBody String facturasxPagar(int cedula)
    {
        String resultados="";
        try {
            List lista=facturas.Facturasxpagar(cedula);
             for(int i=0; i<lista.size();i++)
            {
                resultados+=lista.get(i)+",";
            }
            
        } catch (Exception e) {
            resultados=e.getMessage();
        }
        return  resultados;
    }
    
    
    @RequestMapping(value = "Facturapagadas.htm",method = RequestMethod.POST)
    public @ResponseBody String facturasPagadas(int cedula)
    {
        String resultados="";
        try {
            List lista=facturas.Facturaspagadas(cedula);
             for(int i=0; i<lista.size();i++)
            {
                resultados+=lista.get(i)+",";
            }
            
        } catch (Exception e) {
            resultados=e.getMessage();
        }
        return  resultados;
    }
    
    @RequestMapping(value = "pagarFactura.htm",method = RequestMethod.POST)
    public @ResponseBody String Pagarfacturas(int id,int opcion,int cedula)
    {
        String resultados="";
        if(opcion==1)
        {
           resultados=facturas.pagarUnRegstro(id);
        }
        else if(opcion==2){
            resultados=facturas.pagarTodosLosregistros(cedula);
        }
        return  resultados;
    }
    
     @RequestMapping(value = "SumaFactura.htm",method = RequestMethod.POST)
    public @ResponseBody String sumarTotal(int cedula, int opcion)
    {
        String resultados="";
        int suma=facturas.SumarTotal(cedula,opcion);
        resultados=String.valueOf(suma);
        
        return  resultados;
    }
    
}
