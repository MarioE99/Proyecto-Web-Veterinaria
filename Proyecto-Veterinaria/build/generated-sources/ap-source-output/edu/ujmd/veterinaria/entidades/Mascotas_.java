package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Clientes;
import edu.ujmd.veterinaria.entidades.Historialmedico;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Mascotas.class)
public class Mascotas_ { 

    public static volatile SingularAttribute<Mascotas, String> estadoVacuna;
    public static volatile SingularAttribute<Mascotas, Integer> codMascotas;
    public static volatile SingularAttribute<Mascotas, String> raza;
    public static volatile SingularAttribute<Mascotas, String> peso;
    public static volatile SingularAttribute<Mascotas, Clientes> codClientes;
    public static volatile SingularAttribute<Mascotas, String> genero;
    public static volatile ListAttribute<Mascotas, Historialmedico> historialmedicoList;
    public static volatile SingularAttribute<Mascotas, String> nombre;
    public static volatile SingularAttribute<Mascotas, String> edad;

}