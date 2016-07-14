/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import beans.clinica.IngresoDetalleExamenFacadeLocal;
import entidades.tpi.clinica.IngresoDetalleExamen;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.bean.RequestScoped;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author kari
 */
@Named
@RequestScoped
@Path("IngresoDetalleExamen")
public class IngresoDetalleExamenResource {

    @EJB
    private IngresoDetalleExamenFacadeLocal ingresoDetalleExamenFacade;

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<IngresoDetalleExamen> findAll() {
        List<IngresoDetalleExamen> salida = null;
        try {
            if (ingresoDetalleExamenFacade != null) {
                salida = ingresoDetalleExamenFacade.findAll();
            }
        } catch (Exception ex) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
        } finally {
            if (salida == null) {
                salida = new ArrayList<>();
            }
        }
        return salida;
    }
}
