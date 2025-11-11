package org.zabalburu.dao;

import java.util.List;
import org.zabalburu.modelo.Categoria;

import jakarta.persistence.EntityManager;

public interface CategoriaDAO {
    Categoria nuevaCategoria(Categoria nueva);
    Categoria modificarCategoria(Categoria modificar);
    void eliminarCategoria(Integer id);
    Categoria getCategoria(Integer id);
    List<Categoria> getCategorias();
    EntityManager getEntityManager();
}