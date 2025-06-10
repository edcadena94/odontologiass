package com.odontologia.services;

import com.odontologia.models.Usuario;
import com.odontologia.repositories.UsuarioRepository;
import com.odontologia.repositories.UsuarioRepositoryJdbcImplement;
import com.odontologia.util.PasswordUtil;

public class UsuarioServiceJdbcImplement implements UsuarioService {

    private UsuarioRepository usuarioRepository = new UsuarioRepositoryJdbcImplement();

    @Override
    public Usuario login(String username, String password) {
        Usuario usuario = usuarioRepository.encontrarPorUsername(username);

        if (usuario != null && PasswordUtil.checkPassword(password, usuario.getPasswordHash())) {
            return usuario;
        }
        return null;
    }
}
