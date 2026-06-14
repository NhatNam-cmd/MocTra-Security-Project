<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty sessionScope.flashSuccess}">
    <c:set var="flashSuccess" value="${sessionScope.flashSuccess}"/>
    <% session.removeAttribute("flashSuccess"); %>
</c:if>

<c:if test="${not empty sessionScope.newPrivateKey}">
    <c:set var="newPrivateKey" scope="page" value="${sessionScope.newPrivateKey}"/>
</c:if>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khóa Công Khai - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* ===== KEY MANAGEMENT PAGE ===== */
        .key-stats {
            display: flex;
            gap: 16px;
            margin-bottom: 28px;
            flex-wrap: wrap;
        }

        .key-stat-card {
            flex: 1;
            min-width: 120px;
            background: #f0faf8;
            border: 1px solid #b2dfdb;
            border-radius: 10px;
            padding: 16px 20px;
            text-align: center;
        }

        .key-stat-card .stat-number {
            font-size: 1.8em;
            font-weight: 700;
            color: #00796b;
            line-height: 1;
            margin-bottom: 4px;
        }

        .key-stat-card .stat-label {
            font-size: 0.82em;
            color: #555;
        }

        .key-section {
            margin-bottom: 36px;
        }

        .key-section-title {
            font-size: 1.05em;
            font-weight: 600;
            color: #1a1a1a;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .key-section-title i {
            color: #00897b;
        }

        .key-hint {
            background: #f0faf8;
            border-left: 3px solid #00897b;
            border-radius: 0 8px 8px 0;
            padding: 12px 16px;
            font-size: 0.88em;
            color: #444;
            margin-bottom: 18px;
            line-height: 1.6;
        }

        .key-alert {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 0.88em;
            margin-bottom: 18px;
            line-height: 1.6;
        }

        .key-alert-success {
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
        }

        .key-alert-danger {
            background: #fdecea;
            color: #c62828;
            border: 1px solid #f5c6cb;
        }

        .key-alert ul {
            margin: 6px 0 0 18px;
        }

        /* Buttons */
        .btn-primary-teal {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #00897b;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 11px 24px;
            font-size: 0.95em;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s, transform 0.15s;
        }

        .btn-primary-teal:hover {
            background: #00695c;
            transform: translateY(-1px);
            color: #fff;
        }

        .btn-download {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #00897b;
            color: #fff;
            border: none;
            border-radius: 7px;
            padding: 9px 20px;
            font-size: 0.9em;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
        }

        .btn-download:hover {
            background: #00695c;
            color: #fff;
        }

        .btn-revoke {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #fff;
            color: #c62828;
            border: 1.5px solid #e57373;
            border-radius: 7px;
            padding: 7px 16px;
            font-size: 0.87em;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-revoke:hover {
            background: #fdecea;
        }

        .btn-cancel {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #f5f5f5;
            color: #555;
            border: 1px solid #ddd;
            border-radius: 7px;
            padding: 8px 18px;
            font-size: 0.87em;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-cancel:hover {
            background: #ebebeb;
        }

        /* Key display boxes */
        .private-key-box {
            background: #1b2631;
            color: #58d68d;
            padding: 14px 16px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 0.78em;
            word-break: break-all;
            max-height: 160px;
            overflow-y: auto;
            margin: 12px 0;
            line-height: 1.7;
        }

        .public-key-display {
            background: #1b2631;
            color: #7fb3f5;
            padding: 12px 14px;
            border-radius: 8px;
            font-family: 'Courier New', monospace;
            font-size: 0.75em;
            word-break: break-all;
            max-height: 120px;
            overflow-y: auto;
            line-height: 1.7;
            margin-bottom: 12px;
        }

        /* Active key card */
        .active-key-card {
            border: 1px solid #b2dfdb;
            border-radius: 10px;
            overflow: hidden;
        }

        .active-key-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 18px;
            background: #f0faf8;
            border-bottom: 1px solid #b2dfdb;
        }

        .key-meta {
            font-size: 0.87em;
            color: #555;
        }

        .key-meta strong {
            color: #1a1a1a;
            font-weight: 600;
        }

        .active-key-card-body {
            padding: 14px 18px;
        }

        /* Badges */
        .badge-active {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.8em;
            font-weight: 600;
        }

        .badge-revoked {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #fdecea;
            color: #c62828;
            border: 1px solid #f5c6cb;
            border-radius: 20px;
            padding: 3px 12px;
            font-size: 0.8em;
            font-weight: 600;
        }

        /* History table */
        .key-history-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.88em;
        }

        .key-history-table th {
            background: #f0faf8;
            color: #00695c;
            font-weight: 600;
            padding: 10px 14px;
            text-align: left;
            border-bottom: 2px solid #b2dfdb;
        }

        .key-history-table td {
            padding: 10px 14px;
            border-bottom: 1px solid #f0f0f0;
            color: #333;
        }

        .key-history-table tr:last-child td { border-bottom: none; }
        .key-history-table tr:hover td     { background: #f9fffe; }

        /* Revoke form */
        .revoke-form-box {
            border: 1px solid #e57373;
            border-radius: 10px;
            padding: 20px;
            background: #fffcfc;
            margin-top: 12px;
        }

        .revoke-form-box .form-label {
            display: block;
            font-size: 0.88em;
            font-weight: 600;
            color: #333;
            margin-bottom: 6px;
        }

        .revoke-form-box select,
        .revoke-form-box textarea {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #ddd;
            border-radius: 7px;
            font-size: 0.88em;
            font-family: inherit;
            margin-bottom: 14px;
            transition: border-color 0.2s;
        }

        .revoke-form-box select:focus,
        .revoke-form-box textarea:focus {
            outline: none;
            border-color: #00897b;
        }

        .revoke-form-box textarea {
            resize: vertical;
            min-height: 80px;
        }

        .revoke-form-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .empty-state {
            text-align: center;
            padding: 30px 0;
            color: #999;
        }

        .empty-state i {
            font-size: 2.5rem;
            margin-bottom: 10px;
            display: block;
            color: #b2dfdb;
        }
    </style>
</head>
<body class="user-dashboard-page">

<jsp:include page="common/header.jsp"/>

<div class="container">
    <jsp:include page="common/user-sidebar.jsp">
        <jsp:param name="activePage" value="quan-ly-khoa"/>
    </jsp:include>

    <main class="main-content">
        <h2 class="page-title">Quản lý khóa công khai</h2>

        <c:if test="${not empty flashSuccess}">
            <div class="key-alert key-alert-success">
                <i class="fa-solid fa-circle-check"></i> ${flashSuccess}
            </div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="key-alert key-alert-success">
                <i class="fa-solid fa-circle-check"></i> ${successMessage}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="key-alert key-alert-danger">
                <i class="fa-solid fa-circle-xmark"></i> ${errorMessage}
            </div>
            <c:remove var="errorMessage" scope="session" />
        </c:if>

        <div class="key-stats">
            <div class="key-stat-card">
                <div class="stat-number">${keyCount > 0 ? keyCount : 0}</div>
                <div class="stat-label">Tổng khóa</div>
            </div>
            <div class="key-stat-card">
                <div class="stat-number">${activeKey != null ? 1 : 0}</div>
                <div class="stat-label">Đang hoạt động</div>
            </div>
            <div class="key-stat-card">
                <div class="stat-number">DSA</div>
                <div class="stat-label">2048-bit</div>
            </div>
        </div>

        <div class="key-section">
            <div class="key-section-title">
                <i class="fa-solid fa-key"></i>
                Tạo cặp khóa mới
            </div>

            <div class="key-hint">
                Nhấn nút bên dưới để sinh cặp khóa DSA 2048-bit mới. Public key sẽ được lưu vào
                hệ thống, còn Private key sẽ hiển thị ngay để bạn tải về và lưu trữ an toàn.
                <br><br>
                <a href="huong-dan-bao-mat.jsp" style="color: #00695c; font-weight: 600; text-decoration: underline;">
                    <i class="fa-solid fa-book-open"></i> Xem Cẩm nang hướng dẫn sử dụng Khóa & Công cụ ký
                </a>
            </div>

            <form action="key" method="post">
                <input type="hidden" name="action" value="generateKey"/>
                <button type="submit" class="btn-primary-teal">
                    <i class="fa-solid fa-circle-plus"></i>
                    Tạo cặp khóa mới
                </button>
            </form>

            <c:if test="${not empty newPrivateKey}">
                <div style="margin-top: 20px;">
                    <div class="key-section-title">
                        <i class="fa-solid fa-lock"></i>
                        Private Key — Tải về ngay
                    </div>

                    <a href="key?action=downloadPrivateKey" class="btn-download">
                        <i class="fa-solid fa-download"></i>
                        Tải về private.key
                    </a>

                    <div class="key-alert key-alert-danger">
                        <strong><i class="fa-solid fa-triangle-exclamation"></i> Cảnh báo bảo mật:</strong>
                        <ul>
                            <li>Lưu file <code>private.key</code> ở nơi an toàn, không chia sẻ cho ai</li>
                            <li>Nếu mất Private Key, bạn sẽ không thể lấy lại</li>
                            <li>Chỉ tải về Private Key một lần duy nhất</li>
                            <li>Không lưu Private Key trên server hoặc cloud công cộng</li>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>

        <c:if test="${activeKey != null}">
            <div class="key-section">
                <div class="key-section-title">
                    <i class="fa-solid fa-shield-halved"></i>
                    Khóa công khai đang hoạt động
                </div>

                <div class="active-key-card">
                    <div class="active-key-card-header">
                        <div class="key-meta">
                            <strong>Khóa #${activeKey.id}</strong>
                            &nbsp;·&nbsp; Ngày tạo: ${activeKey.createdAt}
                        </div>
                        <span class="badge-active">
                            <i class="fa-solid fa-circle" style="font-size: 0.6em;"></i>
                            ACTIVE
                        </span>
                    </div>
                    <div class="active-key-card-body">
                        <div style="font-size: 0.82em; color: #666; margin-bottom: 6px; font-weight: 600;">
                            Public Key
                        </div>
                        <div class="public-key-display">${activeKey.publicKeyContent}</div>

                        <form action="key" method="post"
                              onsubmit="return confirm('Bạn có chắc muốn thu hồi khóa #${activeKey.id}?\nHành động này không thể hoàn tác!');">
                            <input type="hidden" name="action" value="reportLostKey"/>
                            <input type="hidden" name="keyId"  value="${activeKey.id}"/>
                            <button type="submit" class="btn-revoke">
                                <i class="fa-solid fa-ban"></i>
                                Báo mất / Thu hồi khóa
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </c:if>

        <div class="key-section">
            <div class="key-section-title">
                <i class="fa-solid fa-triangle-exclamation"></i>
                Báo mất / Thu hồi khóa
            </div>

            <div class="key-hint">
                Nếu bạn nghi ngờ Private Key bị lộ hoặc làm mất, hãy thu hồi khóa để vô hiệu hóa
                ngay lập tức. Khóa bị thu hồi không thể dùng để ký tài liệu mới.
            </div>

            <c:choose>
                <c:when test="${empty allKeys}">
                    <div class="empty-state">
                        <i class="fa-regular fa-key"></i>
                        <p>Không có khóa nào để quản lý. Vui lòng tạo cặp khóa mới trước.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="revokeBtnWrapper">
                        <button class="btn-revoke" onclick="showRevokeForm()">
                            <i class="fa-solid fa-ban"></i>
                            Thu hồi khóa
                        </button>
                    </div>

                    <div id="revokeFormBox" class="revoke-form-box" style="display: none;">
                        <form action="key" method="post"
                              onsubmit="return confirm('Bạn có chắc muốn thu hồi khóa đã chọn?\nHành động này không thể hoàn tác!');">
                            <input type="hidden" name="action" value="reportLostKey"/>

                            <label class="form-label" for="revokeKeyId">Chọn khóa cần thu hồi</label>
                            <select id="revokeKeyId" name="keyId" required>
                                <option value="">-- Chọn khóa --</option>
                                <c:forEach var="key" items="${allKeys}">
                                    <c:if test="${key.status == 'ACTIVE'}">
                                        <option value="${key.id}">
                                            Khóa #${key.id} (Tạo: ${key.createdAt})
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>

                            <label class="form-label" for="revokeReason">Lý do thu hồi (tùy chọn)</label>
                            <textarea id="revokeReason"
                                      name="reason"
                                      placeholder="Giải thích tại sao bạn thu hồi khóa này..."></textarea>

                            <div class="revoke-form-actions">
                                <button type="submit" class="btn-revoke">
                                    <i class="fa-solid fa-check"></i>
                                    Xác nhận thu hồi
                                </button>
                                <button type="button" class="btn-cancel" onclick="cancelRevoke()">
                                    <i class="fa-solid fa-xmark"></i>
                                    Hủy
                                </button>
                            </div>
                        </form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty allKeys}">
            <div class="key-section">
                <div class="key-section-title">
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    Lịch sử tất cả khóa
                </div>

                <div style="border: 1px solid #e0e0e0; border-radius: 10px; overflow: hidden;">
                    <table class="key-history-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ngày tạo</th>
                            <th>Trạng thái</th>
                            <th>Ngày thu hồi</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="key" items="${allKeys}">
                            <tr>
                                <td><strong>#${key.id}</strong></td>
                                <td>${key.createdAt}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${key.status == 'ACTIVE'}">
                                                <span class="badge-active">
                                                    <i class="fa-solid fa-circle" style="font-size: 0.6em;"></i>
                                                    ACTIVE
                                                </span>
                                        </c:when>
                                        <c:otherwise>
                                                <span class="badge-revoked">
                                                    <i class="fa-solid fa-ban" style="font-size: 0.7em;"></i>
                                                    REVOKED
                                                </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="color: #999;">
                                        ${key.revokedAt != null ? key.revokedAt : '—'}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>



    </main>
</div>

<jsp:include page="common/footer.jsp"/>

<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

<script>
    /* Back to top */
    var backToTopBtn = document.getElementById('backToTop');

    window.addEventListener('scroll', function () {
        backToTopBtn.style.display =
            (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200)
                ? 'block' : 'none';
    });

    backToTopBtn.addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    /* Revoke form toggle */
    function showRevokeForm() {
        document.getElementById('revokeFormBox').style.display   = 'block';
        document.getElementById('revokeBtnWrapper').style.display = 'none';
    }

    function cancelRevoke() {
        document.getElementById('revokeFormBox').style.display   = 'none';
        document.getElementById('revokeBtnWrapper').style.display = 'block';
    }
</script>

</body>
</html>