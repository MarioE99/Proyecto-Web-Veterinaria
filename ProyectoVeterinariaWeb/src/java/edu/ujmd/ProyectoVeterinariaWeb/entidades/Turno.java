/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ujmd.ProyectoVeterinariaWeb.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author meev9
 */
@Entity
@Table(name = "turno")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Turno.findAll", query = "SELECT t FROM Turno t")
    , @NamedQuery(name = "Turno.findByCodTurno", query = "SELECT t FROM Turno t WHERE t.codTurno = :codTurno")
    , @NamedQuery(name = "Turno.findByHorario", query = "SELECT t FROM Turno t WHERE t.horario = :horario")
    , @NamedQuery(name = "Turno.findByHorarioEntrada", query = "SELECT t FROM Turno t WHERE t.horarioEntrada = :horarioEntrada")
    , @NamedQuery(name = "Turno.findByHorarioSalida", query = "SELECT t FROM Turno t WHERE t.horarioSalida = :horarioSalida")})
public class Turno implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "cod_turno")
    private Integer codTurno;
    @Basic(optional = false)
    @Column(name = "Horario")
    private String horario;
    @Basic(optional = false)
    @Column(name = "Horario_Entrada")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horarioEntrada;
    @Basic(optional = false)
    @Column(name = "Horario_Salida")
    @Temporal(TemporalType.TIMESTAMP)
    private Date horarioSalida;
    @OneToMany(mappedBy = "codTurno")
    private List<Empleados> empleadosList;

    public Turno() {
    }

    public Turno(Integer codTurno) {
        this.codTurno = codTurno;
    }

    public Turno(Integer codTurno, String horario, Date horarioEntrada, Date horarioSalida) {
        this.codTurno = codTurno;
        this.horario = horario;
        this.horarioEntrada = horarioEntrada;
        this.horarioSalida = horarioSalida;
    }

    public Integer getCodTurno() {
        return codTurno;
    }

    public void setCodTurno(Integer codTurno) {
        this.codTurno = codTurno;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Date getHorarioEntrada() {
        return horarioEntrada;
    }

    public void setHorarioEntrada(Date horarioEntrada) {
        this.horarioEntrada = horarioEntrada;
    }

    public Date getHorarioSalida() {
        return horarioSalida;
    }

    public void setHorarioSalida(Date horarioSalida) {
        this.horarioSalida = horarioSalida;
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
        hash += (codTurno != null ? codTurno.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Turno)) {
            return false;
        }
        Turno other = (Turno) object;
        if ((this.codTurno == null && other.codTurno != null) || (this.codTurno != null && !this.codTurno.equals(other.codTurno))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Turno[ codTurno=" + codTurno + " ]";
    }
    
}
