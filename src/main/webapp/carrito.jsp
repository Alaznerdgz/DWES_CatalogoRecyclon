<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Carrito</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=catalogo">♻️ Recyclon</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="recyclon?accion=catalogo">Catálogo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="recyclon?accion=pedidos">Mis Pedidos</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <span class="navbar-text text-white me-3">👤 ${usuario.nombre}</span>
                    <a href="recyclon?accion=logout" class="btn btn-outline-light">Salir</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>🛒 Carrito de Compras</h2>
        
        <c:if test="${!empty mensajeCDI.mensaje}">
            <div class="alert alert-${mensajeCDI.tipo} alert-dismissible fade show" role="alert">
                ${mensajeCDI.mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${empty lineas}">
            <div class="alert alert-info mt-4">
                El carrito está vacío. <a href="recyclon?accion=catalogo">Ver catálogo</a>
            </div>
        </c:if>

        <c:if test="${!empty lineas}">
            <div class="table-responsive mt-4">
                <table class="table table-hover">
                    <thead class="table-success">
                        <tr>
                            <th>Producto</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="linea" items="${lineas}">
                            <tr>
                                <td>${linea.producto.nombre}</td>
                                <td>
                                    <fmt:formatNumber value="${linea.precioUnitario}" 
                                                      type="currency" currencySymbol="€" 
                                                      maxFractionDigits="2"/>
                                </td>
                                <td>${linea.cantidad}</td>
                                <td>
                                    <strong>
                                        <fmt:formatNumber value="${linea.subtotal}" 
                                                          type="currency" currencySymbol="€" 
                                                          maxFractionDigits="2"/>
                                    </strong>
                                </td>
                                <td>
                                    <a href="recyclon?accion=eliminarDelCarrito&id=${linea.producto.id}" 
                                       class="btn btn-danger btn-sm">
                                        🗑️ Eliminar
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr class="table-light">
                            <td colspan="3" class="text-end"><strong>TOTAL:</strong></td>
                            <td colspan="2">
                                <strong class="fs-4 text-success">
                                    <fmt:formatNumber value="${total}" type="currency" 
                                                      currencySymbol="€" maxFractionDigits="2"/>
                                </strong>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <a href="recyclon?accion=catalogo" class="btn btn-secondary">
                    ← Seguir Comprando
                </a>
                <a href="recyclon?accion=finalizarPedido" class="btn btn-success btn-lg">
                    Finalizar Pedido →
                </a>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>