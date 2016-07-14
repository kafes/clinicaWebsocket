/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.DiagnosticoFacadeLocal;
import entidades.tpi.clinica.Diagnostico;
import entidades.tpi.clinica.DiagnosticoFrecuenciaTurno;
import entidades.tpi.clinica.IngresoDetalleDiagnostico;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

/**
 *
 * @author kari
 */
@Named
@ViewScoped
public class diagnosticoController implements Serializable {

    private List<DiagnosticoFrecuenciaTurno> diagnosticosByTurnoList;
    private LazyDataModel<Diagnostico> model;
    @Inject
    private DiagnosticoFacadeLocal diagnosticoEJB;

    @PostConstruct
    public void llenarLista() {
        try {
            this.resultadoDiagnostico();
//            if (diagnosticoEJB != null && model == null) {
//                model = new LazyDataModel<Diagnostico>() {
//                    @Override
//                    public List<Diagnostico> load(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) {
//                        List salida = null;
//                        int[] range = new int[2];
//                        range[0] = first;
//                        range[1] = first + pageSize;
//
//                        try {
//                            if (diagnosticoEJB != null) {
//                                salida = diagnosticoEJB.findRange(range);
//                                this.setRowCount(diagnosticoEJB.count());
//                            }
//                        } catch (Exception e) {
//                        } finally {
//                            if (salida == null) {
//                                salida = new ArrayList();
//                            }
//                        }
//                        return salida;
//                    }
//                };
//            }
        } catch (Exception e) {
        }
    }

    public List<DiagnosticoFrecuenciaTurno> getDiagnosticosByTurnoList() {
        return diagnosticosByTurnoList;
    }

    public void setDiagnosticosByTurnoList(List<DiagnosticoFrecuenciaTurno> diagnosticosByTurnoList) {
        this.diagnosticosByTurnoList = diagnosticosByTurnoList;
    }

    public void resultadoDiagnostico() {
        this.diagnosticosByTurnoList = diagnosticoEJB.DiagnosticoByTurno();
    }

    public LazyDataModel<Diagnostico> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<Diagnostico> model) {
        this.model = model;
    }

}
