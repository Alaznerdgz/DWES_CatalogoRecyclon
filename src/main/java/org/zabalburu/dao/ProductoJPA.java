package org.zabalburu.dao;

import java.util.List;

import org.zabalburu.modelo.Producto;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional
public class ProductoJPA implements ProductoDAO {

    @PersistenceContext(unitName = "recyclonPU")
    private EntityManager em;

    @Override
    public Producto nuevoProducto(Producto nuevo) {
        em.persist(nuevo);
        return nuevo;
    }

    @Override
    public Producto modificarProducto(Producto modificar) {
        return em.merge(modificar);
    }

    @Override
    public void eliminarProducto(Integer id) {
        Producto p = em.find(Producto.class, id);
        if (p != null) {
            em.remove(p);
        }
    }

    @Override
    public Producto getProducto(Integer id) {
        return em.find(Producto.class, id);
    }

    @Override
    public List<Producto> getProductos() {
        TypedQuery<Producto> q = em.createQuery(
            """
            SELECT p
            FROM Producto p
            ORDER BY p.nombre
            """,
            Producto.class
        );
        return q.getResultList();
    }

    @Override
    public List<Producto> getProductosPorCategoria(Integer idCategoria) {
        TypedQuery<Producto> q = em.createQuery(
            """
            SELECT p
            FROM Producto p
            WHERE p.categoria.id = :idCategoria
            ORDER BY p.nombre
            """,
            Producto.class
        );
        q.setParameter("idCategoria", idCategoria);
        return q.getResultList();
    }

    @Override
    public List<Producto> getProductosStockBajo(Integer limite) {
        TypedQuery<Producto> q = em.createQuery(
            """
            SELECT p
            FROM Producto p
            WHERE p.stock < :limite
            ORDER BY p.stock
            """,
            Producto.class
        );
        q.setParameter("limite", limite);
        return q.getResultList();
    }
}