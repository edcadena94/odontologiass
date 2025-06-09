package com.odontologia.services;

import com.odontologia.util.HashUtil;
import com.odontologia.util.Conexion;
import java.sql.*;

public class AuthService {

    private static final String SQL_VALIDAR_USUARIO = "SELECT password_hash, salt FROM usuarios WHERE username = ?";
    private static final String SQL_CREAR_USUARIO = "INSERT INTO usuarios (username, password_hash, salt) VALUES (?, ?, ?)";

    public boolean autenticarUsuario(String username, String password) {
        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_VALIDAR_USUARIO)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashAlmacenado = rs.getString("password_hash");
                String salt = rs.getString("salt");
                return HashUtil.verificarHash(password, salt, hashAlmacenado);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean registrarUsuario(String username, String password) {
        String salt = HashUtil.generarSalt();
        String hashPassword = HashUtil.hashSHA3(password, salt);

        try (Connection conn = Conexion.getConnection();
             PreparedStatement ps = conn.prepareStatement(SQL_CREAR_USUARIO)) {

            ps.setString(1, username);
            ps.setString(2, hashPassword);
            ps.setString(3, salt);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}