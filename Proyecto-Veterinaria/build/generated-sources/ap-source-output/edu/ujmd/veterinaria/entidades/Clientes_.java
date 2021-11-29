package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Citas;
import edu.ujmd.veterinaria.entidades.Factura;
import edu.ujmd.veterinaria.entidades.Mascotas;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Clientes.class)
public class Clientes_ { 

    public static volatile SingularAttribute<Clientes, Integer> codClientes;
    public static volatile SingularAttribute<Clientes, String> apellido;
    public static volatile SingularAttribute<Clientes, String> direccion;
    public static volatile ListAttribute<Clientes, Factura> facturaList;
    public static volatile ListAttribute<Clientes, Mascotas> mascotasList;
    public static volatile SingularAttribute<Clientes, String> telefono;
    public static volatile SingularAttribute<Clientes, String> nombre;
    public static volatile ListAttribute<Clientes, Citas> citasList;

}