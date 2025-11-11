<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="recyclon?accion=adminProductos">♻️ Recyclon - Admin</a>
            <div class="d-flex">
                <a href="recyclon?accion=logout" class="btn btn-outline-light">Salir</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h2>
                    <c:if test="${empty producto}">Nuevo Producto</c:if>
                    <c:if test="${!empty producto}">Editar Producto</c:if>
                </h2>
                
                <form action="recyclon" method="post">
                    <input type="hidden" name="accion" value="guardarProducto">
                    <c:if test="${!empty producto}">
                        <input type="hidden" name="id" value="${producto.id}">
                    </c:if>
                    
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre *</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" 
                               value="${producto.nombre}" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" 
                                  rows="3">${producto.descripcion}</textarea>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="precio" class="form-label">Precio (€) *</label>
                            <input type="number" step="0.01" class="form-control" id="precio" 
                                   name="precio" value="${producto.precio}" required>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label for="stock" class="form-label">Stock *</label>
                            <input type="number" class="form-control" id="stock" name="stock" 
                                   value="${producto.stock}" required>
                        </div>
                        
                        <div class="col-md-4 mb-3">
                            <label for="categoria" class="form-label">Categoría *</label>
                            <select class="form-select" id="categoria" name="categoria" required>
                                <option value="">Seleccionar...</option>
                                <c:forEach var="cat" items="${categorias}">
                                    <option value="${cat.id}" 
                                            ${producto.categoria.id == cat.id ? 'selected' : ''}>
                                        ${cat.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="imagen" class="form-label">URL Imagen</label>
                        <input type="text" class="form-control" id="imagen" name="imagen" 
                               value="${producto.imagen}" 
                               placeholder="https://ejemplo.com/imagen.jpg">
                        <small class="text-muted">URL completa de la imagen del producto</small>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-4">
                        <a href="recyclon?accion=adminProductos" class="btn btn-secondary">
                            Cancelar
                        </a>
                        <button type="submit" class="btn btn-success">
                            <c:if test="${empty producto}">Crear Producto</c:if>
                            <c:if test="${!empty producto}">Guardar Cambios</c:if>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>