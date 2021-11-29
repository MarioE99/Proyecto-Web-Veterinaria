package edu.ujmd.veterinaria.entidades;

import edu.ujmd.veterinaria.entidades.Factura;
import edu.ujmd.veterinaria.entidades.Formapago;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-11-23T12:32:02")
@StaticMetamodel(Detallefactura.class)
public class Detallefactura_ { 

    public static volatile SingularAttribute<Detallefactura, Date> fechapago;
    public static volatile SingularAttribute<Detallefactura, Float> precio;
    public static volatile SingularAttribute<Detallefactura, Float> total;
    public static volatile SingularAttribute<Detallefactura, Float> iva;
    public static volatile SingularAttribute<Detallefactura, Integer> codDetalle;
    public static volatile SingularAttribute<Detallefactura, Float> subtotal;
    public static volatile SingularAttribute<Detallefactura, Formapago> codFormapago;
    public static volatile SingularAttribute<Detallefactura, Factura> codFactura;
    public static volatile SingularAttribute<Detallefactura, String> detalle;

}