package org.zabalburu.servicio;

import java.util.Date;
import java.util.List;

import org.zabalburu.dao.CategoriaDAO;
import org.zabalburu.dao.PedidoDAO;
import org.zabalburu.dao.ProductoDAO;
import org.zabalburu.dao.UsuarioDAO;
import org.zabalburu.modelo.Categoria;
import org.zabalburu.modelo.Pedido;
import org.zabalburu.modelo.Producto;
import org.zabalburu.modelo.Usuario;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class RecyclonServicio {

    @Inject
    private UsuarioDAO usuarioDAO;
    
    @Inject
    private ProductoDAO productoDAO;
    
    @Inject
    private CategoriaDAO categoriaDAO;
    
    @Inject
    private PedidoDAO pedidoDAO;

    // USUARIOS
    public Usuario login(String username, String password) {
        return usuarioDAO.getUsuario(username, password);
    }
    
    public Usuario nuevoUsuario(Usuario nuevo) {
        return usuarioDAO.nuevoUsuario(nuevo);
    }
    
    public Usuario getUsuario(Integer id) {
        return usuarioDAO.getUsuario(id);
    }
    
    public List<Usuario> getUsuarios() {
        return usuarioDAO.getUsuarios();
    }

    // PRODUCTOS
    public Producto nuevoProducto(Producto nuevo) {
        return productoDAO.nuevoProducto(nuevo);
    }
    
    public Producto modificarProducto(Producto modificar) {
        return productoDAO.modificarProducto(modificar);
    }
    
    public void eliminarProducto(Integer id) {
        productoDAO.eliminarProducto(id);
    }
    
    public Producto getProducto(Integer id) {
        return productoDAO.getProducto(id);
    }
    
    public List<Producto> getProductos() {
        return productoDAO.getProductos();
    }
    
    public List<Producto> getProductosPorCategoria(Integer idCategoria) {
        return productoDAO.getProductosPorCategoria(idCategoria);
    }
    
    public List<Producto> getProductosStockBajo(Integer limite) {
        return productoDAO.getProductosStockBajo(limite);
    }

    // CATEGORÍAS
    public Categoria nuevaCategoria(Categoria nueva) {
        return categoriaDAO.nuevaCategoria(nueva);
    }
    
    public Categoria modificarCategoria(Categoria modificar) {
        return categoriaDAO.modificarCategoria(modificar);
    }
    
    public void eliminarCategoria(Integer id) {
        categoriaDAO.eliminarCategoria(id);
    }
    
    public Categoria getCategoria(Integer id) {
        return categoriaDAO.getCategoria(id);
    }
    
    public List<Categoria> getCategorias() {
        return categoriaDAO.getCategorias();
    }

    // PEDIDOS
    public Pedido nuevoPedido(Pedido nuevo) {
        return pedidoDAO.nuevoPedido(nuevo);
    }
    
    public Pedido modificarPedido(Pedido modificar) {
        return pedidoDAO.modificarPedido(modificar);
    }
    
    public void eliminarPedido(Integer id) {
        pedidoDAO.eliminarPedido(id);
    }
    
    public Pedido getPedido(Integer id) {
        return pedidoDAO.getPedido(id);
    }
    
    public List<Pedido> getPedidos() {
        return pedidoDAO.getPedidos();
    }
    
    public List<Pedido> getPedidosPorUsuario(Integer idUsuario) {
        return pedidoDAO.getPedidosPorUsuario(idUsuario);
    }
    
    public List<Pedido> getPedidosPorFecha(Date fechaInicio, Date fechaFin) {
        return pedidoDAO.getPedidosPorFecha(fechaInicio, fechaFin);
    }
}