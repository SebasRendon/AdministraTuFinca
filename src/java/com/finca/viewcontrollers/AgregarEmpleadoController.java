/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import com.finca.bussineslayer.GuardarTrabajador;
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
public class AgregarEmpleadoController {
    GuardarTrabajador g= new GuardarTrabajador();
    
    @RequestMapping(value = "AgregarEmpleado.htm",method = RequestMethod.GET)
    public ModelAndView agregar()
    {
        ModelAndView mav= new ModelAndView();
        mav.setViewName("AgregarEmpleado");
        return mav;
    }
    @RequestMapping(value = "GuardarEmplado.htm",method = RequestMethod.POST)
    public @ResponseBody String guardar(Trabajadores t)
    {
        String data="";
        int contador=g.verificarCedula(t.getCedula());
        if(contador==0)
        {
           boolean guardar=g.guardarEmpleado(t);
        if(guardar)
        {
           data="ok";
        }  
        }
        else
        {
            data="Ya hay un empleado con esta Cedula por favor Verifique";
        }
         
       
        return data;
    }
    
     @RequestMapping(value = "ActualizarEmplado.htm",method = RequestMethod.POST)
    public @ResponseBody String Actualizar(Trabajadores t)
    {
        String data="";
        boolean Actualizar=g.ActualizarEmpleado(t);
        if(Actualizar)
        {
           data="ok";
        }
        return data;
    }
    
      @RequestMapping(value = "EliminarEmplado.htm",method = RequestMethod.POST)
    public @ResponseBody String Eliminar(int id)
    {
        
        String data="";
        boolean Eliminar=g.EliminarEmpleado(id);
        if(Eliminar)
        {
           data="ok";
        }
        return data;
    }
    
    
    
      @RequestMapping(value = "TraerEmpleados.htm",method = RequestMethod.POST)
    public @ResponseBody String Traer()
    {
        String data="";
        
        List empleados=g.ListarEmpleados();
           for(int i=0;i<empleados.size();i++)
           {
               data+=empleados.get(i)+",";
           }
        
        return data;
    }
}
