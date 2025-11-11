<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Catálogo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=catalogo">♻️ Recyclon</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="recyclon?accion=catalogo">Catálogo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="recyclon?accion=pedidos">Mis Pedidos</a>
                    </li>
                </ul>
                <div class="d-flex">
                    <a href="recyclon?accion=vercarrito" class="btn btn-outline-light me-2">
                        🛒 Carrito
                    </a>
                    <span class="navbar-text text-white me-3">
                        👤 ${usuario.nombre}
                    </span>
                    <a href="recyclon?accion=logout" class="btn btn-outline-light">
                        Salir
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <c:if test="${!empty mensajeCDI.mensaje}">
            <div class="alert alert-${mensajeCDI.tipo} alert-dismissible fade show" role="alert">
                ${mensajeCDI.mensaje}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Filtro por categoría -->
        <div class="row mb-4">
            <div class="col-md-12">
                <h3>Catálogo de Productos</h3>
                <div class="btn-group" role="group">
                    <a href="recyclon?accion=catalogo" class="btn btn-outline-success">Todos</a>
                    <c:forEach var="cat" items="${categorias}">
                        <a href="recyclon?accion=catalogo&categoria=${cat.id}" 
                           class="btn btn-outline-success">${cat.nombre}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- Productos -->
        <div class="row">
            <c:if test="${empty productos}">
                <div class="col-12">
                    <div class="alert alert-info">No hay productos disponibles</div>
                </div>
            </c:if>
            
            <c:forEach var="p" items="${productos}">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm">
                        <img src="${p.imagen != null ? p.imagen : 'https://via.placeholder.com/300x200?text=Producto'}" 
                             class="card-img-top" alt="${p.nombre}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${p.nombre}</h5>
                            <p class="card-text text-muted small">${p.descripcion}</p>
                            <p class="card-text">
                                <strong class="text-success fs-4">
                                    <fmt:formatNumber value="${p.precio}" type="currency" 
                                                      currencySymbol="€" maxFractionDigits="2"/>
                                </strong>
                            </p>
                            <p class="card-text">
                                <small class="text-muted">Stock: ${p.stock} unidades</small>
                            </p>
                        </div>
                        <div class="card-footer bg-white">
                            <form action="recyclon" method="post" class="d-flex gap-2">
                                <input type="hidden" name="accion" value="agregarCarrito">
                                <input type="hidden" name="id" value="${p.id}">
                                <input type="number" name="cantidad" value="1" min="1" 
                                       max="${p.stock}" class="form-control form-control-sm" 
                                       style="width: 80px;">
                                <button type="submit" class="btn btn-success btn-sm flex-grow-1">
                                    Agregar al carrito
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>