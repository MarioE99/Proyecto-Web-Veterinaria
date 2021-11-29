package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Empleados;
import edu.ujmd.veterinaria.entidades.Mascotas;
import edu.ujmd.veterinaria.entidades.Vacunas;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Historialmedico.class)
public class Historialmedico_ { 

    public static volatile SingularAttribute<Historialmedico, Integer> codHistorial;
    public static volatile SingularAttribute<Historialmedico, Empleados> codEmpleados;
    public static volatile SingularAttribute<Historialmedico, String> fecha;
    public static volatile SingularAttribute<Historialmedico, String> motivo;
    public static volatile SingularAttribute<Historialmedico, Mascotas> codMascotas;
    public static volatile SingularAttribute<Historialmedico, Vacunas> codVacunas;

}