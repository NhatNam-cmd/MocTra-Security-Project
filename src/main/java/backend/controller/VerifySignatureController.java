package backend.controller;

import backend.dao.OrderDAO;
import backend.dao.UserKeyDAO;
import backend.model.Order;
import backend.model.User;
import backend.model.UserKey;
import backend.security.SecurityUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "VerifySignatureController", value = "/verify-signature")
public class VerifySignatureController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String orderIdStr = request.getParameter("orderId");
        String signature = request.getParameter("signature");

        if (orderIdStr == null || signature == null || signature.trim().isEmpty()) {
            redirectWithError(request, response, orderIdStr, "Vui lòng nhập chữ ký điện tử!");
            return;
        }

        int orderId = Integer.parseInt(orderIdStr);

        try {
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderById(orderId);

            if (order == null || order.getUserId() != user.getId()) {
                redirectWithError(request, response, orderIdStr, "Đơn hàng không hợp lệ hoặc không thuộc về bạn.");
                return;
            }
            UserKeyDAO keyDAO = new UserKeyDAO();
            UserKey activeKey = keyDAO.getActivePublicKeyByUserId(user.getId());

            if (activeKey == null) {
                redirectWithError(request, response, orderIdStr, "Bạn chưa tạo Khóa bảo mật hoặc khóa đã bị thu hồi. Vui lòng vào trang Quản lý khóa để tạo mới!");
                return;
            }
            boolean isValid = SecurityUtils.verifyDSASignature(order.getOrderHash(), signature.trim(), activeKey.getPublicKeyContent());

            if (isValid) {
                boolean updated = orderDAO.updateOrderSignature(orderId, signature.trim(), activeKey.getId());

                if (updated) {
                    response.sendRedirect("hoa-don?id=" + orderId);
                } else {
                    redirectWithError(request, response, orderIdStr, "Lỗi cập nhật CSDL. Vui lòng thử lại!");
                }
            } else {
                redirectWithError(request, response, orderIdStr, "Chữ ký không hợp lệ! Vui lòng kiểm tra lại Tool sinh chữ ký và đảm bảo bạn dùng đúng Private Key.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectWithError(request, response, orderIdStr, "Lỗi hệ thống khi xác thực chữ ký: " + e.getMessage());
        }
    }

    private void redirectWithError(HttpServletRequest request, HttpServletResponse response, String orderId, String errorMsg) throws ServletException, IOException {
        request.getSession().setAttribute("errorMessage", errorMsg);
        response.sendRedirect("hoa-don?id=" + orderId);
    }
}