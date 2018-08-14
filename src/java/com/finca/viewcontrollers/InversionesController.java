/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.InventarioBl;
import com.finca.models.CantidadInsumos;
import com.finca.models.FiltrarFechaLote;
import com.finca.models.Insumos;
import com.finca.models.Precios;
import com.finca.models.SalidaInsumos;
import com.finca.models.Trabajadores;
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
public class InversionesController {
    InventarioBl inventario =new InventarioBl();
    
    @RequestMapping (value ="Inversiones.htm",method = RequestMethod.GET)
    public ModelAndView inversiones()
    {
     ModelAndView mav=new ModelAndView();
     mav.setViewName("Inversiones");
     return mav;
    }
    
   @RequestMapping (value ="crearInsumo.htm",method = RequestMethod.POST)
    @ResponseBody String crearInsumo(String nombre,String descripcion)
    {
    String Resultado="";
        try {
            Resultado=inventario.CrearInsumo(nombre, descripcion);
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
    return Resultado;
    }

      @RequestMapping (value ="filtrarlotefecha.htm",method = RequestMethod.POST)
    @ResponseBody String filtrarlotefecha(FiltrarFechaLote f )
    {
    String Resultado="";
        try {
          List Consulta=inventario.listarfechalote(f);
            for(int i=0; i<Consulta.size();i++)
            {
                Resultado+=Consulta.get(i)+",";
            }
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
    return Resultado;
    }

 
      @RequestMapping(value = "TraerInsumos.htm",method = RequestMethod.POST)
    public @ResponseBody String Traer()
    {
        String data="";
        
        List empleados=inventario.ListarInsumos();
           for(int i=0;i<empleados.size();i++)
           {
               data+=empleados.get(i)+",";
           }
        
        return data;
    }  
    
      @RequestMapping(value = "TraerCantidadInsumos.htm",method = RequestMethod.POST)
    public @ResponseBody String TraerCantidad()
    {
        String data="";
        
        List empleados=inventario.ListarCantidadInsumos();
           for(int i=0;i<empleados.size();i++)
           {
               data+=empleados.get(i)+",";
           }
        
        return data;
    }  
    
    
    
      @RequestMapping(value = "TraerPrecios.htm",method = RequestMethod.POST)
    public @ResponseBody String listarPrecios()
    {
        String data="";
        
        List Precios=inventario.ListarPrecios();
           for(int i=0;i<Precios.size();i++)
           {
               data+=Precios.get(i)+",";
           }
        
        return data;
    }  
    
    
    
    
       @RequestMapping(value = "SalidaInsumosLista.htm",method = RequestMethod.POST)
    public @ResponseBody String SalidaInsumos()
    {
        String data="";
        
        List empleados=inventario.ListarInsumosSalida();
           for(int i=0;i<empleados.size();i++)
           {
               data+=empleados.get(i)+",";
           }
        
        return data;
    }  
    
    
       @RequestMapping(value = "ActualizarInsumo.htm",method = RequestMethod.POST)
    public @ResponseBody String Actualizar(Insumos s)
    {
        String data="";
        boolean Actualizar=inventario.ActualizarInsumo(s);
        if(Actualizar)
        {
           data="ok";
        }
        return data;
    }
    
         @RequestMapping(value = "CambiarPrecios.htm",method = RequestMethod.POST)
    public @ResponseBody String ActualizarPrecios(Precios p)
    {
        String data="";
        boolean Actualizar=inventario.ActualizarPrecios(p);
        if(Actualizar)
        {
           data="ok";
        }
        return data;
    }
    
    
    
      @RequestMapping(value = "EliminarInsumo.htm",method = RequestMethod.POST)
    public @ResponseBody String Eliminar(int id)
    {
        
        String data="";
        boolean Eliminar=inventario.EliminarInsumo(id);
        if(Eliminar)
        {
           data="ok";
        }
        return data;
    }
    
      
   @RequestMapping (value ="CantidadInsumo.htm",method = RequestMethod.POST)
    @ResponseBody String CantidadInsumo(CantidadInsumos cant)
    {
    String Resultado="";
        try {
            Resultado=inventario.CantidadInsumo(cant);
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
    return Resultado;
    }
    
      @RequestMapping (value ="SalirInsumo.htm",method = RequestMethod.POST)
    @ResponseBody String SalidaInsumo(SalidaInsumos salida)
    {
    String Resultado="";
        try {
            Resultado=inventario.CantidadInsumoSalida(salida);
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
    return Resultado;
    }
    
    
    
    
    
    
     @RequestMapping (value ="CantidadInsumoDisponible.htm",method = RequestMethod.POST)
    @ResponseBody String CantidadInsumoDisponibles(int id)
    {
    String Resultado="";
    int numero=0;
        try {
            numero=inventario.CantidadInsumosDisponibles(id);
            Resultado=String.valueOf(numero);
        } catch (Exception e) {
            Resultado=e.getMessage();
        }
    return Resultado;
    }
    
    
}
