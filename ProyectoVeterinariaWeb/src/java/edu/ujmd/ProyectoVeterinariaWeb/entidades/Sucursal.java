/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
@Table(name = "sucursal")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sucursal.findAll", query = "SELECT s FROM Sucursal s")
    , @NamedQuery(name = "Sucursal.findByCodSucursal", query = "SELECT s FROM Sucursal s WHERE s.codSucursal = :codSucursal")
    , @NamedQuery(name = "Sucursal.findByNomSucursal", query = "SELECT s FROM Sucursal s WHERE s.nomSucursal = :nomSucursal")
    , @NamedQuery(name = "Sucursal.findByDireccion", query = "SELECT s FROM Sucursal s WHERE s.direccion = :direccion")
    , @NamedQuery(name = "Sucursal.findByTelefono", query = "SELECT s FROM Sucursal s WHERE s.telefono = :telefono")
    , @NamedQuery(name = "Sucursal.findByDepartamento", query = "SELECT s FROM Sucursal s WHERE s.departamento = :departamento")
    , @NamedQuery(name = "Sucursal.findByMunicipio", query = "SELECT s FROM Sucursal s WHERE s.municipio = :municipio")
    , @NamedQuery(name = "Sucursal.findByEncargado", query = "SELECT s FROM Sucursal s WHERE s.encargado = :encargado")})
public class Sucursal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_sucursal")
    private Integer codSucursal;
    @Basic(optional = false)
    @Column(name = "Nom_Sucursal")
    private String nomSucursal;
    @Basic(optional = false)
    @Column(name = "Direccion")
    private String direccion;
    @Basic(optional = false)
    @Column(name = "Telefono")
    private String telefono;
    @Basic(optional = false)
    @Column(name = "Departamento")
    private String departamento;
    @Basic(optional = false)
    @Column(name = "Municipio")
    private String municipio;
    @Basic(optional = false)
    @Column(name = "Encargado")
    private String encargado;
    @OneToMany(mappedBy = "codSucursal")
    private List<Factura> facturaList;

    public Sucursal() {
    }

    public Sucursal(Integer codSucursal) {
        this.codSucursal = codSucursal;
    }

    public Sucursal(Integer codSucursal, String nomSucursal, String direccion, String telefono, String departamento, String municipio, String encargado) {
        this.codSucursal = codSucursal;
        this.nomSucursal = nomSucursal;
        this.direccion = direccion;
        this.telefono = telefono;
        this.departamento = departamento;
        this.municipio = municipio;
        this.encargado = encargado;
    }

    public Integer getCodSucursal() {
        return codSucursal;
    }

    public void setCodSucursal(Integer codSucursal) {
        this.codSucursal = codSucursal;
    }

    public String getNomSucursal() {
        return nomSucursal;
    }

    public void setNomSucursal(String nomSucursal) {
        this.nomSucursal = nomSucursal;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getEncargado() {
        return encargado;
    }

    public void setEncargado(String encargado) {
        this.encargado = encargado;
    }

    @XmlTransient
    public List<Factura> getFacturaList() {
        return facturaList;
    }

    public void setFacturaList(List<Factura> facturaList) {
        this.facturaList = facturaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codSucursal != null ? codSucursal.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sucursal)) {
            return false;
        }
        Sucursal other = (Sucursal) object;
        if ((this.codSucursal == null && other.codSucursal != null) || (this.codSucursal != null && !this.codSucursal.equals(other.codSucursal))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Sucursal[ codSucursal=" + codSucursal + " ]";
    }
    
}
