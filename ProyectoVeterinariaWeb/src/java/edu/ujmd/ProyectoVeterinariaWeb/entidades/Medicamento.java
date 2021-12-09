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
@Table(name = "medicamento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicamento.findAll", query = "SELECT m FROM Medicamento m")
    , @NamedQuery(name = "Medicamento.findByCodMedicamento", query = "SELECT m FROM Medicamento m WHERE m.codMedicamento = :codMedicamento")
    , @NamedQuery(name = "Medicamento.findByNomComercial", query = "SELECT m FROM Medicamento m WHERE m.nomComercial = :nomComercial")
    , @NamedQuery(name = "Medicamento.findByNomGenerico", query = "SELECT m FROM Medicamento m WHERE m.nomGenerico = :nomGenerico")
    , @NamedQuery(name = "Medicamento.findByDescripcion", query = "SELECT m FROM Medicamento m WHERE m.descripcion = :descripcion")
    , @NamedQuery(name = "Medicamento.findByReaccionesAdversas", query = "SELECT m FROM Medicamento m WHERE m.reaccionesAdversas = :reaccionesAdversas")
    , @NamedQuery(name = "Medicamento.findByDosis", query = "SELECT m FROM Medicamento m WHERE m.dosis = :dosis")})
public class Medicamento implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cod_medicamento")
    private Integer codMedicamento;
    @Basic(optional = false)
    @Column(name = "Nom_Comercial")
    private String nomComercial;
    @Basic(optional = false)
    @Column(name = "Nom_Generico")
    private String nomGenerico;
    @Basic(optional = false)
    @Column(name = "Descripcion")
    private String descripcion;
    @Basic(optional = false)
    @Column(name = "Reacciones_Adversas")
    private String reaccionesAdversas;
    @Basic(optional = false)
    @Column(name = "Dosis")
    private String dosis;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codMedicamento")
    private List<Historialmedico> historialmedicoList;

    public Medicamento() {
    }

    public Medicamento(Integer codMedicamento) {
        this.codMedicamento = codMedicamento;
    }

    public Medicamento(Integer codMedicamento, String nomComercial, String nomGenerico, String descripcion, String reaccionesAdversas, String dosis) {
        this.codMedicamento = codMedicamento;
        this.nomComercial = nomComercial;
        this.nomGenerico = nomGenerico;
        this.descripcion = descripcion;
        this.reaccionesAdversas = reaccionesAdversas;
        this.dosis = dosis;
    }

    public Integer getCodMedicamento() {
        return codMedicamento;
    }

    public void setCodMedicamento(Integer codMedicamento) {
        this.codMedicamento = codMedicamento;
    }

    public String getNomComercial() {
        return nomComercial;
    }

    public void setNomComercial(String nomComercial) {
        this.nomComercial = nomComercial;
    }

    public String getNomGenerico() {
        return nomGenerico;
    }

    public void setNomGenerico(String nomGenerico) {
        this.nomGenerico = nomGenerico;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getReaccionesAdversas() {
        return reaccionesAdversas;
    }

    public void setReaccionesAdversas(String reaccionesAdversas) {
        this.reaccionesAdversas = reaccionesAdversas;
    }

    public String getDosis() {
        return dosis;
    }

    public void setDosis(String dosis) {
        this.dosis = dosis;
    }

    @XmlTransient
    public List<Historialmedico> getHistorialmedicoList() {
        return historialmedicoList;
    }

    public void setHistorialmedicoList(List<Historialmedico> historialmedicoList) {
        this.historialmedicoList = historialmedicoList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codMedicamento != null ? codMedicamento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicamento)) {
            return false;
        }
        Medicamento other = (Medicamento) object;
        if ((this.codMedicamento == null && other.codMedicamento != null) || (this.codMedicamento != null && !this.codMedicamento.equals(other.codMedicamento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.ujmd.ProyectoVeterinariaWeb.entidades.Medicamento[ codMedicamento=" + codMedicamento + " ]";
    }
    
}
