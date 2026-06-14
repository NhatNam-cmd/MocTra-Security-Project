package backend.controller;

import backend.dao.UserKeyDAO;
import backend.model.User;
import backend.model.UserKey;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "KeyManagerController", value = "/key")
public class KeyManagerController extends HttpServlet {

    private final UserKeyDAO userKeyDAO = new UserKeyDAO();
    private static final int DSA_KEY_SIZE = 2048;
    private static final String KEY_MANAGEMENT_JSP = "/key-management.jsp";
    private static final String PRIVATE_KEY_FILENAME = "private.key";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = getAuthenticatedUser(request, response);
        if (user == null) return;

        String action = request.getParameter("action");

        if ("downloadPrivateKey".equals(action)) {
            downloadPrivateKey(request, response);
        } else {
            keyManagementPage(request, response, user.getId());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = getAuthenticatedUser(request, response);
        if (user == null) return;

        String action = request.getParameter("action");

        if ("generateKey".equals(action)) {
            generateAndSaveKeyPair(request, response, user.getId());
        } else if ("reportLostKey".equals(action)) {
            reportLostKey(request, response, user.getId());
        } else {
            forwardWithError(request, response, user.getId(), "Action không hợp lệ");
        }
    }


    private void keyManagementPage(HttpServletRequest request, HttpServletResponse response, int userId)
            throws ServletException, IOException {

        setKeyPageAttributes(request, userId);
        request.getRequestDispatcher(KEY_MANAGEMENT_JSP).forward(request, response);
    }

    private void setKeyPageAttributes(HttpServletRequest request, int userId) {
        UserKey activeKey = userKeyDAO.getActivePublicKeyByUserId(userId);
        List<UserKey> allKeys  = userKeyDAO.getAllKeysByUserId(userId);
        int keyCount = userKeyDAO.getKeyCount(userId);

        request.setAttribute("activeKey", activeKey);
        request.setAttribute("allKeys",   allKeys);
        request.setAttribute("keyCount",  keyCount);
    }

    private void generateAndSaveKeyPair(HttpServletRequest request, HttpServletResponse response, int userId)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DSA");
            keyGen.initialize(DSA_KEY_SIZE);
            KeyPair keyPair = keyGen.generateKeyPair();

            PublicKey  publicKey  = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            String publicKeyBase64  = Base64.getEncoder().encodeToString(publicKey.getEncoded());
            String privateKeyBase64 = Base64.getEncoder().encodeToString(privateKey.getEncoded());

            UserKey userKey = new UserKey(userId, publicKeyBase64);
            boolean saved   = userKeyDAO.savePublicKey(userKey);

            if (saved) {
                setKeyPageAttributes(request, userId);
                session.setAttribute("newPrivateKey", privateKeyBase64);
                request.setAttribute("successMessage", "Tạo cặp khóa thành công! Hãy tải về private.key ngay.");
                request.getRequestDispatcher(KEY_MANAGEMENT_JSP).forward(request, response);
            } else {
                forwardWithError(request, response, userId, "Lỗi khi lưu public key vào database");
            }

        } catch (NoSuchAlgorithmException e) {
            forwardWithError(request, response, userId,
                    "Thuật toán DSA không được hỗ trợ: " + e.getMessage());
        } catch (Exception e) {
            forwardWithError(request, response, userId,
                    "Lỗi hệ thống khi tạo khóa: " + e.getMessage());
        }
    }


    private void reportLostKey(HttpServletRequest request, HttpServletResponse response, int userId)
            throws ServletException, IOException {

        String keyIdStr = request.getParameter("keyId");

        if (keyIdStr == null || keyIdStr.trim().isEmpty()) {
            forwardWithError(request, response, userId, "Khóa ID không hợp lệ");
            return;
        }

        int keyId;
        try {
            keyId = Integer.parseInt(keyIdStr.trim());
        } catch (NumberFormatException e) {
            forwardWithError(request, response, userId, "Khóa ID không hợp lệ");
            return;
        }

        UserKey userKey = userKeyDAO.getKeyById(keyId);
        if (userKey == null || !userKey.getUserId().equals(userId)) {
            forwardWithError(request, response, userId,
                    "Khóa không tồn tại hoặc không thuộc về bạn");
            return;
        }

        boolean revoked = userKeyDAO.revokeKey(keyId);

        if (revoked) {
            HttpSession session = request.getSession();
            session.setAttribute("flashSuccess", "Khóa đã được thu hồi và vô hiệu hóa thành công!");
            response.sendRedirect(request.getContextPath() + "/key");
        } else {
            forwardWithError(request, response, userId, "Lỗi khi thu hồi khóa");
        }
    }

    private void downloadPrivateKey(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        Object keyAttr = (session != null) ? session.getAttribute("newPrivateKey") : null;

        if (session != null) {
            session.removeAttribute("newPrivateKey");
        }

        if (keyAttr == null || keyAttr.toString().trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/key");
            return;
        }

        String privateKeyData = keyAttr.toString().trim();

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition",
                "attachment; filename=\"" + PRIVATE_KEY_FILENAME + "\"");

        PrintWriter writer = response.getWriter();
        writer.write(formatPrivateKeyPEM(privateKeyData));
        writer.flush();
    }

    private User getAuthenticatedUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return null;
        }
        return (User) session.getAttribute("user");
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response,
                                  int userId, String errorMessage)
            throws ServletException, IOException {

        setKeyPageAttributes(request, userId);
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher(KEY_MANAGEMENT_JSP).forward(request, response);
    }

    private String formatPrivateKeyPEM(String rawBase64) {
        StringBuilder pem = new StringBuilder("-----BEGIN PRIVATE KEY-----\n");
        for (int i = 0; i < rawBase64.length(); i += 64) {
            pem.append(rawBase64, i, Math.min(i + 64, rawBase64.length())).append('\n');
        }
        pem.append("-----END PRIVATE KEY-----");
        return pem.toString();
    }
}