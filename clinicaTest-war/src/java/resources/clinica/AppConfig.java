/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources.clinica;

import java.util.Set;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import org.jboss.weld.util.collections.ArraySet;

/**
 *
 * @author kari
 */
@ApplicationPath("ws")
public class AppConfig extends Application {

    public Set<Class<?>> getClasses() {
        return getServicios();
    }

    public Set getServicios() {
        Set<Class> salida = new ArraySet<>();
        salida.add(TipoCentroResource.class);
        salida.add(IngresoResource.class);
        salida.add(IngresoDetalleResource.class);
        salida.add(PacienteResource.class);
        salida.add(TipoIngresoResource.class);
        salida.add(IngresoDetalleExamenResource.class);
        salida.add(AsignacionPersonalCentroAreaEspacioResource.class);
        return salida;
    }
}
