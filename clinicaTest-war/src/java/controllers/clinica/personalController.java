/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.PersonalFacadeLocal;
import entidades.tpi.clinica.Centro;
import entidades.tpi.clinica.Personal;
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
public class personalController implements Serializable {

    private List<Personal> personalList;
    @Inject
    private PersonalFacadeLocal personalEJB;
    private LazyDataModel<Personal> model;
    private Centro registro;

    @PostConstruct
    public void llenarLista() {
        try {
            if (this.model == null && personalEJB != null) {
                model = new LazyDataModel<Personal>() {
                    @Override
                    public List<Personal> load(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) {
                        List salida = null;
                        int range[] = new int[2];
                        range[0] = first;
                        range[1] = first + pageSize;
                        try {
                            if (personalEJB != null) {
                                salida = personalEJB.findRange(range);
                                this.setRowCount(personalEJB.count());
                            }
                        } catch (Exception e) {
                        } finally {
                            if (salida == null) {
                                salida = new ArrayList();
                            }
                        }
                        return salida;
                    }
                };
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    public List<Personal> getPersonalList() {
        return personalList;
    }

    public void setPersonalList(List<Personal> personalList) {
        this.personalList = personalList;
    }

    public LazyDataModel<Personal> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<Personal> model) {
        this.model = model;
    }

    public Centro getRegistro() {
        return registro;
    }

    public void setRegistro(Centro registro) {
        this.registro = registro;
    }
    
}
