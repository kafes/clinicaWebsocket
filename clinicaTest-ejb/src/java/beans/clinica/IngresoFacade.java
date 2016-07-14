/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Ingreso;
import entidades.tpi.clinica.Paciente;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

/**
 *
 * @author kari
 */
@Stateless
public class IngresoFacade extends AbstractFacade<Ingreso> implements IngresoFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IngresoFacade() {
        super(Ingreso.class);
    }

   /* @Override
    public List<Paciente> findPacienteDistinctByFechasAndExclude(Date fechaDesde, Date fechaHasta, List<Date> fechaExclude) {
        try {
            if (em != null) {
                Query query = this.em.createNamedQuery("Ingreso.findPacienteDistinctByFechasAndExclude");
                query.setParameter("fechaDesde", fechaDesde, TemporalType.DATE);
                query.setParameter("fechaHasta", fechaHasta, TemporalType.DATE);
                query.setParameter("fechaExcepto", fechaExclude);
                return query.getResultList();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }*/
    
//    public Ingreso createIng(Ingreso entity) {
//        Ingreso resultado = null;
//        Ingreso entidad = crear(entity);
//
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public Ingreso crearIng(Ingreso entity) {
//        Ingreso resultado = null;
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
//    public Ingreso editIng(Ingreso entity) {
//        Ingreso resultado = null;
//        Ingreso entidad = editarIng(entity);
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public Ingreso editarIng(Ingreso entity) {
//        Ingreso resultado = null;
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
//    public Ingreso removeIng(Ingreso entity) {
//        Ingreso resultado = null;
//        Ingreso entidad = eliminarIng(entity);
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public Ingreso eliminarIng(Ingreso entity) {
//        Ingreso resultado = null;
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
