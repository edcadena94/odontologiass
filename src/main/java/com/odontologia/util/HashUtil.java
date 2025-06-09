package com.odontologia.util;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import java.security.SecureRandom;

public class HashUtil {

    public static String generarSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return Hex.toHexString(salt);
    }

    public static String hashSHA3(String password, String salt) {
        SHA3.DigestSHA3 digestSHA3 = new SHA3.Digest512();
        byte[] hashBytes = digestSHA3.digest((password + salt).getBytes());
        return Hex.toHexString(hashBytes);
    }

    public static boolean verificarHash(String password, String salt, String hashAlmacenado) {
        String hashCalculado = hashSHA3(password, salt);
        return hashCalculado.equals(hashAlmacenado);
    }
}