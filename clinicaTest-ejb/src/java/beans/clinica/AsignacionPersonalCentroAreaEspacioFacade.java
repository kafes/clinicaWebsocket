/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.AsignacionPersonalCentroAreaEspacio;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author kari
 */
@Stateless
public class AsignacionPersonalCentroAreaEspacioFacade extends AbstractFacade<AsignacionPersonalCentroAreaEspacio> implements AsignacionPersonalCentroAreaEspacioFacadeLocal {

    @PersistenceContext(unitName = "clinicaTest-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AsignacionPersonalCentroAreaEspacioFacade() {
        super(AsignacionPersonalCentroAreaEspacio.class);
    }

    public AsignacionPersonalCentroAreaEspacio findByPKs(Long idAPCE, Long idACE, Long idTurno) {
        List<AsignacionPersonalCentroAreaEspacio> respuesta = null;
        AsignacionPersonalCentroAreaEspacio salida = null;
        try {
            if (em != null) {
                Query q = em.createNamedQuery("AsignacionPersonalCentroAreaEspacio.findByPKs", AsignacionPersonalCentroAreaEspacio.class);
                q.setParameter("idAPCE", idAPCE);
                q.setParameter("idACE", idACE);
                q.setParameter("idTurno", idTurno);
                respuesta = (List<AsignacionPersonalCentroAreaEspacio>) q.getResultList();
                salida = respuesta.get(0);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return salida;
    }

}
