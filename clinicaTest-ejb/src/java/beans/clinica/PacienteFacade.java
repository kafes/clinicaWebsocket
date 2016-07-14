/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Paciente;
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
public class PacienteFacade extends AbstractFacade<Paciente> implements PacienteFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PacienteFacade() {
        super(Paciente.class);
    }

    @Override
    public List<Paciente> DiagnosticadosConAPeroNoConB(String A, String B) {
        try {
            if (em != null) {
                Query query = this.em.createNamedQuery("Paciente.DiagnosticadosConAPeroNoConB");
                query.setParameter("nombreDiagnosticoA", A);
                query.setParameter("nombreDiagnosticoB", B);
                return query.getResultList();
            }
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, e.getMessage(), e);
        }
        return null;
    }
}

