/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.clinica;

import beans.clinica.IngresoFacadeLocal;
import entidades.tpi.clinica.Paciente;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.event.ActionEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author gual
 */
@Named
@ViewScoped
public class pacienteExcludeController implements Serializable {

    @Inject
    private IngresoFacadeLocal ingresoEJB;
    private List<Date> fechasExclude;
    private List<Paciente> pacienteList;
    private Date fechaHasta, fechaDesde, fecha_exclude;
    private String fecha;

    public pacienteExcludeController() {
        this.fechasExclude = new ArrayList<Date>();
    }

    public void onDateSelect(int x) {
        fecha = "";
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        switch (x) {
            case 1:
                fecha = format.format(fecha_exclude);
                try {
                    fecha_exclude = format.parse(fecha);
                } catch (Exception e) {
                }
                break;
            case 2:
                fecha = format.format(fechaDesde);
                try {
                    fechaDesde = format.parse(fecha);
                } catch (Exception e) {
                }
                break;
            case 3:
                fecha = format.format(fechaHasta);
                try {
                    fechaHasta = format.parse(fecha);
                } catch (Exception e) {
                }
                break;
        };
    }

    public void buttonActionAgregar(ActionEvent actionEvent) {
        fechasExclude.add(fecha_exclude);
    }

    public void buttonActionEnviar(ActionEvent actionEvent) {
//        pacienteList=ingresoEJB.findPacienteDistinctByFechasAndExclude(fechaDesde, fechaHasta, fechasExclude);
    }

    public IngresoFacadeLocal getIngresoEJB() {
        return ingresoEJB;
    }

    public void setIngresoEJB(IngresoFacadeLocal ingresoEJB) {
        this.ingresoEJB = ingresoEJB;
    }

    public List<Date> getFechasExclude() {
        return fechasExclude;
    }

    public void setFechasExclude(List<Date> fechasExclude) {
        this.fechasExclude = fechasExclude;
    }

    public Date getFechaHasta() {
        return fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFecha_exclude() {
        return fecha_exclude;
    }

    public void setFecha_exclude(Date fecha_exclude) {
        this.fecha_exclude = fecha_exclude;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Paciente> getPacienteList() {
        return pacienteList;
    }

    public void setPacienteList(List<Paciente> pacienteList) {
        this.pacienteList = pacienteList;
    }
}
