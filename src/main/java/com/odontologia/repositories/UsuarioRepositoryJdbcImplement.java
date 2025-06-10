package com.odontologia.repositories;

import com.odontologia.models.Usuario;
import com.odontologia.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioRepositoryJdbcImplement implements UsuarioRepository {

    @Override
    public Usuario encontrarPorUsername(String username) {
        Usuario usuario = null;
        String sql = "SELECT * FROM Usuarios WHERE username = ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setUsername(rs.getString("username"));
                usuario.setPasswordHash(rs.getString("password_hash"));
                usuario.setRol(rs.getString("rol"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
}
