package org.zabalburu.modelo;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "categorias")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Categoria implements Serializable {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Integer id;
    
    private String nombre;
    
    private String descripcion;
    
    @OneToMany(mappedBy = "categoria")
    private List<Producto> productos;

    @Override
    public String toString() {
        return "Categoria [id=" + id + ", nombre=" + nombre + "]";
    }
}