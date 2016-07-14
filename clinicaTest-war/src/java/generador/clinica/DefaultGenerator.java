/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package generador.clinica;

import beans.clinica.AbstractFacadeInterface;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.primefaces.model.LazyDataModel;
import org.primefaces.model.SortOrder;

/**
 *
 * @author kari
 */
public abstract class DefaultGenerator<T> {

    public abstract AbstractFacadeInterface<T> getFacade();
    private LazyDataModel<T> model;
    private T registro;

    public LazyDataModel<T> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<T> model) {
        this.model = model;
    }

    public T getRegistro() {
        return registro;
    }

    public void setRegistro(T registro) {
        this.registro = registro;
    }

}
