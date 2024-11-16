<%-- 
    Document   : registrar
    Created on : 7/11/2024, 08:03:54 PM
    Author     : arman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Estilos personalizados */
            .logo {
                display: block;
                margin: 30 auto;
                width: 250px;
                height: auto;
            }
            .login-container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .login-form {
                padding: 20px;
                border-radius: 8px;
                width: 100%;
                max-width: 400px;
                text-align: center;
            }
            .form-control {
                border: 2px solid #ec3718 !important;
            }
            .btn-add{
                       background-color: white;
                border: none;
                color: black;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin-top: 10px;
                border: blanchedalmond;
            }
            .btn-login {
                background-color: #ec3718;
                border: none;
                color: white;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                transition: background-color 0.3s;
                margin-top: 10px;
            }
            .btn-login:hover {
                background-color: darkorange; /* Color al pasar el ratón */
            }
            .form-label {
                font-weight: bold;
                margin-right: 10px;
                width: 150px; /* Ancho fijo para los labels */

            }
            .input-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body>
        <%@include file="../../components/headerAdmin.jsp" %>
        <%@include file="../../components/sidebarAdmin.jsp" %>

       <div class="login-container">
    <!-- Imagen centrada en la parte superior -->
    <img src="../../assets/FoodFlow Logo.png" class="logo" alt="LOGO">

    <!-- Formulario de registro de usuario -->
    <div class="login-form">
            <form action="/crudusuario/usuariosservlet" method="post">
            <div class="input-group">
                <label for="firstName" class="form-label">Nombre(s):</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="input-group">
                <label for="lastName" class="form-label">Apellido Paterno:</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="input-group">
                <label for="middleName" class="form-label">Apellido Materno:</label>
                <input type="text" class="form-control" id="middleName" name="middleName" required>
            </div>
            <div class="input-group">
                <label for="email" class="form-label">Correo electrónico:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="pin" class="form-label">PIN:</label>
                <input type="password" class="form-control" id="pin" name="pin" required>
            </div>
            <div class="input-group">
                <label for="role" class="form-label">Rol:</label>
                <select class="form-control" id="role" name="role" required>
                    <option value="" disabled selected>Seleccione un rol</option>
                    <option value="admin">Administrador</option>
                    <option value="cocina">Cocina</option>
                    <option value="mesero">Mesero</option>
                    <option value="cajero">Cajero</option>
                </select>
            </div>
            <button type="submit" class="btn-login">Agregar</button>
            <button type="button" class="btn-add" onclick="window.location.href='/crudusuario/pages/usuario/crud.jsp'">Regresar</button>

        </form>
    </div>
</div>
    </body>
</html>
