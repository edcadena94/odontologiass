package com.odontologia.repositories;

import com.odontologia.models.Usuario;

public interface UsuarioRepository {
    Usuario encontrarPorUsername(String username);
}
