/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.entidades;

import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author meev9
 */
@Entity
@Table(name = "usuarios")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuarios.findAll", query = "SELECT u FROM Usuarios u")
    , @NamedQuery(name = "Usuarios.findByCodUsuarios", query = "SELECT u FROM Usuarios u WHERE u.codUsuarios = :codUsuarios")
    , @NamedQuery(name = "Usuarios.findByUsuario", query = "SELECT u FROM Usuarios u WHERE u.usuario = :usuario")
    , @NamedQuery(name = "Usuarios.findByContrase\u00f1a", query = "SELECT u FROM Usuarios u WHERE u.contrase\u00f1a = :contrase\u00f1a")})
public class Usuarios implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_usuarios")
    private Integer codUsuarios;
    @Basic(optional = false)
    @Column(name = "usuario")
    private String usuario;
    @Basic(optional = false)
    @Column(name = "contrase\u00f1a")
    private String contraseña;
    @JoinColumn(name = "cod_rol", referencedColumnName = "cod_rol")
    @ManyToOne
    private Rol codRol;

    public Usuarios() {
    }

    public Usuarios(Integer codUsuarios) {
        this.codUsuarios = codUsuarios;
    }

    public Usuarios(Integer codUsuarios, String usuario, String contraseña) {
        this.codUsuarios = codUsuarios;
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    public Integer getCodUsuarios() {
        return codUsuarios;
    }

    public void setCodUsuarios(Integer codUsuarios) {
        this.codUsuarios = codUsuarios;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public Rol getCodRol() {
        return codRol;
    }

    public void setCodRol(Rol codRol) {
        this.codRol = codRol;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codUsuarios != null ? codUsuarios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.codUsuarios == null && other.codUsuarios != null) || (this.codUsuarios != null && !this.codUsuarios.equals(other.codUsuarios))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Usuarios[ codUsuarios=" + codUsuarios + " ]";
    }
    
}
