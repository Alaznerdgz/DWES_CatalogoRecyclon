package org.zabalburu.dao;

import java.util.Date;
import java.util.List;
import org.zabalburu.modelo.Pedido;

import jakarta.persistence.EntityManager;

public interface PedidoDAO {
    Pedido nuevoPedido(Pedido nuevo);
    Pedido modificarPedido(Pedido modificar);
    void eliminarPedido(Integer id);
    Pedido getPedido(Integer id);
    List<Pedido> getPedidos();
    List<Pedido> getPedidosPorUsuario(Integer usuario);
    EntityManager getEntityManager();
}