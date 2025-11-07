package org.zabalburu.dao;

import java.util.List;
import org.zabalburu.modelo.Usuario;

public interface UsuarioDAO {
    Usuario nuevoUsuario(Usuario nuevo);
    Usuario modificarUsuario(Usuario modificar);
    void eliminarUsuario(Integer id);
    Usuario getUsuario(Integer id);
    Usuario getUsuario(String username, String password);
    List<Usuario> getUsuarios();
}