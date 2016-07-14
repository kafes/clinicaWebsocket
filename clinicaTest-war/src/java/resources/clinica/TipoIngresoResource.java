/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import beans.clinica.TipoIngresoFacadeLocal;
import entidades.tpi.clinica.TipoIngreso;
import java.util.ArrayList;
import java.util.List;
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
@Path("TipoIngreso")
public class TipoIngresoResource {

    @EJB
    TipoIngresoFacadeLocal tipoIngresoFacade;

    @GET
    @Path("/{idTipoIngreso}")
    @Produces({MediaType.APPLICATION_JSON})
    public TipoIngreso findById(@PathParam(value = "idTipoIngreso") Integer idTipoIngreso) {
        TipoIngreso salida = null;
        try {
            if (idTipoIngreso != null && idTipoIngreso.compareTo(0) > 0) {
                salida = tipoIngresoFacade.find(idTipoIngreso);
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new TipoIngreso();
            }
        }
        return salida;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<TipoIngreso> findByAll() {
        List<TipoIngreso> salida = null;
        try {
            if (tipoIngresoFacade != null) {
                salida = tipoIngresoFacade.findAll();
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new ArrayList<TipoIngreso>();
            }
        }
        return salida;
    }
}
