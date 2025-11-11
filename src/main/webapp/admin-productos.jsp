<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Administración</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=adminProductos">♻️ Recyclon - Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="recyclon?accion=adminProductos">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="recyclon?accion=pedidos">Pedidos</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <span class="navbar-text text-white me-3">👨‍💼 ${usuario.nombre}</span>
                    <a href="recyclon?accion=logout" class="btn btn-outline-light">Salir</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>📦 Gestión de Productos</h2>
            <a href="recyclon?accion=formProducto" class="btn btn-success">
                ➕ Nuevo Producto
            </a>
        </div>

        <c:if test="${!empty mensajeCDI.mensaje}">
            <div class="alert alert-${mensajeCDI.tipo} alert-dismissible fade show" role="alert">
                ${mensajeCDI.mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <c:if test="${empty productos}">
            <div class="alert alert-info">No hay productos registrados</div>
        </c:if>

        <c:if test="${!empty productos}">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${productos}">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.nombre}</td>
                                <td>
                                    <span class="badge bg-secondary">
                                        ${p.categoria.nombre}
                                    </span>
                                </td>
                                <td>
                                    <fmt:formatNumber value="${p.precio}" type="currency" 
                                                      currencySymbol="€" maxFractionDigits="2"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.stock < 10}">
                                            <span class="badge bg-danger">${p.stock}</span>
                                        </c:when>
                                        <c:when test="${p.stock < 50}">
                                            <span class="badge bg-warning text-dark">${p.stock}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">${p.stock}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="recyclon?accion=formProducto&id=${p.id}" 
                                       class="btn btn-primary btn-sm">
                                        ✏️ Editar
                                    </a>
                                    <a href="recyclon?accion=eliminarProducto&id=${p.id}" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('¿Eliminar producto?')">
                                        🗑️ Eliminar
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