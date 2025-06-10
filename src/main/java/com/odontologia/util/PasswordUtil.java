package com.odontologia.util;

import java.security.SecureRandom;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Genera el hash encriptado de una contraseña
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(29));
    }

    // Verifica si una contraseña coincide con el hash
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}
