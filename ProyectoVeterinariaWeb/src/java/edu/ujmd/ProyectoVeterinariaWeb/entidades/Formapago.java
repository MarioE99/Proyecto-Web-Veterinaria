/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author meev9
 */
@Entity
@Table(name = "formapago")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Formapago.findAll", query = "SELECT f FROM Formapago f")
    , @NamedQuery(name = "Formapago.findByCodFormapago", query = "SELECT f FROM Formapago f WHERE f.codFormapago = :codFormapago")
    , @NamedQuery(name = "Formapago.findByTipoPago", query = "SELECT f FROM Formapago f WHERE f.tipoPago = :tipoPago")})
public class Formapago implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_formapago")
    private Integer codFormapago;
    @Basic(optional = false)
    @Column(name = "Tipo_Pago")
    private String tipoPago;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codFormapago")
    private List<Detallefactura> detallefacturaList;

    public Formapago() {
    }

    public Formapago(Integer codFormapago) {
        this.codFormapago = codFormapago;
    }

    public Formapago(Integer codFormapago, String tipoPago) {
        this.codFormapago = codFormapago;
        this.tipoPago = tipoPago;
    }

    public Integer getCodFormapago() {
        return codFormapago;
    }

    public void setCodFormapago(Integer codFormapago) {
        this.codFormapago = codFormapago;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    @XmlTransient
    public List<Detallefactura> getDetallefacturaList() {
        return detallefacturaList;
    }

    public void setDetallefacturaList(List<Detallefactura> detallefacturaList) {
        this.detallefacturaList = detallefacturaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codFormapago != null ? codFormapago.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Formapago)) {
            return false;
        }
        Formapago other = (Formapago) object;
        if ((this.codFormapago == null && other.codFormapago != null) || (this.codFormapago != null && !this.codFormapago.equals(other.codFormapago))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Formapago[ codFormapago=" + codFormapago + " ]";
    }
    
}
