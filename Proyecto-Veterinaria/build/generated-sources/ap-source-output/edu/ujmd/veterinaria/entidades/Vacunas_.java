package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Historialmedico;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Vacunas.class)
public class Vacunas_ { 

    public static volatile SingularAttribute<Vacunas, Integer> codVacunas;
    public static volatile SingularAttribute<Vacunas, String> nomVacuna;
    public static volatile ListAttribute<Vacunas, Historialmedico> historialmedicoList;
    public static volatile SingularAttribute<Vacunas, String> detalle;

}