/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.PacienteFacadeLocal;
import entidades.tpi.clinica.Paciente;
import java.awt.event.ActionEvent;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;
import org.primefaces.event.SelectEvent;
import org.primefaces.model.LazyDataModel;

/**
 *
 * @author kari
 */
@Named
@ViewScoped
public class pacienteABcontroller implements Serializable {

    @Inject
    private PacienteFacadeLocal pacienteEJB;
    private List<Paciente> pacienteList;
    private LazyDataModel<Paciente> model;
    private Paciente registro;
    private String A,B;

    @PostConstruct
    public void llenarLista() {

    }
/*Si en la vista hubiera utilizado un action nada más no un actionListener entonces acá no recibiría ningún parámetro y funciona
    siempre*/
     public void buttonAction(ActionEvent actionEvent) {
        this.pacienteList=pacienteEJB.DiagnosticadosConAPeroNoConB(A, B);
    }
     
    public List<Paciente> getPacienteList() {
        return pacienteList;
    }

    public void setPacienteList(List<Paciente> pacienteList) {
        this.pacienteList = pacienteList;
    }

    public LazyDataModel<Paciente> getModel() {
        return model;
    }

    public void setModel(LazyDataModel<Paciente> model) {
        this.model = model;
    }

    public Paciente getRegistro() {
        return registro;
    }

    public void setRegistro(Paciente registro) {
        this.registro = registro;
    }

    public PacienteFacadeLocal getPacienteEJB() {
        return pacienteEJB;
    }

    public void setPacienteEJB(PacienteFacadeLocal pacienteEJB) {
        this.pacienteEJB = pacienteEJB;
    }

    public String getA() {
        return A;
    }

    public void setA(String A) {
        this.A = A;
    }

    public String getB() {
        return B;
    }

    public void setB(String B) {
        this.B = B;
    }

}
