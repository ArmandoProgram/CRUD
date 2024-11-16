/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import configuration.ConnectionBD;
import controller.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    
    // Método para obtener un usuario específico por su ID
    public Usuario obtenerUsuarioPorId(int id) {
        Usuario usuario = null;
        String sql = "SELECT id, nombre, apellidoPaterno, apellidoMaterno, correoElectronico, rol FROM usuarios WHERE id = ?";
        
        try (Connection conn = new ConnectionBD().getConnectionBD();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                usuario = new Usuario(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("apellidoPaterno"),
                    rs.getString("apellidoMaterno"),
                    rs.getString("correoElectronico"),
                    rs.getString("rol")
                );
            }
        } catch (Exception e) {
            System.err.println("Error al obtener usuario por ID: " + e);
        }
        
        return usuario;
    }
}

