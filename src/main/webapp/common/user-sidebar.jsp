<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<aside class="sidebar">
    <div class="profile-card">
        <div class="profile-header">
            <div class="avatar-circle">

                ${not empty sessionScope.user.username ? sessionScope.user.username.charAt(0) : 'U'}
            </div>
            <div class="email">${sessionScope.user.email}</div>
        </div>

        <div class="profile-body">
            <button class="btn-shopping" onclick="window.location.href='san-pham'">Tiếp tục mua sắm</button>
        </div>
    </div>

    <nav class="side-menu">
        <ul>

            <li class="${param.activePage == 'tong-quan' ? 'active' : ''}">
                <a href="user-dashboard"><i class="fa-solid fa-house"></i> Tổng quan</a>
            </li>


            <li class="${param.activePage == 'tai-khoan' ? 'active' : ''}">
                <a href="tai-khoan-cua-toi"><i class="fa-regular fa-user"></i> Tài khoản của tôi</a>
            </li>


            <li class="${param.activePage == 'dia-chi' ? 'active' : ''}">
                <a href="dia-chi-nguoi-dung"><i class="fa-solid fa-location-dot"></i> Địa chỉ</a>
            </li>


            <li class="${param.activePage == 'don-hang' ? 'active' : ''}">
                <a href="don-hang"><i class="fa-solid fa-cart-shopping"></i> Đơn hàng của tôi</a>
            </li>

            <li class="${param.activePage == 'key' ? 'active' : ''}">
                <a href="key"><i class="bi bi-key-fill"></i> Quản lý khóa</a>
            </li>

            <li>
                <a href="logout" style="color: #dc3545;"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a>
            </li>
        </ul>
    </nav>
</aside>