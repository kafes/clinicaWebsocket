/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import beans.clinica.TipoCentroFacadeLocal;
import entidades.tpi.clinica.TipoCentro;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author kari
 */
@RequestScoped
@Path("TipoCentro")
public class TipoCentroResource {

    @EJB
    TipoCentroFacadeLocal tipoCentroFacade;

    @GET
    @Path("/{idTipoCentro}")
    @Produces({MediaType.APPLICATION_JSON})
    public TipoCentro findById(@PathParam(value = "idTipoCentro") Integer idTipoCentro) {
        TipoCentro salida = null;
        try {
            if (idTipoCentro != null && idTipoCentro.compareTo(0) > 0) {
                salida = tipoCentroFacade.find(idTipoCentro);
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new TipoCentro();
            }
        }
        return salida;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<TipoCentro> findByAll() {
        List<TipoCentro> salida = null;
        try {
            if (tipoCentroFacade != null) {
                salida = tipoCentroFacade.findAll();
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new ArrayList<TipoCentro>();
            }
        }
        return salida;
    }

    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public String create(TipoCentro tipoCentro) {
        String salida = null;
        try {
            if (tipoCentro != null && tipoCentroFacade != null) {
                TipoCentro resultado = tipoCentroFacade.create(tipoCentro);
                //La segunda condicion no estoy segura de cual sea
                if (resultado != null && resultado.getIdTipoCentro().compareTo(0) > 0) {
                    return resultado.getIdTipoCentro().toString();
                }
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = "";
            }
        }
        return salida;
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public String update(TipoCentro tipoCentro) {
        String salida = null;
        try {
            if (tipoCentro != null & tipoCentroFacade != null) {
                TipoCentro tc = tipoCentroFacade.edit(tipoCentro);
                if (tc != null && tc.getIdTipoCentro().compareTo(0) > 0) {
                    return tc.getIdTipoCentro().toString();
                }
            }
        } catch (Exception e) {
        }
        return salida;
    }

    @DELETE
    @Path("/{idTipoCentro}")
    @Produces({MediaType.APPLICATION_JSON})
    public TipoCentro deleteById(@PathParam(value = "idTipoCentro") Integer idTipoCentro) {
        TipoCentro salida = null;
        TipoCentro tipoCentro = new TipoCentro(idTipoCentro);

        try {
            if (idTipoCentro != null && tipoCentro != null) {
                salida = tipoCentroFacade.remove(tipoCentro);
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida =  new TipoCentro();
            }
        }
        return salida;
    }

}
