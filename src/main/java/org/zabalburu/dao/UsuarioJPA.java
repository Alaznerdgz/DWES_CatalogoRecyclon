package org.zabalburu.dao;

import java.util.List;

import org.zabalburu.modelo.Usuario;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional
public class UsuarioJPA implements UsuarioDAO {

    @PersistenceContext(unitName = "PU")
    private EntityManager em;

    @Override
    public Usuario nuevoUsuario(Usuario nuevo) {
        em.persist(nuevo);
        return nuevo;
    }

    @Override
    public Usuario modificarUsuario(Usuario modificar) {
        return em.merge(modificar);
    }

    @Override
    public void eliminarUsuario(Integer id) {
        Usuario u = em.find(Usuario.class, id);
        if (u != null) {
            em.remove(u);
        }
    }

    @Override
    public Usuario getUsuario(Integer id) {
        return em.find(Usuario.class, id);
    }

    @Override
    public Usuario getUsuario(String username, String password) {
        TypedQuery<Usuario> q = em.createQuery(
            """
            SELECT u
            FROM Usuario u
            WHERE u.username = :username AND u.password = :password
            """,
            Usuario.class
        );
        q.setParameter("username", username);
        q.setParameter("password", password);
        
        Usuario u = null;
        try {
            u = q.getSingleResult();
        } catch (NoResultException ex) {}
        return u;
    }

    @Override
    public List<Usuario> getUsuarios() {
        TypedQuery<Usuario> q = em.createQuery(
            """
            SELECT u
            FROM Usuario u
            ORDER BY u.apellidos, u.nombre
            """,
            Usuario.class
        );
        return q.getResultList();
    }

	@Override
	public EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return null;
	}
}