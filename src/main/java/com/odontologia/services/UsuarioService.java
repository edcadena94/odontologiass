package com.odontologia.services;

import com.odontologia.models.Usuario;

public interface UsuarioService {
    Usuario login(String username, String password);
}
