/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Ingreso;
import entidades.tpi.clinica.IngresoDetalle;
import entidades.tpi.clinica.IngresoDetalleDiagnostico;
import entidades.tpi.clinica.IngresoDetalleExamen;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author kari
 */
@Stateless
public class IngresoDetalleFacade extends AbstractFacade<IngresoDetalle> implements IngresoDetalleFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IngresoDetalleFacade() {
        super(IngresoDetalle.class);
    }

    public List<IngresoDetalle> findByIdIngreso(Long id) {
        List<IngresoDetalle> salida = null;
        try {
            if (em != null) {
                Query q = em.createNamedQuery("IngresoDetalle.findByIdIngreso", Ingreso.class);
                q.setParameter("idIngreso", id);

                salida = q.getResultList();
            }
        } catch (Exception e) {

        }
        return salida;
    }

    @Override
    public IngresoDetalle findByPKs(Long idIngreso, Long idAPCE, Long idACE, Long idTurno) {
        List<IngresoDetalle> respuesta = null;
        IngresoDetalle salida = null;
        try {
            if (em != null) {
                Query q = em.createNamedQuery("IngresoDetalle.findByPKs", IngresoDetalle.class);
                q.setParameter("idIngreso", idIngreso);
                q.setParameter("idAPCE", idAPCE);
                q.setParameter("idACE", idACE);
                q.setParameter("idTurno", idTurno);
                respuesta = (List<IngresoDetalle>) q.getResultList();
                salida = respuesta.get(0);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return salida;
    }

    ///ESTOS SON LOS DE DELETE
     @Override
    public List<IngresoDetalle> findByIdIngreso(long idIngreso, int desde, int tamanioPagina) {
        List<IngresoDetalle> resultado = null;
        
        try {
            if (getEntityManager() != null) {
                Query query = getEntityManager().createNamedQuery("IngresoDetalle.findByIdIngreso");
                query.setParameter("idIngreso", idIngreso);
                query.setFirstResult(desde);
                query.setMaxResults(tamanioPagina);
                resultado = query.getResultList();
            }
        } catch (Exception ex) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, ex.getMessage(), ex);
        } finally {
            if (resultado == null) {
                resultado = new ArrayList<>();
            }
        }
        
        return resultado;
    }

    @Override
    public List<IngresoDetalleDiagnostico> findIngresoDetalleDiagnosticoByPK(Long idIngreso, Long idAPCA, Long idACE, Long idTurno) {
        List<IngresoDetalleDiagnostico> salida=null;
        try {
            Query q = em.createNamedQuery("IngresoDetalle.findDiagnosticoByPK", Ingreso.class);
            q.setParameter("idIngreso",idIngreso);
            q.setParameter("idAPCA",idAPCA);
            q.setParameter("idACE",idACE);
            q.setParameter("idTurno",idTurno);
            
            salida = q.getResultList();
        } catch (Exception e) {
            
        }
        return salida;
    }

    @Override
    public List<IngresoDetalleExamen> findIngresoDetalleExamenByPK(Long idIngreso, Long idAPCA, Long idACE, Long idTurno) {
        List<IngresoDetalleExamen> salida=null;
        try {
            Query q = em.createNamedQuery("IngresoDetalle.findExamenByPK", Ingreso.class);
            q.setParameter("idIngreso",idIngreso);
            q.setParameter("idAPCA",idAPCA);
            q.setParameter("idACE",idACE);
            q.setParameter("idTurno",idTurno);
            
            salida = q.getResultList();
        } catch (Exception e) {
            
        }
        return salida;
    }
//
//    public IngresoDetalle createIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        IngresoDetalle entidad = crear(entity);
//
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public IngresoDetalle crearIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        try {
//            resultado = entity;
//            EntityManager em = getEntityManager();
//            if (resultado != null && em != null) {
//                em.persist(entity);
//            } else {
//                resultado = null;
//            }
//        } catch (Exception e) {
//        }
//        return resultado;
//    }
//
//    public IngresoDetalle editIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        IngresoDetalle entidad = editarIngDet(entity);
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public IngresoDetalle editarIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        try {
//            resultado = entity;
//            EntityManager em = getEntityManager();
//            if (resultado != null && em != null) {
//                em.merge(entity);
//            } else {
//                resultado = null;
//            }
//        } catch (Exception e) {
//        }
//        return resultado;
//    }
//
//    public IngresoDetalle removeIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        IngresoDetalle entidad = eliminarIngDet(entity);
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public IngresoDetalle eliminarIngDet(IngresoDetalle entity) {
//        IngresoDetalle resultado = null;
//        try {
//            resultado = entity;
//            EntityManager em = getEntityManager();
//            if (resultado != null && em != null) {
//                em.remove(em.merge(entity));
//            } else {
//                resultado = null;
//            }
//        } catch (Exception e) {
//        }
//        return resultado;
//    }
}
