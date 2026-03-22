package backend.controller.admin;

import backend.dao.PromotionDAO;
import backend.db.DBConnect;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminQuickDiscountServlet", urlPatterns = {"/admin/product/quick-discount"})
public class AdminQuickDiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String valueStr = request.getParameter("value");
        String idsStr = request.getParameter("productIds");

        if (type != null && valueStr != null && idsStr != null) {
            try {

                String[] idsArr = idsStr.split(",");
                List<Integer> idList = new ArrayList<>();
                for (String s : idsArr) {
                    idList.add(Integer.parseInt(s.trim()));
                }



                PromotionDAO promoDAO = new PromotionDAO();
                List<Integer> conflictingIds = promoDAO.findConflictingProductIds(idList);

                if (!conflictingIds.isEmpty()) {

                    response.setStatus(409);
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write("Không thể giảm giá! Các sản phẩm ID: " + conflictingIds +
                            " đang thuộc chương trình khuyến mãi khác.");
                    return;
                }


                double value = Double.parseDouble(valueStr);


                String sql = "";
                if ("percent".equals(type)) {
                    sql = "UPDATE products SET sale_price = price * (100 - ?) / 100 WHERE id = ?";
                } else {
                    sql = "UPDATE products SET sale_price = GREATEST(0, price - ?) WHERE id = ?";
                }

                try (Connection conn = DBConnect.getConnection();
                     PreparedStatement ps = conn.prepareStatement(sql)) {

                    for (Integer id : idList) {
                        ps.setDouble(1, value);
                        ps.setInt(2, id);
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
                response.setStatus(200);
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(500);
            }
        } else {
            response.setStatus(400);
        }
    }
}