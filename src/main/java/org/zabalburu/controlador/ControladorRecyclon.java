package org.zabalburu.controlador;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.zabalburu.cdi.MensajeCDI;
import org.zabalburu.modelo.LineaPedido;
import org.zabalburu.modelo.Pedido;
import org.zabalburu.modelo.Producto;
import org.zabalburu.modelo.Usuario;
import org.zabalburu.servicio.RecyclonServicio;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/recyclon")
public class ControladorRecyclon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private RecyclonServicio service;
    
    @Inject
    private MensajeCDI mensajeCDI;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        String pagina = "login.jsp";
        
        if (accion == null) {
            pagina = "login.jsp";
        } else {
            switch (accion.toLowerCase()) {
                case "login":
                    pagina = login(request, response);
                    break;
                case "logout":
                    pagina = logout(request, response);
                    break;
                case "catalogo":
                    pagina = mostrarCatalogo(request, response);
                    break;
                case "agregarcarrito":
                    pagina = agregarAlCarrito(request, response);
                    break;
                case "vercarrito":
                    pagina = verCarrito(request, response);
                    break;
                case "eliminardel carrito":
                    pagina = eliminarDelCarrito(request, response);
                    break;
                case "finalizarpedido":
                    pagina = finalizarPedido(request, response);
                    break;
                case "adminproductos":
                    pagina = adminProductos(request, response);
                    break;
                case "formproducto":
                    pagina = formProducto(request, response);
                    break;
                case "guardarproducto":
                    pagina = guardarProducto(request, response);
                    break;
                case "eliminarproducto":
                    pagina = eliminarProducto(request, response);
                    break;
                case "pedidos":
                    pagina = verPedidos(request, response);
                    break;
                case "detallepedido":
                    pagina = detallePedido(request, response);
                    break;
                default:
                    pagina = "login.jsp";
            }
        }
        
        request.getRequestDispatcher(pagina).forward(request, response);
    }

    private String login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Usuario usuario = service.login(username, password);
        
        if (usuario != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            
            if ("ADMIN".equals(usuario.getRol())) {
                return adminProductos(request, response);
            } else {
                return mostrarCatalogo(request, response);
            }
        } else {
            mensajeCDI.setTipo("danger");
            mensajeCDI.setMensaje("Usuario o contraseña incorrectos");
            return "login.jsp";
        }
    }

    private String logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        return "login.jsp";
    }

    private String mostrarCatalogo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        if (usuario == null || !"CLIENTE".equals(usuario.getRol())) {
            return "login.jsp";
        }
        
        String categoriaParam = request.getParameter("categoria");
        List<Producto> productos;
        
        if (categoriaParam != null && !categoriaParam.isEmpty()) {
            Integer idCategoria = Integer.parseInt(categoriaParam);
            productos = service.getProductosPorCategoria(idCategoria);
        } else {
            productos = service.getProductos();
        }
        
        request.setAttribute("productos", productos);
        request.setAttribute("categorias", service.getCategorias());
        return "catalogo.jsp";
    }

    @SuppressWarnings("unchecked")
    private String agregarAlCarrito(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Integer idProducto = Integer.parseInt(request.getParameter("id"));
        Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));
        
        Producto producto = service.getProducto(idProducto);
        
        Map<Integer, LineaPedido> carrito = (Map<Integer, LineaPedido>) sesion.getAttribute("carrito");
        if (carrito == null) {
            carrito = new HashMap<>();
        }
        
        if (carrito.containsKey(idProducto)) {
            LineaPedido linea = carrito.get(idProducto);
            linea.setCantidad(linea.getCantidad() + cantidad);
            linea.setSubtotal(linea.getPrecioUnitario().multiply(new BigDecimal(linea.getCantidad())));
        } else {
            LineaPedido linea = new LineaPedido();
            linea.setProducto(producto);
            linea.setCantidad(cantidad);
            linea.setPrecioUnitario(producto.getPrecio());
            linea.setSubtotal(producto.getPrecio().multiply(new BigDecimal(cantidad)));
            carrito.put(idProducto, linea);
        }
        
        sesion.setAttribute("carrito", carrito);
        mensajeCDI.setTipo("success");
        mensajeCDI.setMensaje("Producto agregado al carrito");
        
        return mostrarCatalogo(request, response);
    }

    @SuppressWarnings("unchecked")
    private String verCarrito(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Map<Integer, LineaPedido> carrito = (Map<Integer, LineaPedido>) sesion.getAttribute("carrito");
        
        if (carrito != null && !carrito.isEmpty()) {
            BigDecimal total = BigDecimal.ZERO;
            for (LineaPedido linea : carrito.values()) {
                total = total.add(linea.getSubtotal());
            }
            request.setAttribute("total", total);
            request.setAttribute("lineas", carrito.values());
        }
        
        return "carrito.jsp";
    }

    @SuppressWarnings("unchecked")
    private String eliminarDelCarrito(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Integer idProducto = Integer.parseInt(request.getParameter("id"));
        
        Map<Integer, LineaPedido> carrito = (Map<Integer, LineaPedido>) sesion.getAttribute("carrito");
        if (carrito != null) {
            carrito.remove(idProducto);
        }
        
        mensajeCDI.setTipo("info");
        mensajeCDI.setMensaje("Producto eliminado del carrito");
        
        return verCarrito(request, response);
    }

    @SuppressWarnings("unchecked")
    private String finalizarPedido(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        Map<Integer, LineaPedido> carrito = (Map<Integer, LineaPedido>) sesion.getAttribute("carrito");
        
        if (carrito == null || carrito.isEmpty()) {
            mensajeCDI.setTipo("warning");
            mensajeCDI.setMensaje("El carrito está vacío");
            return verCarrito(request, response);
        }
        
        Pedido pedido = new Pedido();
        pedido.setUsuario(usuario);
        pedido.setFechaPedido(new Date());
        pedido.setEstado("PENDIENTE");
        
        BigDecimal total = BigDecimal.ZERO;
        List<LineaPedido> lineas = new ArrayList<>();
        
        for (LineaPedido lineaCarrito : carrito.values()) {
            LineaPedido linea = new LineaPedido();
            linea.setPedido(pedido);
            linea.setProducto(lineaCarrito.getProducto());
            linea.setCantidad(lineaCarrito.getCantidad());
            linea.setPrecioUnitario(lineaCarrito.getPrecioUnitario());
            linea.setSubtotal(lineaCarrito.getSubtotal());
            lineas.add(linea);
            total = total.add(linea.getSubtotal());
        }
        
        pedido.setTotal(total);
        pedido.setLineas(lineas);
        
        service.nuevoPedido(pedido);
        
        sesion.removeAttribute("carrito");
        mensajeCDI.setTipo("success");
        mensajeCDI.setMensaje("Pedido realizado con éxito. Total: " + total + "€");
        
        return mostrarCatalogo(request, response);
    }

    private String adminProductos(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        if (usuario == null || !"ADMIN".equals(usuario.getRol())) {
            return "login.jsp";
        }
        
        request.setAttribute("productos", service.getProductos());
        request.setAttribute("categorias", service.getCategorias());
        return "admin-productos.jsp";
    }

    private String formProducto(HttpServletRequest request, HttpServletResponse response) {
        String idParam = request.getParameter("id");
        
        if (idParam != null && !idParam.isEmpty()) {
            Integer id = Integer.parseInt(idParam);
            Producto producto = service.getProducto(id);
            request.setAttribute("producto", producto);
        }
        
        request.setAttribute("categorias", service.getCategorias());
        return "form-producto.jsp";
    }

    private String guardarProducto(HttpServletRequest request, HttpServletResponse response) {
        String idParam = request.getParameter("id");
        Producto producto;
        
        if (idParam != null && !idParam.isEmpty()) {
            Integer id = Integer.parseInt(idParam);
            producto = service.getProducto(id);
        } else {
            producto = new Producto();
        }
        
        producto.setNombre(request.getParameter("nombre"));
        producto.setDescripcion(request.getParameter("descripcion"));
        producto.setPrecio(new BigDecimal(request.getParameter("precio")));
        producto.setStock(Integer.parseInt(request.getParameter("stock")));
        producto.setImagen(request.getParameter("imagen"));
        
        Integer idCategoria = Integer.parseInt(request.getParameter("categoria"));
        producto.setCategoria(service.getCategoria(idCategoria));
        
        if (producto.getId() == null) {
            service.nuevoProducto(producto);
            mensajeCDI.setTipo("success");
            mensajeCDI.setMensaje("Producto creado exitosamente");
        } else {
            service.modificarProducto(producto);
            mensajeCDI.setTipo("success");
            mensajeCDI.setMensaje("Producto modificado exitosamente");
        }
        
        return adminProductos(request, response);
    }

    private String eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        service.eliminarProducto(id);
        
        mensajeCDI.setTipo("info");
        mensajeCDI.setMensaje("Producto eliminado");
        
        return adminProductos(request, response);
    }

    private String verPedidos(HttpServletRequest request, HttpServletResponse response) {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        if (usuario == null) {
            return "login.jsp";
        }
        
        List<Pedido> pedidos;
        if ("ADMIN".equals(usuario.getRol())) {
            pedidos = service.getPedidos();
        } else {
            pedidos = service.getPedidosPorUsuario(usuario.getId());
        }
        
        request.setAttribute("pedidos", pedidos);
        return "pedidos.jsp";
    }

    private String detallePedido(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Pedido pedido = service.getPedido(id);
        
        request.setAttribute("pedido", pedido);
        return "detalle-pedido.jsp";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}