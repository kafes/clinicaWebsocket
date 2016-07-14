/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import beans.clinica.PacienteFacadeLocal;
import entidades.tpi.clinica.Paciente;
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
@RequestScoped
@Path("Paciente")
public class PacienteResource {

    @EJB
    PacienteFacadeLocal pacienteFacade;

    @GET
    @Path("/{idPaciente}")
    @Produces({MediaType.APPLICATION_JSON})
    public Paciente findById(@PathParam(value = "idPaciente") Long idPaciente) {
        Paciente salida = null;
        try {
            if (idPaciente != null && idPaciente.compareTo(0L) > 0) {
                salida = pacienteFacade.find(idPaciente);
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new Paciente();
            }
        }
        return salida;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<Paciente> findByAll() {
        List<Paciente> salida = null;
        try {
            if (pacienteFacade != null) {
                salida = pacienteFacade.findAll();
            }
        } catch (Exception e) {
        } finally {
            if (salida == null) {
                salida = new ArrayList<Paciente>();
            }
        }
        return salida;
    }
}
