/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.IngresoDetalleDiagnostico;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author kari
 */
@Stateless
public class IngresoDetalleDiagnosticoFacade extends AbstractFacade<IngresoDetalleDiagnostico> implements IngresoDetalleDiagnosticoFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public IngresoDetalleDiagnosticoFacade() {
        super(IngresoDetalleDiagnostico.class);
    }
    
}
