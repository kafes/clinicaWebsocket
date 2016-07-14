package resources.clinica;

import beans.clinica.IngresoDetalleDiagnosticoFacadeLocal;
import beans.clinica.IngresoDetalleExamenFacadeLocal;
import beans.clinica.IngresoDetalleFacadeLocal;
import beans.clinica.IngresoFacadeLocal;
import entidades.tpi.clinica.IngresoDetalle;
import entidades.tpi.clinica.IngresoDetalleDiagnostico;
import entidades.tpi.clinica.IngresoDetalleExamen;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.faces.bean.RequestScoped;
import javax.inject.Named;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Named
@RequestScoped
@Path("IngresoDetalle")
public class IngresoDetalleResource {

    @EJB
    private IngresoDetalleFacadeLocal ingresoDetalleFacade;

    @EJB
    private IngresoFacadeLocal ingresoFacade;

    @EJB
    private IngresoDetalleDiagnosticoFacadeLocal ingresoDetalleDiagnosticoFacade;
    @EJB
    private IngresoDetalleExamenFacadeLocal ingresoDetalleExamenFacade;

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<IngresoDetalle> findAll() {
        List<IngresoDetalle> salida = null;
        try {
            if (ingresoDetalleFacade != null) {
                salida = ingresoDetalleFacade.findAll();
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
    @Path("/{idIngreso}/{idAPCA}/{idACE}/{idTurno}")
    public IngresoDetalle findByPKs(@PathParam(value = "idIngreso") Long idIngreso, @PathParam(value = "idAPCA") Long idAPCA, @PathParam(value = "idACE") Long idACE, @PathParam(value = "idTurno") Long idTurno) {
        IngresoDetalle salida = null;

        try {
            if (ingresoDetalleFacade != null) {
                salida = ingresoDetalleFacade.findByPKs(idIngreso, idAPCA, idACE, idTurno);
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (salida == null) {
                salida = new IngresoDetalle();
            }
        }
        return salida;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idIngreso}")
    public List<IngresoDetalle> findByIngreso(@PathParam(value = "idIngreso") Long idIngreso) {
        List<IngresoDetalle> salida = null;
        try {
            if (ingresoDetalleFacade != null) {
                salida = ingresoDetalleFacade.findByIdIngreso(idIngreso);
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (salida == null) {
                salida = new ArrayList<IngresoDetalle>();
            }
        }
        return salida;
    }

    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public String create(IngresoDetalle ingresoDetalle) {
        String salida = null;
        try {
            if (ingresoDetalle != null && ingresoDetalleFacade != null) {
                IngresoDetalle resultado = ingresoDetalleFacade.create(ingresoDetalle);
                if (resultado != null && resultado.getIngresoDetallePK() != null) {
                    return resultado.getIngresoDetallePK().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoDetalleResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }

    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    public String update(IngresoDetalle ingresoDetalle) {
        String salida = null;
        try {
            if (ingresoDetalle != null && ingresoDetalleFacade != null) {
                IngresoDetalle resultado = ingresoDetalleFacade.edit(ingresoDetalle);
                if (resultado != null && resultado.getIngresoDetallePK() != null) {
                    System.out.println("ID del put " + resultado.getIngresoDetallePK().toString());
                    return resultado.getIngresoDetallePK().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }

    /*
    @DELETE
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idIngreso}/{idAPCA}/{idACE}/{idTurno}")
    public String delete(@PathParam(value = "idIngreso") Long idIngreso, @PathParam(value = "idAPCA") Long idAPCA, @PathParam(value = "idACE") Long idACE, @PathParam(value = "idTurno") Long idTurno) {
        String salida = null;
        IngresoDetalle ingresoDetalle = new IngresoDetalle(idIngreso, idAPCA, idACE, idTurno);
        try {
            if (ingresoDetalle != null && ingresoDetalleFacade != null) {
                IngresoDetalle resultado = ingresoDetalleFacade.remove(ingresoDetalle);
                if (resultado != null && resultado.getIngresoDetallePK() != null) {
                    return resultado.getIngresoDetallePK().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }
     */

    @DELETE
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idIngreso}/{idAPCA}/{idACE}/{idTurno}")
    public String delete(@PathParam(value = "idIngreso") Long idIngreso, @PathParam(value = "idAPCA") Long idAPCA, @PathParam(value = "idACE") Long idACE, @PathParam(value = "idTurno") Long idTurno) {
        String salida = null;
        IngresoDetalle ingresoDetalle = new IngresoDetalle(idIngreso, idAPCA, idACE, idTurno);
        List<IngresoDetalleDiagnostico> ingresoDetalleDiagnostico = null;
        List<IngresoDetalleExamen> ingresoDetalleExamen = null;

        try {
            if (ingresoDetalleFacade != null) {
                ingresoDetalleDiagnostico = ingresoDetalleFacade.findIngresoDetalleDiagnosticoByPK(idIngreso, idAPCA, idACE, idTurno);
                ingresoDetalleExamen = ingresoDetalleFacade.findIngresoDetalleExamenByPK(idIngreso, idAPCA, idACE, idTurno);

                for (IngresoDetalleDiagnostico ingresoDetalleDiagnosticoList : ingresoDetalleDiagnostico) {
                    ingresoDetalleDiagnosticoFacade.remove(ingresoDetalleDiagnosticoList);
                }

                for (IngresoDetalleExamen ingresoDetalleExamenList : ingresoDetalleExamen) {
                    ingresoDetalleExamenFacade.remove(ingresoDetalleExamenList);
                }

                IngresoDetalle resultado = ingresoDetalleFacade.remove(ingresoDetalle);
                if (resultado != null && resultado.getIngresoDetallePK() != null) {
                    return resultado.getIngresoDetallePK().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }

}
