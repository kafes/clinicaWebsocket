/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.TipoCentro;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author kari
 */
@Stateless
public class TipoCentroFacade extends AbstractFacade<TipoCentro> implements TipoCentroFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TipoCentroFacade() {
        super(TipoCentro.class);
    }

//    public TipoCentro createTC(TipoCentro entity) {
//        TipoCentro resultado = null;
//        TipoCentro entidad = crear(entity);
//
//        if (entidad != null) {
//            resultado = entidad;
//        }
//        return resultado;
//    }
//
//    public TipoCentro crear(TipoCentro entity) {
//        TipoCentro resultado = null;
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
//    public TipoCentro editTC(TipoCentro entity) {
//        TipoCentro resultado = null;
//        TipoCentro entidad = editar(entity);
//        if (entidad != null) {
//            resultado =entidad;
//        }
//        return resultado;
//    }
//
//    public TipoCentro editar(TipoCentro entity) {
//        TipoCentro resultado = null;
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
}
