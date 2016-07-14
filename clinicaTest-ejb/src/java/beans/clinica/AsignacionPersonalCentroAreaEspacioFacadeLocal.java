/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.AsignacionPersonalCentroAreaEspacio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kari
 */
@Local
public interface AsignacionPersonalCentroAreaEspacioFacadeLocal extends AbstractFacadeInterface<AsignacionPersonalCentroAreaEspacio> {

    AsignacionPersonalCentroAreaEspacio findByPKs(Long idAPCE, Long idACE, Long idTurno);
//
//    boolean create(AsignacionPersonalCentroAreaEspacio asignacionPersonalCentroAreaEspacio);
//
//    boolean edit(AsignacionPersonalCentroAreaEspacio asignacionPersonalCentroAreaEspacio);
//
//    boolean remove(AsignacionPersonalCentroAreaEspacio asignacionPersonalCentroAreaEspacio);
//
//    AsignacionPersonalCentroAreaEspacio find(Object id);
//
//    List<AsignacionPersonalCentroAreaEspacio> findAll();
//
//    List<AsignacionPersonalCentroAreaEspacio> findRange(int[] range);
//
//    int count();
//    
}
