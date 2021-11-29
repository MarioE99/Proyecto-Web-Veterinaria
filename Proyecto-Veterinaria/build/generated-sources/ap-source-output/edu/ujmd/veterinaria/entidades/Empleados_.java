package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Citas;
import edu.ujmd.veterinaria.entidades.Historialmedico;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Empleados.class)
public class Empleados_ { 

    public static volatile SingularAttribute<Empleados, Integer> codEmpleados;
    public static volatile SingularAttribute<Empleados, String> apellido;
    public static volatile SingularAttribute<Empleados, String> dui;
    public static volatile ListAttribute<Empleados, Historialmedico> historialmedicoList;
    public static volatile SingularAttribute<Empleados, String> telefono;
    public static volatile SingularAttribute<Empleados, String> cargo;
    public static volatile SingularAttribute<Empleados, String> nombre;
    public static volatile ListAttribute<Empleados, Citas> citasList;

}