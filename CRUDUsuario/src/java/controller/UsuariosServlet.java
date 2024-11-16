/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import configuration.ConnectionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuariosServlet", urlPatterns = {"/usuariosservlet"})
public class UsuariosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
      
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          ArrayList<Usuario> usuarios = new ArrayList<>();
        
        // Conexión a la base de datos utilizando ConnectionBD
        try {
            ConnectionBD connectionBD = new ConnectionBD();
            Connection conn = connectionBD.getConnectionBD();
            
            String sql = "SELECT id, nombre, apellido_paterno, apellido_materno, correo, rol FROM usuarios";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido_paterno"),
                        rs.getString("apellido_materno"),
                        rs.getString("correo"),
                        rs.getString("rol")
                );
                usuarios.add(usuario);
                    System.out.println("Usuario agregado: " + usuario.getNombre());

            }
            conn.close();

            System.out.println("Número de usuarios recuperados: " + usuarios.size()); // Verificación del tamaño de la lista

        } catch (Exception e) {
            System.err.println("Error en la consulta o conexión a la base de datos: " + e.getMessage());
        }

        // Pasar la lista de usuarios al JSP
        request.setAttribute("usuarios", usuarios);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/usuario/crud.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 // Obtener los parámetros del formulario
    String nombre = request.getParameter("firstName");
    String apellidoPaterno = request.getParameter("lastName");
    String apellidoMaterno = request.getParameter("middleName");
    String correo = request.getParameter("email");
    String pin = request.getParameter("pin"); // Asumiendo que se almacena como contraseña
    String rol = request.getParameter("role");

    // Validar que no estén vacíos
    if (nombre != null && apellidoPaterno != null && apellidoMaterno != null && correo != null && pin != null && rol != null) {
        try {
            // Conectar a la base de datos
            ConnectionBD connectionBD = new ConnectionBD();
            Connection conn = connectionBD.getConnectionBD();

            // Preparar la consulta SQL de inserción
            String sql = "INSERT INTO usuarios (nombre, apellido_paterno, apellido_materno, correo, pin, rol) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellidoPaterno);
            ps.setString(3, apellidoMaterno);
            ps.setString(4, correo);
            ps.setString(5, pin); // Almacenar el PIN (posiblemente encriptado en una implementación real)
            ps.setString(6, rol);

            // Ejecutar la consulta
            int filasInsertadas = ps.executeUpdate();
            conn.close();

            if (filasInsertadas > 0) {
                System.out.println("Usuario agregado exitosamente.");
                response.sendRedirect("usuariosservlet"); // Redirigir a la lista de usuarios
            } else {
                System.out.println("No se pudo agregar el usuario.");
                request.setAttribute("error", "No se pudo agregar el usuario.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/usuario/registrarusuario.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            System.err.println("Error al agregar el usuario: " + e.getMessage());
            request.setAttribute("error", "Error al agregar el usuario: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/usuario/registrarusuario.jsp");
            dispatcher.forward(request, response);
        }
    } else {
        request.setAttribute("error", "Todos los campos son obligatorios.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/usuario/registrarusuario.jsp");
        dispatcher.forward(request, response);
    }    }
}
