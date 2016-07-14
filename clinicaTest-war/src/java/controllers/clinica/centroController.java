/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.AbstractFacadeInterface;
import beans.clinica.CentroFacadeLocal;
import entidades.tpi.clinica.Centro;
import generador.clinica.DefaultGenerator;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

/**
 *
 * @author kari
 */
@ManagedBean
@ViewScoped
public class centroController extends DefaultGenerator<Centro> implements Serializable {

    private List<Centro> centroList;
    @EJB
    CentroFacadeLocal centroEJB;
    private LazyDataModel<Centro> model;
    private Centro registro;
    @PostConstruct
    public void llenarLista() {
        try {
            if (centroEJB != null && model == null) {
                model = new LazyDataModel<Centro>() {
                    @Override
                    public List<Centro> load(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) {
                        List salida = null;
                        int[] range = new int[2];
                        range[0] = first;
                        range[1] = first + pageSize;

                        try {
                            if (centroEJB != null) {
                                salida = centroEJB.findRange(range);
                                this.setRowCount(centroEJB.count());
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
                    public Object getRowKey(Centro object) {
                        if (object != null) {
                            return object.getIdCentro();
                        }
                        return null;
                    }

                    @Override
                    public Centro getRowData(String rowKey) {
                        if (this.getWrappedData() != null) {
                            List<Centro> lista = (List<Centro>) this.getWrappedData();
                            if (!lista.isEmpty()) {
                                for (Centro ce : lista) {
                                    if (ce.getIdCentro().toString().compareToIgnoreCase(rowKey) == 0) {
                                        return ce;
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

    public List<Centro> getCentroList() {
        return centroList;
    }

    public void setCentroList(List<Centro> centroList) {
        this.centroList = centroList;
    }

    public LazyDataModel<Centro> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<Centro> model) {
        this.model = model;
    }

    public Centro getRegistro() {
        return registro;
    }

    public void setRegistro(Centro registro) {
        this.registro = registro;
    }
    public void onRowSelect(SelectEvent event){
//           Centro c = (Centro) event.getObject();
//        c = model.getRowData(c.getIdCentro().toString());
//        this.registro = c;
        this.registro=(Centro)event.getObject();
    }

    @Override
    public AbstractFacadeInterface<Centro> getFacade() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
