/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Diagnostico;
import entidades.tpi.clinica.DiagnosticoFrecuenciaTurno;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kari
 */
@Local
public interface DiagnosticoFacadeLocal extends AbstractFacadeInterface<Diagnostico>{

//    boolean create(Diagnostico diagnostico);
//
//    boolean edit(Diagnostico diagnostico);
//
//    boolean remove(Diagnostico diagnostico);
//
//    Diagnostico find(Object id);
//
//    List<Diagnostico> findAll();
//
//    List<Diagnostico> findRange(int[] range);
//
//    int count();

    List <DiagnosticoFrecuenciaTurno>DiagnosticoByTurno();
    List <Object[]> DiagnosticoByTurno2();

}
