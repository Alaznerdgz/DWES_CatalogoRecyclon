<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Pedidos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark 
                ${usuario.rol == 'ADMIN' ? 'bg-dark' : 'bg-success'}">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=${usuario.rol == 'ADMIN' ? 'adminProductos' : 'catalogo'}">
                ♻️ Recyclon ${usuario.rol == 'ADMIN' ? '- Admin' : ''}
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <c:if test="${usuario.rol == 'ADMIN'}">
                        <li class="nav-item">
                            <a class="nav-link" href="recyclon?accion=adminProductos">Productos</a>
                        </li>
                    </c:if>
                    <c:if test="${usuario.rol == 'CLIENTE'}">
                        <li class="nav-item">
                            <a class="nav-link" href="recyclon?accion=catalogo">Catálogo</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link active" href="recyclon?accion=pedidos">
                            ${usuario.rol == 'ADMIN' ? 'Pedidos' : 'Mis Pedidos'}
                        </a>
                    </li>
                </ul>
                <div class="d-flex">
                    <span class="navbar-text text-white me-3">
                        ${usuario.rol == 'ADMIN' ? '👨‍💼' : '👤'} ${usuario.nombre}
                    </span>
                    <a href="recyclon?accion=logout" class="btn btn-outline-light">Salir</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>📋 ${usuario.rol == 'ADMIN' ? 'Todos los Pedidos' : 'Mis Pedidos'}</h2>

        <c:if test="${empty pedidos}">
            <div class="alert alert-info mt-4">No hay pedidos registrados</div>
        </c:if>

        <c:if test="${!empty pedidos}">
            <div class="table-responsive mt-4">
                <table class="table table-striped table-hover">
                    <thead class="${usuario.rol == 'ADMIN' ? 'table-dark' : 'table-success'}">
                        <tr>
                            <th>Nº Pedido</th>
                            <c:if test="${usuario.rol == 'ADMIN'}">
                                <th>Cliente</th>
                            </c:if>
                            <th>Fecha</th>
                            <th>Total</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${pedidos}">
                            <tr>
                                <td><strong>#${p.id}</strong></td>
                                <c:if test="${usuario.rol == 'ADMIN'}">
                                    <td>${p.usuario.nombre} ${p.usuario.apellidos}</td>
                                </c:if>
                                <td>
                                    <fmt:formatDate value="${p.fechaPedido}" 
                                                    pattern="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td>
                                    <strong>
                                        <fmt:formatNumber value="${p.total}" type="currency" 
                                                          currencySymbol="€" maxFractionDigits="2"/>
                                    </strong>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.estado == 'PENDIENTE'}">
                                            <span class="badge bg-warning text-dark">Pendiente</span>
                                        </c:when>
                                        <c:when test="${p.estado == 'PROCESANDO'}">
                                            <span class="badge bg-info">Procesando</span>
                                        </c:when>
                                        <c:when test="${p.estado == 'ENVIADO'}">
                                            <span class="badge bg-primary">Enviado</span>
                                        </c:when>
                                        <c:when test="${p.estado == 'ENTREGADO'}">
                                            <span class="badge bg-success">Entregado</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="recyclon?accion=detallePedido&id=${p.id}" 
                                       class="btn btn-sm btn-primary">
                                        👁️ Ver Detalle
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>