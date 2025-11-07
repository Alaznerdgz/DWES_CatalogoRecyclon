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
@Table(name = "usuarios")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Usuario implements Serializable {
    
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Integer id;
    
    @Column(nullable = false, unique = true, length = 50)
    private String username;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false, length = 100)
    private String nombre;
    
    @Column(length = 100)
    private String apellidos;
    
    @Column(length = 200)
    private String email;
    
    @Column(length = 20)
    private String telefono;
    
    @Column(length = 250)
    private String direccion;
    
    // ROL: ADMIN o CLIENTE
    @Column(nullable = false, length = 20)
    private String rol;
    
    @OneToMany(mappedBy = "usuario")
    private List<Pedido> pedidos;

    @Override
    public String toString() {
        return "Usuario [id=" + id + ", username=" + username + ", nombre=" + nombre + 
               ", apellidos=" + apellidos + ", rol=" + rol + "]";
    }
}