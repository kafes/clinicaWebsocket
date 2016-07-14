/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.Paciente;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kari
 */
@Local
public interface PacienteFacadeLocal extends AbstractFacadeInterface<Paciente>{

//    boolean create(Paciente paciente);
//
//    boolean edit(Paciente paciente);
//
//    boolean remove(Paciente paciente);
//
//    Paciente find(Object id);
//
//    List<Paciente> findAll();
//
//    List<Paciente> findRange(int[] range);
//
//    int count();
    List<Paciente> DiagnosticadosConAPeroNoConB(String A, String B);
}