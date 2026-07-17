package backend.controller.admin;

import backend.dao.OrderDAO;
import backend.dao.UserKeyDAO;
import backend.model.Order;
import backend.model.UserKey;
import backend.model.enums.OrderStatus;
import backend.security.SecurityUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderServlet", urlPatterns = {"/admin/orders", "/admin/order/detail", "/admin/order/update"})
public class AdminOrderServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();
    private final UserKeyDAO userKeyDAO = new UserKeyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.contains("/detail")) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                Order order = orderDAO.getOrderById(Integer.parseInt(idStr));
                auditOrder(order);
                request.setAttribute("order", order);
                request.getRequestDispatcher("/admin/admin-order-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/orders");
            }
        } else {

            int page = 1;
            try { page = Integer.parseInt(request.getParameter("page")); } catch (Exception e) {}


            String status = request.getParameter("status");
            String timeFilter = request.getParameter("time");
            String sort = request.getParameter("sort");


            List<Order> list = orderDAO.getAllOrders(page, 10, status, timeFilter, sort);
            for (Order order : list) {
                auditOrder(order);
            }
            int totalOrders = orderDAO.countAllOrders(status, timeFilter);
            int totalPages = (int) Math.ceil((double)totalOrders / 10);


            request.setAttribute("orders", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalOrders", totalOrders);


            request.setAttribute("status", status);
            request.setAttribute("time", timeFilter);
            request.setAttribute("sort", sort);

            request.getRequestDispatcher("/admin/admin-orders.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String statusStr = request.getParameter("status");

        try {
            OrderStatus newStatus = OrderStatus.valueOf(statusStr.toUpperCase());

            if ("bulk".equals(action)) {
                String idsParam = request.getParameter("orderIds");
                if (idsParam != null && !idsParam.isEmpty()) {
                    String[] ids = idsParam.split(",");
                    for (String idStr : ids) {
                        orderDAO.updateOrderStatus(Integer.parseInt(idStr), newStatus);
                    }
                }
            } else {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                orderDAO.updateOrderStatus(orderId, newStatus);
            }

            response.setStatus(200);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
        }
    }

    private void auditOrder(Order order) {
        if (order == null) {
            return;
        }

        try {
            String auditData = orderDAO.buildOrderAuditDataById(order.getId());
            if (auditData == null) {
                markOrderTampered(order);
                return;
            }

            String currentHash = SecurityUtils.hashOrderData(auditData);
            if (isBlank(order.getOrderHash()) || !currentHash.equals(order.getOrderHash())) {
                markOrderTampered(order);
                return;
            }

            if (order.getPublicKeyId() == null || isBlank(order.getSignature())) {
                return;
            }

            UserKey key = userKeyDAO.getKeyById(order.getPublicKeyId());
            if (key == null || isBlank(key.getPublicKeyContent())) {
                markOrderTampered(order);
                return;
            }

            boolean validSignature = SecurityUtils.verifyDSASignature(
                    currentHash,
                    order.getSignature(),
                    key.getPublicKeyContent()
            );

            if (!validSignature) {
                markOrderTampered(order);
            }

            if ("REVOKED".equals(key.getStatus())
                    && key.getRevokedAt() != null
                    && order.getCreatedAt() != null
                    && order.getCreatedAt().toLocalDateTime().isAfter(key.getRevokedAt())) {
                order.setKeyWarning(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            markOrderTampered(order);
        }
    }

    private void markOrderTampered(Order order) {
        order.setTampered(true);
        orderDAO.markOrderAsTampered(order.getId());
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
