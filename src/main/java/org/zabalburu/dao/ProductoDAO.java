package org.zabalburu.dao;

import java.util.List;
import org.zabalburu.modelo.Producto;

public interface ProductoDAO {
    Producto nuevoProducto(Producto nuevo);
    Producto modificarProducto(Producto modificar);
    void eliminarProducto(Integer id);
    Producto getProducto(Integer id);
    List<Producto> getProductos();
    List<Producto> getProductosPorCategoria(Integer idCategoria);
    List<Producto> getProductosStockBajo(Integer limite);
}