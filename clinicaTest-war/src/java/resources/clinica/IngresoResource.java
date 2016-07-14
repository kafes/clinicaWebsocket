package resources.clinica;

import beans.clinica.IngresoDetalleDiagnosticoFacadeLocal;
import beans.clinica.IngresoDetalleExamenFacadeLocal;
import beans.clinica.IngresoDetalleFacadeLocal;
import beans.clinica.IngresoFacadeLocal;
import entidades.tpi.clinica.Ingreso;
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
@Path("Ingreso")
public class IngresoResource {

    @EJB
    IngresoFacadeLocal ingresoFacade;
    @EJB
    IngresoDetalleFacadeLocal ingresoDetalleFacade;
    @EJB
    IngresoDetalleDiagnosticoFacadeLocal ingresoDetalleDiagnosticoFacade;
    @EJB
    IngresoDetalleExamenFacadeLocal ingresoDetalleExamenFacade;

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<Ingreso> findAll() {
        List<Ingreso> salida = null;

        try {
            if (ingresoFacade != null) {
                salida = ingresoFacade.findAll();
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (salida == null) {
                salida = new ArrayList<>();
            }
        }
        return salida;
    }

    @GET
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idIngreso}")
    public Ingreso findById(@PathParam(value = "idIngreso") Long idIngreso) {
        Ingreso salida = null;

        try {
            if (ingresoFacade != null) {
                salida = ingresoFacade.find(idIngreso);
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        } finally {
            if (salida == null) {
                salida = new Ingreso();
            }
        }
        return salida;
    }

    @POST
    @Produces({MediaType.APPLICATION_JSON})
    public String create(Ingreso ingreso) {
        String salida = null;

        try {
            if (ingreso != null && ingresoFacade != null) {
                Ingreso resultado = ingresoFacade.create(ingreso);
                if (resultado != null && resultado.getIdIngreso() != null) {
                    return resultado.getIdIngreso().toString();
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
    @Path("/{idIngreso}")
    public String delete(@PathParam(value = "idIngreso") Long idIngreso) {
        String salida = null;
        Ingreso ingreso = new Ingreso(idIngreso);
        
        try {
            if (ingreso != null && ingresoFacade != null) {
                Ingreso resultado = ingresoFacade.remove(ingreso);
                if (resultado != null && resultado.getIdIngreso() != null) {
                    return resultado.getIdIngreso().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }        
        return salida;
    }*/
    @PUT
    @Produces({MediaType.APPLICATION_JSON})
    public String update(Ingreso ingreso) {
        String salida = null;

        try {
            if (ingreso != null && ingresoFacade != null) {
                Ingreso resultado = ingresoFacade.edit(ingreso);
                if (resultado != null && resultado.getIdIngreso() != null) {
                    return resultado.getIdIngreso().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }

    @DELETE
    @Produces({MediaType.APPLICATION_JSON})
    @Path("/{idIngreso}")
    public String delete(@PathParam(value = "idIngreso") Long idIngreso) {
        String salida = null;
        Ingreso ingreso = new Ingreso(idIngreso);
        List<IngresoDetalle> ingresoDetalle = null;
        List<IngresoDetalleDiagnostico> ingresoDetalleDiagnostico = null;
        List<IngresoDetalleExamen> ingresoDetalleExamen = null;

        try {
            if (ingreso != null && ingresoFacade != null) {
                ingresoDetalle = ingresoDetalleFacade.findByIdIngreso(idIngreso, 0, 1000000);

                for (IngresoDetalle ingresoDetalleList : ingresoDetalle) {
                    ingresoDetalleDiagnostico = ingresoDetalleFacade.findIngresoDetalleDiagnosticoByPK(ingresoDetalleList.getIngresoDetallePK().getIdIngreso(), ingresoDetalleList.getIngresoDetallePK().getIdAsignacionPersonalCentroArea(), ingresoDetalleList.getIngresoDetallePK().getIdAreaCentroEspacio(), ingresoDetalleList.getIngresoDetallePK().getIdTurno());
                    ingresoDetalleExamen = ingresoDetalleFacade.findIngresoDetalleExamenByPK(ingresoDetalleList.getIngresoDetallePK().getIdIngreso(), ingresoDetalleList.getIngresoDetallePK().getIdAsignacionPersonalCentroArea(), ingresoDetalleList.getIngresoDetallePK().getIdAreaCentroEspacio(), ingresoDetalleList.getIngresoDetallePK().getIdTurno());

                    for (IngresoDetalleDiagnostico ingresoDetalleDiagnosticoList : ingresoDetalleDiagnostico) {
                        ingresoDetalleDiagnosticoFacade.remove(ingresoDetalleDiagnosticoList);
                    }

                    for (IngresoDetalleExamen ingresoDetalleExamenList : ingresoDetalleExamen) {
                        ingresoDetalleExamenFacade.remove(ingresoDetalleExamenList);
                    }
                    ingresoDetalleFacade.remove(ingresoDetalleList);
                }
                Ingreso resultado = ingresoFacade.remove(ingreso);
                if (resultado != null && resultado.getIdIngreso() != null) {
                    return resultado.getIdIngreso().toString();
                }
            }
        } catch (Exception e) {
            Logger.getLogger(IngresoResource.class.getName()).log(Level.SEVERE, null, e);
        }
        return salida;
    }
}
