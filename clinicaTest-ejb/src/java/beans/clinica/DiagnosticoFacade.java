/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Diagnostico;
import entidades.tpi.clinica.DiagnosticoFrecuenciaTurno;
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
public class DiagnosticoFacade extends AbstractFacade<Diagnostico> implements DiagnosticoFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiagnosticoFacade() {
        super(Diagnostico.class);
    }

    public List<DiagnosticoFrecuenciaTurno> DiagnosticoByTurno() {
        try {
            if (em != null) {
                Query query = this.em.createNamedQuery("Diagnostico.findFrecuenciaByTurno");
                return query.getResultList();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }

    public List<Object[]> DiagnosticoByTurno2() {
        try {
            if (em != null) {
                Query query = this.em.createNamedQuery("Diagnostico.findFrecuenciaByTurno2");
                return query.getResultList();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }
}
