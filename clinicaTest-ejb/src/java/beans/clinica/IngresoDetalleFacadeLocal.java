/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.clinica;

import entidades.tpi.clinica.IngresoDetalle;
import entidades.tpi.clinica.IngresoDetalleDiagnostico;
import entidades.tpi.clinica.IngresoDetalleExamen;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author kari
 */
@Local
public interface IngresoDetalleFacadeLocal extends AbstractFacadeInterface<IngresoDetalle> {

    List<IngresoDetalle> findByIdIngreso(Long id);

    IngresoDetalle findByPKs(Long idIngreso, Long idAPCE, Long idACE, Long idTurno);

    List<IngresoDetalle> findByIdIngreso(long idIngreso, int desde, int tamanioPagina);

    List<IngresoDetalleDiagnostico> findIngresoDetalleDiagnosticoByPK(Long idIngreso, Long idAPCA, Long idACE, Long idTurno);

    List<IngresoDetalleExamen> findIngresoDetalleExamenByPK(Long idIngreso, Long idAPCA, Long idACE, Long idTurno);
//    IngresoDetalle createIngDet(IngresoDetalle entity);
//
//    IngresoDetalle editIngDet(IngresoDetalle entity);
//
//    IngresoDetalle removeIngDet(IngresoDetalle entity);
//    /*boolean create(IngresoDetalle ingresoDetalle);
//
//    boolean edit(IngresoDetalle ingresoDetalle);
//
//    boolean remove(IngresoDetalle ingresoDetalle);
//
//    IngresoDetalle find(Object id);
//
//    List<IngresoDetalle> findAll();
//
//    List<IngresoDetalle> findRange(int[] range);
//
//    int count();*/
}
