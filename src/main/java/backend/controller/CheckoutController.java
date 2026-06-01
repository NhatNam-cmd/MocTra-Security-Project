package backend.controller;

import backend.dao.CartDAO;
import backend.dao.OrderDAO;
import backend.dao.ProductDAO;
import backend.dao.UserAddressDAO;
import backend.model.Cart;
import backend.model.CartItem;
import backend.model.User;
import backend.model.UserAddress;
import backend.model.Order;
import backend.security.SecurityUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutServlet", value = "/thanh-toan")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if (cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect("san-pham.jsp");
            return;
        }
        UserAddressDAO addressDAO = new UserAddressDAO();
        List<UserAddress> addresses = addressDAO.getListAddress(user.getId());
        request.setAttribute("addresses", addresses);
        request.setAttribute("subtotal", cart.getTotalMoney());
        double defaultShipping = 20000;
        request.setAttribute("shippingFee", defaultShipping);
        request.setAttribute("totalAmount", cart.getTotalMoney() + defaultShipping);

        request.getRequestDispatcher("thanh-toan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");


        if (user == null || cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect("index.jsp");
            return;
        }


        String selectedAddressVal = request.getParameter("selectedAddress");
        String shippingMethod = request.getParameter("shippingMethod");
        String paymentMethod = request.getParameter("paymentMethod");
        String note = request.getParameter("note");


        UserAddressDAO addressDAO = new UserAddressDAO();
        int shippingAddressId = 0;

        if ("new".equals(selectedAddressVal)) {

            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phoneNumber");
            String province = request.getParameter("province");
            String ward = request.getParameter("ward");
            String street = request.getParameter("addressLine");

            UserAddress newAddr = new UserAddress();
            newAddr.setUserId(user.getId());
            newAddr.setFullName(fullName);
            newAddr.setPhoneNumber(phone);
            newAddr.setLabel("Địa chỉ mới");
            newAddr.setProvince(province);
            newAddr.setWard(ward);
            newAddr.setStreetAddress(street);
            newAddr.setIsDefault(false);


            shippingAddressId = addressDAO.addAddressAndGetId(newAddr);
        } else {

            try {
                shippingAddressId = Integer.parseInt(selectedAddressVal);
            } catch (NumberFormatException e) {

            }
        }


        double shippingFee = 20000;
        if ("express".equals(shippingMethod)) shippingFee = 35000;
        else if ("instant".equals(shippingMethod)) shippingFee = 60000;

        double totalAmount = cart.getTotalMoney() + shippingFee;


        Order order = new Order();
        order.setUserId(user.getId());
        order.setShippingAddressId(shippingAddressId);
        order.setOrderNumber(generateOrderNumber());
        order.setTotalAmount(totalAmount);
        order.setShippingFee(shippingFee);
        order.setPaymentMethod(paymentMethod);
        order.setNotes(note);

        try {
            StringBuilder dataToHash = new StringBuilder();
            dataToHash.append(order.getOrderNumber()).append("|")
                    .append(order.getUserId()).append("|")
                    .append(shippingAddressId).append("|")
                    .append(order.getNotes()).append("|")
                    .append(order.getShippingFee()).append("|")
                    .append(order.getTotalAmount()).append("|")
                    .append(order.getPaymentMethod());
            for (CartItem item : cart.getItems()) {
                dataToHash.append("|")
                        .append(item.getProduct().getId()).append(":")
                        .append(item.getQuantity());
            }
            System.out.println("=== CHUỖI GỐC LÚC CHECKOUT ===");
            System.out.println(dataToHash.toString());
            String orderHash = SecurityUtils.hashOrderData(dataToHash.toString());
            order.setOrderHash(orderHash);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Hệ thống gặp lỗi bảo mật khi khởi tạo dữ liệu đơn hàng. Vui lòng thử lại!");
            doGet(request, response);
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(order);

        if (orderId > 0) {


            List<CartItem> cartItems = new ArrayList<>(cart.getItems());
            orderDAO.addOrderItems(orderId, cartItems);
            ProductDAO productDAO = new ProductDAO();
            for (CartItem item : cartItems) {

                productDAO.decreaseStock(item.getProduct().getId(), item.getQuantity());
            }
            session.removeAttribute("cart");
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCart(user.getId());
            response.sendRedirect("hoa-don?id=" + orderId);
        } else {
            request.setAttribute("errorMessage", "Đặt hàng thất bại. Vui lòng thử lại.");
            doGet(request, response);
        }
    }

    private String generateOrderNumber() {
        return "ORD" + System.currentTimeMillis();
    }
}