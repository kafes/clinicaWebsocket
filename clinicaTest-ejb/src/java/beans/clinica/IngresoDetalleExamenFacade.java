/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.IngresoDetalleExamen;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author kari
 */
@Stateless
public class IngresoDetalleExamenFacade extends AbstractFacade<IngresoDetalleExamen> implements IngresoDetalleExamenFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IngresoDetalleExamenFacade() {
        super(IngresoDetalleExamen.class);
    }
    
}
