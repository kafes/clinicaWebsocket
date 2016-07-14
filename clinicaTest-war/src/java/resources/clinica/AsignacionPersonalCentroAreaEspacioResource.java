/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import beans.clinica.AsignacionPersonalCentroAreaEspacioFacadeLocal;
import entidades.tpi.clinica.AsignacionPersonalCentroAreaEspacio;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.bean.RequestScoped;
import javax.inject.Named;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author kari
 */
@Named
@RequestScoped
@Path("AsignacionPersonalCentroAreaEspacio")
public class AsignacionPersonalCentroAreaEspacioResource {

    @EJB
    AsignacionPersonalCentroAreaEspacioFacadeLocal apcaeFacade;

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<AsignacionPersonalCentroAreaEspacio> findAll() {
        List<AsignacionPersonalCentroAreaEspacio> salida = null;
        try {
            if (apcaeFacade != null) {
                salida = apcaeFacade.findAll();
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

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idAPCA}/{idACE}/{idTurno}")
    public AsignacionPersonalCentroAreaEspacio findByPKs(@PathParam(value = "idAPCA") Long idAPCA, @PathParam(value = "idACE") Long idACE, @PathParam(value = "idTurno") Long idTurno) {
        AsignacionPersonalCentroAreaEspacio salida = null;
        try {
            if (apcaeFacade != null) {
                salida = apcaeFacade.findByPKs(idAPCA, idACE, idTurno);
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (salida == null) {
                salida = new AsignacionPersonalCentroAreaEspacio();
            }
        }
        return salida;
    }
}
