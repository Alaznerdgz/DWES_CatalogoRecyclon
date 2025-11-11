<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Detalle Pedido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark 
                ${usuario.rol == 'ADMIN' ? 'bg-dark' : 'bg-success'}">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=${usuario.rol == 'ADMIN' ? 'adminProductos' : 'catalogo'}">
                ♻️ Recyclon ${usuario.rol == 'ADMIN' ? '- Admin' : ''}
            </a>
            <div class="d-flex">
                <a href="recyclon?accion=logout" class="btn btn-outline-light">Salir</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>📋 Detalle del Pedido #${pedido.id}</h2>
            <a href="recyclon?accion=pedidos" class="btn btn-secondary">← Volver</a>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">Información del Pedido</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Fecha:</strong> 
                            <fmt:formatDate value="${pedido.fechaPedido}" 
                                            pattern="dd/MM/yyyy HH:mm"/>
                        </p>
                        <p><strong>Estado:</strong> 
                            <c:choose>
                                <c:when test="${pedido.estado == 'PENDIENTE'}">
                                    <span class="badge bg-warning text-dark">Pendiente</span>
                                </c:when>
                                <c:when test="${pedido.estado == 'PROCESANDO'}">
                                    <span class="badge bg-info">Procesando</span>
                                </c:when>
                                <c:when test="${pedido.estado == 'ENVIADO'}">
                                    <span class="badge bg-primary">Enviado</span>
                                </c:when>
                                <c:when test="${pedido.estado == 'ENTREGADO'}">
                                    <span class="badge bg-success">Entregado</span>
                                </c:when>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-4">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">Datos del Cliente</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Nombre:</strong> ${pedido.usuario.nombre} ${pedido.usuario.apellidos}</p>
                        <p><strong>Email:</strong> ${pedido.usuario.email}</p>
                        <p><strong>Teléfono:</strong> ${pedido.usuario.telefono}</p>
                        <p><strong>Dirección:</strong> ${pedido.usuario.direccion}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header bg-light">
                <h5 class="mb-0">Productos del Pedido</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Producto</th>
                                <th>Precio Unit.</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="linea" items="${pedido.lineas}">
                                <tr>
                                    <td>${linea.producto.nombre}</td>
                                    <td>
                                        <fmt:formatNumber value="${linea.precioUnitario}" 
                                                          type="currency" currencySymbol="€" 
                                                          maxFractionDigits="2"/>
                                    </td>
                                    <td>${linea.cantidad}</td>
                                    <td>
                                        <fmt:formatNumber value="${linea.subtotal}" 
                                                          type="currency" currencySymbol="€" 
                                                          maxFractionDigits="2"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot class="table-light">
                            <tr>
                                <td colspan="3" class="text-end"><strong>TOTAL:</strong></td>
                                <td>
                                    <strong class="fs-5 text-success">
                                        <fmt:formatNumber value="${pedido.total}" 
                                                          type="currency" currencySymbol="€" 
                                                          maxFractionDigits="2"/>
                                    </strong>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>