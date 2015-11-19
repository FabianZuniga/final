/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Fabian
 */
@Entity
@Table(name = "arbritro")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Arbritro.findAll", query = "SELECT a FROM Arbritro a"),
    @NamedQuery(name = "Arbritro.findByIdarbritro", query = "SELECT a FROM Arbritro a WHERE a.idarbritro = :idarbritro"),
    @NamedQuery(name = "Arbritro.findByNombre", query = "SELECT a FROM Arbritro a WHERE a.nombre = :nombre"),
    @NamedQuery(name = "Arbritro.findByApellido", query = "SELECT a FROM Arbritro a WHERE a.apellido = :apellido"),
    @NamedQuery(name = "Arbritro.findByFechaNacimiento", query = "SELECT a FROM Arbritro a WHERE a.fechaNacimiento = :fechaNacimiento")})
public class Arbritro implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idarbritro")
    private Integer idarbritro;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "apellido")
    private String apellido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_nacimiento")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "arbritroCentral")
    private List<Partido> partidoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idarbritro1")
    private List<Partido> partidoList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idarbritro2")
    private List<Partido> partidoList2;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idarbritro3")
    private List<Partido> partidoList3;

    public Arbritro() {
    }

    public Arbritro(Integer idarbritro) {
        this.idarbritro = idarbritro;
    }

    public Arbritro(Integer idarbritro, String nombre, String apellido, Date fechaNacimiento) {
        this.idarbritro = idarbritro;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getIdarbritro() {
        return idarbritro;
    }

    public void setIdarbritro(Integer idarbritro) {
        this.idarbritro = idarbritro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    @XmlTransient
    public List<Partido> getPartidoList() {
        return partidoList;
    }

    public void setPartidoList(List<Partido> partidoList) {
        this.partidoList = partidoList;
    }

    @XmlTransient
    public List<Partido> getPartidoList1() {
        return partidoList1;
    }

    public void setPartidoList1(List<Partido> partidoList1) {
        this.partidoList1 = partidoList1;
    }

    @XmlTransient
    public List<Partido> getPartidoList2() {
        return partidoList2;
    }

    public void setPartidoList2(List<Partido> partidoList2) {
        this.partidoList2 = partidoList2;
    }

    @XmlTransient
    public List<Partido> getPartidoList3() {
        return partidoList3;
    }

    public void setPartidoList3(List<Partido> partidoList3) {
        this.partidoList3 = partidoList3;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idarbritro != null ? idarbritro.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Arbritro)) {
            return false;
        }
        Arbritro other = (Arbritro) object;
        if ((this.idarbritro == null && other.idarbritro != null) || (this.idarbritro != null && !this.idarbritro.equals(other.idarbritro))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Arbritro[ idarbritro=" + idarbritro + " ]";
    }
    
}