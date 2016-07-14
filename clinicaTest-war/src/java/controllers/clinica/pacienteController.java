/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.AbstractFacadeInterface;
import beans.clinica.PacienteFacadeLocal;
import entidades.tpi.clinica.Paciente;
import generador.clinica.DefaultGenerator;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

/**
 *
 * @author kari
 */
@Named
@ViewScoped
public class pacienteController extends DefaultGenerator<Paciente> implements Serializable {

    @Inject
    private PacienteFacadeLocal pacienteEJB;
    private List<Paciente> pacienteList;
    private LazyDataModel<Paciente> model;
    private Paciente registro;

    @PostConstruct
    public void llenarLista() {
        try {
            if (this.model == null && this.pacienteEJB != null) {
                this.model = new LazyDataModel<Paciente>() {
                    @Override
                    public List<Paciente> load(int first, int pageSize, String sortField,
                            SortOrder sortOrder, Map<String, Object> filters) {
                        List salida = null;
                        int[] range = new int[2];
                        range[0] = first;
                        range[1] = first + pageSize;

                        try {
                            if (pacienteEJB != null) {
                                salida = pacienteEJB.findRange(range);
                                this.setRowCount(pacienteEJB.count());
                            }
                        } catch (Exception e) {
                        } finally {
                            if (salida == null) {
                                salida = new ArrayList();
                            }
                        }
                        return salida;
                    }

                    @Override
                    public Object getRowKey(Paciente object) {
                        if (object != null) {
                            return object.getIdPaciente();
                        }
                        return null;
                    }

                    @Override
                    public Paciente getRowData(String rowKey) {
                        if (this.getWrappedData() != null) {
                            List<Paciente> lista = (List<Paciente>) this.getWrappedData();
                            if (!lista.isEmpty()) {
                                for (Paciente pac : lista) {
                                    if (pac.getIdPaciente().toString().compareToIgnoreCase(rowKey) == 0) {
                                        return pac;
                                    }
                                }
                            }
                        }
                        return null;
                    }
                };
            }
        } catch (Exception e) {
        }
    }

    public LazyDataModel<Paciente> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<Paciente> model) {
        this.model = model;
    }

    public PacienteFacadeLocal getPacienteEJB() {
        return pacienteEJB;
    }

    public void setPacienteEJB(PacienteFacadeLocal pacienteEJB) {
        this.pacienteEJB = pacienteEJB;
    }

    public List<Paciente> getPacienteList() {
        return pacienteList;
    }

    public void setPacienteList(List<Paciente> pacienteList) {
        this.pacienteList = pacienteList;
    }
    
    public Paciente getRegistro() {
        return registro;
    }

    public void setRegistro(Paciente registro) {
        this.registro = registro;
    }

    public void onRowSelect(SelectEvent event) {
        Paciente pa = (Paciente) event.getObject();
        pa = model.getRowData(pa.getIdPaciente().toString());
        this.registro = pa;
    }

    @Override
    public AbstractFacadeInterface<Paciente> getFacade() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
