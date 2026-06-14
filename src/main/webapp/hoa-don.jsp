<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<fmt:setLocale value="vi_VN"/>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn #${order.orderNumber} - Mộc Trà</title>

    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<main>
    <section class="invoice-page">
        <div class="container">
            <c:if test="${not empty order}">
                <div class="invoice-header">
                    <div class="invoice-header-left">
                        <h1 class="invoice-title">Hóa đơn thanh toán</h1>
                        <p class="invoice-subtitle">
                            Cảm ơn bạn đã tin tưởng Mộc Trà. Dưới đây là thông tin chi tiết đơn hàng của bạn.
                        </p>
                    </div>
                    <div class="invoice-header-right">
                        <p><strong>Mã hóa đơn:</strong> <span id="invoiceCode">${order.orderNumber}</span></p>
                        <p><strong>Thời gian đặt:</strong>
                            <span id="invoiceDateTime">
                                <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                            </span>
                        </p>
                        <p><strong>Trạng thái:</strong>
                            <span class="status-badge status-${order.status}">
                                    ${order.status}
                            </span>
                        </p>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${empty order.signature}">
                        <div class="invoice-column">
                            <div class="checkout-card invoice-card signature-card" style="text-align: center; padding: 40px 20px; border: 2px dashed #00897b;">
                                <div class="signature-section">
                                    <h2><i class="fa-solid fa-shield-halved"></i> Xác thực chữ ký điện tử</h2>

                                    <c:choose>
                                        <c:when test="${not hasActiveKey}">
                                            <div style="background: #fff3e0; border-left: 4px solid #ff9800; padding: 20px; border-radius: 4px; margin-top: 15px;">
                                                <h3 style="color: #e65100; margin-top: 0; font-size: 1.1rem;">
                                                    <i class="fa-solid fa-triangle-exclamation"></i> Không tìm thấy Khóa bảo mật
                                                </h3>
                                                <p style="color: #555; line-height: 1.6; margin-bottom: 15px;">
                                                    Hệ thống phát hiện bạn chưa có Cặp khóa bảo mật nào đang hoạt động, hoặc khóa của bạn đã bị báo mất. <br>
                                                    Để có thể ký xác nhận đơn hàng này, bạn cần phải tạo một cặp khóa mới.
                                                </p>
                                                <a href="key" class="btn btn-primary" style="background-color: #ff9800; border: none; padding: 10px 20px; text-decoration: none; display: inline-block; border-radius: 5px; color: white; font-weight: bold;">
                                                    <i class="fa-solid fa-key"></i> Tạo Khóa Mới Ngay
                                                </a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color: #555; margin-bottom: 15px; line-height: 1.6;">
                                                Đơn hàng của bạn đã được khởi tạo thành công.<br>
                                                Để đảm bảo tính toàn vẹn dữ liệu, vui lòng sử dụng <strong>Công cụ CryptoApp</strong> để ký xác nhận.
                                            </p>
                                            <div style="margin-bottom: 25px;">
                                                <a href="huong-dan-bao-mat.jsp" target="_blank" style="color: #00897b; text-decoration: underline; font-weight: 500; font-size: 0.95rem;">
                                                    <i class="fa-regular fa-circle-question"></i> Bạn chưa biết cách ký? Xem hướng dẫn tại đây
                                                </a>
                                            </div>

                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger" style="background: #fdecea; color: #c62828; padding: 12px; border-radius: 8px; margin-bottom: 20px; text-align: left;">
                                        <i class="fa-solid fa-circle-xmark"></i> ${errorMessage}
                                    </div>
                                </c:if>

                                <div class="hash-box" style="background: #f5f5f5; padding: 18px; border-radius: 8px; margin-bottom: 25px; text-align: left; border: 1px solid #ddd;">
                                    <strong style="display: block; margin-bottom: 8px; color: #333; font-size: 0.95rem;">Mã băm đơn hàng (SHA-256):</strong>
                                    <code id="orderHashText" style="color: #e67e22; font-size: 1rem; word-break: break-all; display: block; margin-bottom: 12px; padding: 10px; background: #fff; border-radius: 4px; border: 1px solid #eee;">${order.orderHash}</code>
                                    <button type="button" onclick="copyHash()" class="btn btn-secondary" style="padding: 8px 15px; font-size: 0.9rem;">
                                        <i class="fa-regular fa-copy"></i> Copy mã băm
                                    </button>
                                </div>

                                <form action="verify-signature" method="post" style="text-align: left;">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <div style="margin-bottom: 20px;">
                                        <label for="signature" style="font-weight: 600; color: #333; display: block; margin-bottom: 8px;">Dán chữ ký điện tử (Base64) vào đây:</label>
                                        <textarea id="signature" name="signature" rows="5" required placeholder="Ví dụ: MC0CFQCMp..." style="width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ccc; font-family: monospace; font-size: 0.9rem; resize: vertical;"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary" style="width: 100%; padding: 14px; font-size: 1.1rem; border-radius: 8px;">
                                        <i class="fa-solid fa-check-double"></i> Xác nhận đơn hàng
                                    </button>
                                </form>
                            </div>
                        </div>

                        <script>
                            function copyHash() {
                                const hashText = document.getElementById("orderHashText").innerText;
                                navigator.clipboard.writeText(hashText).then(() => {
                                    alert("Đã copy mã băm thành công!");
                                }).catch(err => {
                                    console.error('Không thể copy', err);
                                });
                            }
                        </script>
                    </c:when>

                    <c:otherwise>
                        <div class="invoice-column">

                            <div class="checkout-card invoice-card">
                                <h2 class="checkout-card__title">Thông tin giao hàng</h2>
                                <div class="invoice-info">
                                    <p class="invoice-address" id="shippingAddress">
                                            ${o.fullAddress}
                                    </p>

                                    <p><strong>Phương thức giao hàng:</strong>
                                        <span class="pill pill-shipping">
                                            <c:choose>
                                                <c:when test="${order.shippingFee >= 60000}">Giao Hỏa Tốc</c:when>
                                                <c:when test="${order.shippingFee >= 35000}">Giao Nhanh</c:when>
                                                <c:otherwise>Giao Tiêu Chuẩn</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div class="checkout-card invoice-card">
                                <h2 class="checkout-card__title">Hình thức thanh toán</h2>
                                <div class="invoice-info">
                                    <p><strong>Phương thức:</strong>
                                        <span class="pill pill-payment" id="paymentMethod">
                                            <c:choose>
                                                <c:when test="${order.paymentMethod == 'cod'}">Thanh toán khi nhận hàng (COD)</c:when>
                                                <c:when test="${order.paymentMethod == 'momo'}">Ví MoMo</c:when>
                                                <c:when test="${order.paymentMethod == 'banking'}">Chuyển khoản ngân hàng</c:when>
                                                <c:otherwise>${order.paymentMethod}</c:otherwise>
                                            </c:choose>
                                        </span>
                                    </p>
                                    <p><strong>Trạng thái thanh toán:</strong>
                                        <span id="paymentStatus">
                                            <c:choose>
                                                <c:when test="${order.paymentStatus == 'PAID'}">
                                                    <span style="color: green; font-weight: bold;">Đã thanh toán</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span style="color: orange; font-weight: bold;">Chờ thanh toán</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </p>
                                </div>
                            </div>

                            <div class="checkout-card invoice-card">
                                <h2 class="checkout-card__title">Danh sách sản phẩm</h2>

                                <div class="invoice-table-wrapper">
                                    <table class="invoice-table">
                                        <thead>
                                        <tr>
                                            <th>Hình ảnh</th>
                                            <th>Tên Sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Đơn giá</th>
                                            <th>Thành tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${order.items}">
                                            <tr>
                                                <td>
                                                    <div style="display: flex; align-items: center; gap: 10px;">
                                                        <img src="${item.product.imageUrl}" alt="${item.product.name}"
                                                             style="width: 50px; height: 50px; object-fit: cover; border-radius: 4px;">
                                                    </div>
                                                </td>
                                                <td><span class="invoice-product-name">${item.product.name}</span></td>
                                                <td>${item.quantity}</td>
                                                <td>
                                                    <fmt:formatNumber value="${item.price}" type="currency"/>
                                                </td>
                                                <td>
                                                    <fmt:formatNumber value="${item.price * item.quantity}" type="currency"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="order-summary invoice-summary">
                                    <div class="order-summary__row">
                                        <span>Tạm tính</span>
                                        <span>
                                            <fmt:formatNumber value="${order.totalAmount - order.shippingFee}" type="currency"/>
                                        </span>
                                    </div>
                                    <div class="order-summary__row">
                                        <span>Phí vận chuyển</span>
                                        <span id="invoiceShippingFee">
                                            <fmt:formatNumber value="${order.shippingFee}" type="currency"/>
                                        </span>
                                    </div>
                                    <div class="order-summary__row order-summary__row--total">
                                        <span>Tổng cộng</span>
                                        <span id="invoiceTotal" style="color: #d32f2f; font-size: 1.2rem;">
                                            <fmt:formatNumber value="${order.totalAmount}" type="currency"/>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="invoice-actions">
                                <a href="san-pham.jsp" class="btn btn-secondary">
                                    Tiếp tục mua sắm
                                </a>
                                <a href="don-hang" class="btn btn-primary">
                                    Xem lịch sử đơn hàng
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <c:if test="${empty order}">
                <div style="text-align: center; padding: 50px;">
                    <h2>Không tìm thấy đơn hàng!</h2>
                    <a href="index.jsp" class="btn btn-primary">Về trang chủ</a>
                </div>
            </c:if>
        </div>
    </section>
</main>

<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>