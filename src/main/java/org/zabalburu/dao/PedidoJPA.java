package org.zabalburu.dao;

import java.util.Date;
import java.util.List;

import org.zabalburu.modelo.Categoria;
import org.zabalburu.modelo.Pedido;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional
public class PedidoJPA implements PedidoDAO {

	@PersistenceContext(unitName = "PU")
    private EntityManager em;
	
	@Override
	public Pedido nuevoPedido(Pedido nuevo) {
		em.persist(nuevo);
        return nuevo;
	}

	@Override
	public Pedido modificarPedido(Pedido modificar) {
		return em.merge(modificar);
	}

	@Override
	public void eliminarPedido(Integer id) {
		Pedido p = em.find(Pedido.class, id);
        if (p != null) {
            em.remove(p);
        }
	}

	@Override
	public Pedido getPedido(Integer id) {
		return em.find(Pedido.class, id);
	}

	@Override
	public List<Pedido> getPedidos() {
		TypedQuery<Pedido> p = em.createQuery(
	            """
	            SELECT p
	            FROM Pedido p
	            ORDER BY p.fechaPedido
	            """,
	            Pedido.class
	        );
	        return p.getResultList();
	}

	@Override
	public List<Pedido> getPedidosPorUsuario(Integer usuario) {
		TypedQuery<Pedido> p = em.createQuery(
	            """
	            SELECT p
	            FROM Pedido p
	            Where p.id_usuario = :usuario
	            ORDER BY p.fechaPedido
	            """,
	            Pedido.class
	        );
		p.setParameter("id_usuario", usuario);
		return p.getResultList();
	}

	@Override
	public EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return null;
	}

}
