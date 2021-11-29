package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Clientes;
import edu.ujmd.veterinaria.entidades.Detallefactura;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Factura.class)
public class Factura_ { 

    public static volatile SingularAttribute<Factura, Date> fecha;
    public static volatile SingularAttribute<Factura, Clientes> codClientes;
    public static volatile ListAttribute<Factura, Detallefactura> detallefacturaList;
    public static volatile SingularAttribute<Factura, Integer> numFactura;
    public static volatile SingularAttribute<Factura, Integer> codFactura;

}