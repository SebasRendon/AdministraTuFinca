/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finca.viewcontrollers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Rendon
 */
public class FacturacionController {
    
    @RequestMapping(value = "facturacion.htm", method = RequestMethod.GET)
    public ModelAndView facturar()
    {
        ModelAndView mav = new  ModelAndView();
        mav.setViewName("facturacion");
        return mav;
    }
       
   
         
    
}
