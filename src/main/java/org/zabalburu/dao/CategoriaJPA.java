package org.zabalburu.dao;

import java.util.List;

import org.zabalburu.modelo.Categoria;
import org.zabalburu.modelo.Producto;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional
public class CategoriaJPA implements CategoriaDAO{
	
	@PersistenceContext(unitName = "PU")
    private EntityManager em;

	@Override
	public Categoria nuevaCategoria(Categoria nueva) {
		em.persist(nueva);
        return nueva;
	}

	@Override
	public Categoria modificarCategoria(Categoria modificar) {
		return em.merge(modificar);
	}

	@Override
	public void eliminarCategoria(Integer id) {
		Categoria c = em.find(Categoria.class, id);
        if (c != null) {
            em.remove(c);
        }
	}

	@Override
	public Categoria getCategoria(Integer id) {
		return em.find(Categoria.class, id);
	}

	@Override
	public List<Categoria> getCategorias() {
		TypedQuery<Categoria> c = em.createQuery(
	            """
	            SELECT c
	            FROM Categoria c
	            ORDER BY c.nombre
	            """,
	            Categoria.class
	        );
	        return c.getResultList();
	}

	@Override
	public EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return null;
	}

}
