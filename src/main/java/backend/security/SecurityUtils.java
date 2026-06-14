package backend.security;

import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class SecurityUtils {

    private static final String DSA_ALGO = "DSA";
    private static final int KEY_SIZE = 2048;

    public static KeyPair generateDSAKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance(DSA_ALGO);
        keyGen.initialize(KEY_SIZE);
        return keyGen.generateKeyPair();
    }

    public static String hashOrderData(String orderData) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedhash = digest.digest(orderData.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(encodedhash);
    }
    public static boolean verifyDSASignature(String dataHash, String signatureBase64, String publicKeyBase64) {
        try {
            byte[] publicBytes = Base64.getDecoder().decode(publicKeyBase64);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicBytes);
            KeyFactory keyFactory = KeyFactory.getInstance(DSA_ALGO);
            PublicKey publicKey = keyFactory.generatePublic(keySpec);
            Signature signature = Signature.getInstance("SHA256withDSA");
            signature.initVerify(publicKey);
            signature.update(dataHash.getBytes(StandardCharsets.UTF_8));
            byte[] signatureBytes = Base64.getDecoder().decode(signatureBase64);
            return signature.verify(signatureBytes);

        } catch (Exception e) {
            System.err.println("Lỗi xác thực chữ ký: " + e.getMessage());
            return false;
        }
    }
}