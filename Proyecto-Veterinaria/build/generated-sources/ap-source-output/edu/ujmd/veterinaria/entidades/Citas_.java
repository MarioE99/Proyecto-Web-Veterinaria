package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Clientes;
import edu.ujmd.veterinaria.entidades.Empleados;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Citas.class)
public class Citas_ { 

    public static volatile SingularAttribute<Citas, Empleados> codEmpleados;
    public static volatile SingularAttribute<Citas, Clientes> codClientes;
    public static volatile SingularAttribute<Citas, Integer> codCitas;
    public static volatile SingularAttribute<Citas, Date> fechaHora;

}