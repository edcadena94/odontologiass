package Repository;

import Model.Usuario;
import util.PasswordUtil;

import java.util.HashMap;
import java.util.Map;

public class UsuarioRepository {
    private static final Map<String, Usuario> USUARIOS = new HashMap<>();

    static {
        USUARIOS.put("lesly@gmail.com", new Usuario("lesly@gmail.com",
                PasswordUtil.hashPassword("odontoloogia145"), "SECRETARIA"));
        USUARIOS.put("doctor@smilecenter.com", new Usuario("doctor@smilecenter.com",
                PasswordUtil.hashPassword("doc123"), "DOCTOR"));
    }

    public Usuario buscarPorUsername(String username) {
        return USUARIOS.get(username);
    }
}