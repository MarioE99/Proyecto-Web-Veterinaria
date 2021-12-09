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
@Table(name = "cargo_empleado")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CargoEmpleado.findAll", query = "SELECT c FROM CargoEmpleado c")
    , @NamedQuery(name = "CargoEmpleado.findByCodCargo", query = "SELECT c FROM CargoEmpleado c WHERE c.codCargo = :codCargo")
    , @NamedQuery(name = "CargoEmpleado.findByCargoEmpleado", query = "SELECT c FROM CargoEmpleado c WHERE c.cargoEmpleado = :cargoEmpleado")})
public class CargoEmpleado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_cargo")
    private Integer codCargo;
    @Basic(optional = false)
    @Column(name = "Cargo_Empleado")
    private String cargoEmpleado;
    @OneToMany(mappedBy = "codCargo")
    private List<Empleados> empleadosList;

    public CargoEmpleado() {
    }

    public CargoEmpleado(Integer codCargo) {
        this.codCargo = codCargo;
    }

    public CargoEmpleado(Integer codCargo, String cargoEmpleado) {
        this.codCargo = codCargo;
        this.cargoEmpleado = cargoEmpleado;
    }

    public Integer getCodCargo() {
        return codCargo;
    }

    public void setCodCargo(Integer codCargo) {
        this.codCargo = codCargo;
    }

    public String getCargoEmpleado() {
        return cargoEmpleado;
    }

    public void setCargoEmpleado(String cargoEmpleado) {
        this.cargoEmpleado = cargoEmpleado;
    }

    @XmlTransient
    public List<Empleados> getEmpleadosList() {
        return empleadosList;
    }

    public void setEmpleadosList(List<Empleados> empleadosList) {
        this.empleadosList = empleadosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codCargo != null ? codCargo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CargoEmpleado)) {
            return false;
        }
        CargoEmpleado other = (CargoEmpleado) object;
        if ((this.codCargo == null && other.codCargo != null) || (this.codCargo != null && !this.codCargo.equals(other.codCargo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.CargoEmpleado[ codCargo=" + codCargo + " ]";
    }
    
}
