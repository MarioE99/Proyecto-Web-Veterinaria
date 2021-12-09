/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author meev9
 */
@Entity
@Table(name = "detallefactura")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Detallefactura.findAll", query = "SELECT d FROM Detallefactura d")
    , @NamedQuery(name = "Detallefactura.findByCodDetalle", query = "SELECT d FROM Detallefactura d WHERE d.codDetalle = :codDetalle")
    , @NamedQuery(name = "Detallefactura.findByPrecio", query = "SELECT d FROM Detallefactura d WHERE d.precio = :precio")
    , @NamedQuery(name = "Detallefactura.findByFechapago", query = "SELECT d FROM Detallefactura d WHERE d.fechapago = :fechapago")
    , @NamedQuery(name = "Detallefactura.findByDetalle", query = "SELECT d FROM Detallefactura d WHERE d.detalle = :detalle")})
public class Detallefactura implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_detalle")
    private Integer codDetalle;
    @Basic(optional = false)
    @Column(name = "precio")
    private float precio;
    @Basic(optional = false)
    @Column(name = "fechapago")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechapago;
    @Basic(optional = false)
    @Column(name = "detalle")
    private String detalle;
    @JoinColumn(name = "cod_factura", referencedColumnName = "cod_factura")
    @ManyToOne(optional = false)
    private Factura codFactura;
    @JoinColumn(name = "cod_formapago", referencedColumnName = "cod_formapago")
    @ManyToOne(optional = false)
    private Formapago codFormapago;

    public Detallefactura() {
    }

    public Detallefactura(Integer codDetalle) {
        this.codDetalle = codDetalle;
    }

    public Detallefactura(Integer codDetalle, float precio, Date fechapago, String detalle) {
        this.codDetalle = codDetalle;
        this.precio = precio;
        this.fechapago = fechapago;
        this.detalle = detalle;
    }

    public Integer getCodDetalle() {
        return codDetalle;
    }

    public void setCodDetalle(Integer codDetalle) {
        this.codDetalle = codDetalle;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Date getFechapago() {
        return fechapago;
    }

    public void setFechapago(Date fechapago) {
        this.fechapago = fechapago;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public Factura getCodFactura() {
        return codFactura;
    }

    public void setCodFactura(Factura codFactura) {
        this.codFactura = codFactura;
    }

    public Formapago getCodFormapago() {
        return codFormapago;
    }

    public void setCodFormapago(Formapago codFormapago) {
        this.codFormapago = codFormapago;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codDetalle != null ? codDetalle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Detallefactura)) {
            return false;
        }
        Detallefactura other = (Detallefactura) object;
        if ((this.codDetalle == null && other.codDetalle != null) || (this.codDetalle != null && !this.codDetalle.equals(other.codDetalle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Detallefactura[ codDetalle=" + codDetalle + " ]";
    }
    
}
