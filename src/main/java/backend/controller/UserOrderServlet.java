package backend.controller;

import backend.dao.OrderDAO;
import backend.model.Order;
import backend.model.User;
import backend.dao.UserKeyDAO;
import backend.model.UserKey;
import backend.security.SecurityUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserOrderServlet", value = "/don-hang")
public class UserOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        UserKeyDAO keyDAO = new UserKeyDAO();
        List<Order> orders = orderDAO.getOrdersByUserId(user.getId());
        java.util.Map<Integer, Boolean> revokedWarningMap = new java.util.HashMap<>();
        for (Order o : orders) {
            try {
                String auditData = orderDAO.buildOrderAuditData(o);
                System.out.println("=== CHUỖI LÚC TRUY XUẤT LÊN ===");
                System.out.println(auditData);
                String currentHash = SecurityUtils.hashOrderData(auditData);
                boolean isTampered = false;
                if (o.getOrderHash() == null || !currentHash.equals(o.getOrderHash())) {
                    isTampered = true;
                }
                else if (o.getSignature() != null && !o.getSignature().isEmpty() && o.getPublicKeyId() != null && o.getPublicKeyId() > 0) {
                    UserKey key = keyDAO.getKeyById(o.getPublicKeyId());
                    if (key != null) {
                        boolean isValidSig = SecurityUtils.verifyDSASignature(currentHash, o.getSignature(), key.getPublicKeyContent());
                        if (!isValidSig) {
                            isTampered = true;
                        }
                        if ("REVOKED".equals(key.getStatus()) && key.getRevokedAt() != null) {
                            if (o.getCreatedAt().toLocalDateTime().isAfter(key.getRevokedAt())) {
                                revokedWarningMap.put(o.getId(), true);
                            }
                        }
                    } else {
                        isTampered = true;
                    }
                }
                if (isTampered) {
                    o.setTampered(true);
                    orderDAO.markOrderAsTampered(o.getId());
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("revokedWarningMap", revokedWarningMap);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("don-hang-nguoi-dung.jsp").forward(request, response);
    }
}
