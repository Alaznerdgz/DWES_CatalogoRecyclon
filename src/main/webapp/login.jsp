<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Recyclon - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4 text-success">♻️ Recyclon</h2>
                        <h5 class="text-center mb-4 text-muted">Productos Reciclados</h5>

                        <c:if test="${!empty mensajeCDI.mensaje}">
                            <div class="alert alert-${mensajeCDI.tipo}" role="alert">
                                ${mensajeCDI.mensaje}
                            </div>
                        </c:if>

                        <form action="recyclon" method="post">
                            <input type="hidden" name="accion" value="login">

                            <div class="mb-3">
                                <label for="username" class="form-label">Usuario</label>
                                <input type="text" class="form-control" id="username"
                                       name="username" required autofocus>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="password"
                                       name="password" required>
                            </div>

                            <button type="submit" class="btn btn-success w-100">
                                Iniciar Sesión
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>