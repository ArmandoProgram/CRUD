<%-- 
    Document   : crud
    Created on : 8/11/2024, 02:49:21 PM
    Author     : arman
--%>
<%@page import="java.util.ArrayList" %>
<%@page import="controller.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .crud-container {
                margin-left: 150px;
                margin-top: 100px;
                padding: 20px;
                background-color: #f1f1f1;
                border-radius: 8px;
            }
            .btn-add {
                background-color: #f66a0a;
                color: white;
                margin-bottom: 10px;
                border-radius: 5px;
                border: none;
                font-size: 16px;
                padding: 10px;

            }
            .btn-add:hover {
                background-color: #yellow;
            }
            .table {
                width: 100%;
                border-collapse: collapse;
                background-color: transparent !important;
            }
            .table th, .table td {
                border: none;
                padding: 8px;
                background-color: transparent !important;
            }
            .table thead tr {
                border-bottom: 2px solid #000;
            }
            .header-info {
                margin-left: 150px;
                margin-top: 30px;
            }
            .current-date {
                font-size: 14px;
                color: #555;
            }
            .btn-rol {
                background-color: white;
                border: gray;
                color: black;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                margin-top: 10px;
            }
            .btn-rol:hover {
                background-color: gray;
            }
        </style>
        <script>
            function mostrarFechaActual() {
                const fecha = new Date();
                const opciones = { year: 'numeric', month: 'long', day: 'numeric' };
                document.getElementById("fecha-actual").textContent = fecha.toLocaleDateString('es-ES', opciones);
            }
            window.onload = mostrarFechaActual;
        </script>
    </head>
    <body>
        <%@include file="../../components/headerAdmin.jsp" %>
        <%@include file="../../components/sidebarAdmin.jsp" %>    

        <div class="header-info">
            <h2>Usuarios</h2>
            <div id="fecha-actual" class="current-date"></div>
        </div>

        <div class="crud-container">
            <button type="button" class="btn-add" onclick="window.location.href='/crudusuario/pages/usuario/registrarusuario.jsp'">Agregar Nuevo Usuario</button>
            <button type="submit" class="btn-rol">Roles</button>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Correo Electrónico</th>
                            <th>Rol</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Usuario> usuarios = (ArrayList<Usuario>) request.getAttribute("usuarios");
                            if (usuarios != null) {
                                for (Usuario usuario : usuarios) {
                        %>
                        <tr>
                            <td><%= usuario.getId() %></td>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellidoPaterno() %></td>
                            <td><%= usuario.getApellidoMaterno() %></td>
                            <td><%= usuario.getCorreoElectronico() %></td>
                            <td><%= usuario.getRol() %></td>
                            <td>
                                <!-- Botón para redirigir a la página de edición -->
                                <button class="btn-edit" onclick="window.location.href='/crudusuario/pages/usuario/editarusuario.jsp?id=<%= usuario.getId() %>'">Editar</button>
                            </td>
                        </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
