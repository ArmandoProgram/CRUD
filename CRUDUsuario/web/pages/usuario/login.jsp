<%-- 
    Document   : login
    Created on : 7/11/2024, 07:24:56 PM
    Author     : arman
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                min-width: 60px; /* Tamaño mínimo de los labels */
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

            <!-- Formulario de inicio de sesión -->
            <div class="login-form">
                <form action="loginServlet" method="post">
                   <div class="input-group">
                       <label for="email" class="form-label">Correo:</label>
                       <input type="email" class="form-control" id="email" name="email" required>
                   </div>
                    <div class="input-group">
                       <label for="pin" class="form-label">PIN:</label>
                       <input type="password" class="form-control" id="pin" name="pin" required>
                   </div>
                   <button type="submit" class="btn-login">Login</button>
                </form>
            </div>
        </div>
    </body>
</html>



