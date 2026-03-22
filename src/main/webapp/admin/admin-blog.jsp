<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Blog - Mộc Trà Admin</title>
    <link rel="stylesheet" href="../assets/css/base.css">
    <link rel="stylesheet" href="../assets/css/components.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

    <style>

        .bulk-actions-bar {
            position: fixed;
            bottom: -100px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            background: white;
            padding: 15px 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.15);
            border-radius: 8px;
            transition: bottom 0.3s ease-in-out;
            display: flex;
            gap: 20px;
            align-items: center;
            border: 1px solid #e0e0e0;
            min-width: 600px;
            justify-content: space-between;
        }

        .bulk-actions-bar.active {
            bottom: 30px;
        }

        .bulk-actions-info {
            font-size: 15px;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .bulk-actions-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-bulk {
            padding: 8px 16px;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
            font-size: 14px;
        }

        .btn-bulk i { font-size: 14px; }

        .btn-bulk-activate { background-color: #e6fffa; color: #047481; }
        .btn-bulk-activate:hover { background-color: #b2f5ea; }

        .btn-bulk-deactivate { background-color: #fffaf0; color: #9c4221; }
        .btn-bulk-deactivate:hover { background-color: #feebc8; }

        .btn-bulk-delete { background-color: #2d3748; color: white; }
        .btn-bulk-delete:hover { background-color: #1a202c; }

        .btn-bulk-cancel { background-color: transparent; color: #718096; border: 1px solid #cbd5e0; }
        .btn-bulk-cancel:hover { background-color: #f7fafc; color: #2d3748; }
    </style>
</head>
<body>
<div class="admin-container">
    <jsp:include page="/common/admin-sidebar.jsp">
        <jsp:param name="activePage" value="blog" />
    </jsp:include>

    <main class="admin-main">
        <header class="admin-header">
            <div class="header-left">
                <h1>Quản lý Blog</h1>
            </div>

            <div class="header-right">
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input id="adminBlogSearch" type="text" name="q" form="blogFilterForm"
                           value="${fn:escapeXml(currentQ)}"
                           placeholder="Tìm kiếm bài viết..."
                           autocomplete="off">
                </div>

                <a href="${pageContext.request.contextPath}/" class="view-site-btn" target="_blank" style="margin-left: 20px;">
                    <i class="fas fa-external-link-alt"></i>
                    <span>Xem trang web</span>
                </a>
            </div>
        </header>

        <div class="admin-content">
            <div class="page-header">
                <div class="page-title">
                    <h2>Danh sách bài viết</h2>
                    <p>Quản lý tất cả bài viết blog và nội dung website</p>
                </div>
                <div class="page-actions">
                    <a href="${pageContext.request.contextPath}/admin/blog/add" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        Thêm bài viết mới
                    </a>
                </div>
            </div>

            <div class="filters-section">
                <form id="blogFilterForm" method="get" action="${pageContext.request.contextPath}/admin/blog" class="filter-form">
                    <div class="filters-grid">
                        <div class="filter-group">
                            <label>Danh mục</label>
                            <select id="category-filter" class="form-select" name="category" onchange="this.form.submit()">
                                <option value="">Tất cả danh mục</option>
                                <c:forEach var="cat" items="${allCategories}">
                                    <option value="${cat.id}" ${currentCategory == cat.id ? 'selected' : ''}>${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="status-filter">Trạng thái</label>
                            <select id="status-filter" class="form-select" name="status" onchange="this.form.submit()">
                                <option value="">Tất cả trạng thái</option>
                                <option value="published" ${currentStatus == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                                <option value="draft" ${currentStatus == 'draft' ? 'selected' : ''}>Bản nháp</option>
                                <option value="archived" ${currentStatus == 'archived' ? 'selected' : ''}>Đã lưu trữ</option>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="author-filter">Tác giả</label>
                            <select id="author-filter" class="form-select" name="author" onchange="this.form.submit()">
                                <option value="">Tất cả tác giả</option>
                                <c:forEach var="author" items="${allAuthors}">
                                    <option value="${author.id}" ${currentAuthor == author.id ? 'selected' : ''}>
                                            ${author.displayName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="filter-group">
                            <label for="sort-filter">Sắp xếp</label>
                            <select id="sort-filter" class="form-select" name="sort" onchange="this.form.submit()">
                                <option value="date_desc" ${currentSort == 'date_desc' || empty currentSort ? 'selected' : ''}>Mới nhất</option>
                                <option value="date_asc" ${currentSort == 'date_asc' ? 'selected' : ''}>Cũ nhất</option>
                                <option value="title_asc" ${currentSort == 'title_asc' ? 'selected' : ''}>Tên A-Z</option>
                                <option value="title_desc" ${currentSort == 'title_desc' ? 'selected' : ''}>Tên Z-A</option>
                                <option value="views_desc" ${currentSort == 'views_desc' ? 'selected' : ''}>Xem nhiều nhất</option>
                                <option value="views_asc" ${currentSort == 'views_asc' ? 'selected' : ''}>Xem ít nhất</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>

            <div class="products-container">
                <div class="table-header">
                    <div class="products-count">Tổng số bài viết : <strong>${totalPosts}</strong></div>
                </div>

                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th style="width: 50px;">
                                <input type="checkbox" class="product-checkbox" id="selectAllCheckbox" onchange="toggleSelectAll(this)">
                            </th>
                            <th style="width: 80px;">Hình ảnh</th>
                            <th>Tiêu đề</th>
                            <th style="width: 130px;">Danh mục</th>
                            <th style="width: 150px;">Tác giả</th>
                            <th style="width: 120px;">Trạng thái</th>
                            <th style="width: 100px;">Lượt xem</th>
                            <th style="width: 120px;">Ngày tạo</th>
                            <th style="width: 130px; text-align: center;">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${empty posts}">
                            <tr>
                                <td colspan="9" style="text-align: center; padding: 30px;">Chưa có bài viết nào</td>
                            </tr>
                        </c:if>
                        <c:forEach var="post" items="${posts}">
                            <tr>
                                <td><input type="checkbox" class="product-checkbox row-checkbox" value="${post.id}" onchange="updateBulkActions()"></td>

                                <td><img src="${pageContext.request.contextPath}/${post.featuredImage}" alt="Blog image" class="product-image-thumb" style="width: 60px; height: 40px; object-fit: cover; border-radius: 4px;"></td>

                                <td>
                                    <div class="product-name-cell" style="font-weight: 500;">${post.title}</div>
                                    <div class="product-description-cell" style="font-size: 0.85rem; color: #666;">
                                            ${empty post.excerpt ? '' : post.excerpt}
                                    </div>
                                </td>

                                <td>
                                    <span class="category-badge health" style="background: #f0f4f8; color: #4a5568; padding: 4px 8px; border-radius: 4px; font-size: 0.8rem;">
                                            ${empty post.categoryId ? 'Chưa phân loại' : categoryMap[post.categoryId]}
                                    </span>
                                </td>
                                <td>
                                    <div class="author-name" style="font-weight: 500;">
                                            ${empty post.author ? '---' : post.author.displayName}
                                    </div>
                                    <small class="author-email" style="color: #718096;">
                                            ${empty post.author ? '' : post.author.email}
                                    </small>
                                </td>

                                <td>
                                    <c:choose>
                                        <c:when test="${post.status.name() == 'PUBLISHED'}">
                                            <span class="status-badge" style="background: #e6fffa; color: #047481; padding: 5px 10px; border-radius: 20px; font-size: 0.8rem;">ĐÃ XUẤT BẢN</span>
                                        </c:when>
                                        <c:when test="${post.status.name() == 'DRAFT'}">
                                            <span class="status-badge" style="background: #fff5f5; color: #c53030; padding: 5px 10px; border-radius: 20px; font-size: 0.8rem;">BẢN NHÁP</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge" style="background: #edf2f7; color: #4a5568; padding: 5px 10px; border-radius: 20px; font-size: 0.8rem;">LƯU TRỮ</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="views-count" style="display: flex; align-items: center; gap: 5px; color: #666;">
                                        <i class="fas fa-eye"></i>
                                        <span><fmt:formatNumber value="${post.viewsCount}" pattern="#,###"/></span>
                                    </div>
                                </td>
                                <td>
                                    <div style="font-weight: 500;"><fmt:formatDate value="${post.createdAtDate}" pattern="dd/MM/yyyy"/></div>
                                    <small style="color: #999;"><fmt:formatDate value="${post.createdAtDate}" pattern="HH:mm"/></small>
                                </td>

                                <td>
                                    <div class="action-buttons" style="justify-content: center;">
                                        <a class="btn-action" title="Xem chi tiết"
                                           href="${pageContext.request.contextPath}/admin/blog/detail?id=${post.id}">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a class="btn-action" title="Chỉnh sửa"
                                           href="${pageContext.request.contextPath}/admin/blog/edit?id=${post.id}">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <button class="btn-action danger" title="Xóa"
                                                onclick="deleteSinglePost(${post.id})">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination-container">
                    <div class="pagination-info">
                        Hiển thị <strong>${fromItem}-${toItem}</strong> trong tổng số <strong>${totalPosts}</strong> bài viết
                    </div>
                    <div class="pagination">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:url var="pageUrl" value="/admin/blog">
                                <c:param name="page" value="${i}" />
                                <c:if test="${not empty currentQ}"><c:param name="q" value="${currentQ}" /></c:if>
                                <c:if test="${not empty currentCategory}"><c:param name="category" value="${currentCategory}" /></c:if>
                                <c:if test="${not empty currentStatus}"><c:param name="status" value="${currentStatus}" /></c:if>
                                <c:if test="${not empty currentAuthor}"><c:param name="author" value="${currentAuthor}" /></c:if>
                                <c:if test="${not empty currentSort}"><c:param name="sort" value="${currentSort}" /></c:if>
                            </c:url>

                            <a href="${pageUrl}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="bulk-actions-bar" id="bulkActionsBar">
            <div class="bulk-actions-info">
                <input type="checkbox" class="product-checkbox" id="selectAllPosts" style="display:none"> <span style="font-weight: 500; color: #4a5568;">Đã chọn <strong id="selectedCount" style="color: #2b6cb0; font-size: 16px;">0</strong> bài viết</span>
            </div>
            <div class="bulk-actions-buttons">
                <button class="btn-bulk btn-bulk-activate" onclick="bulkPublish()">
                    <i class="fas fa-check-circle"></i>
                    Xuất bản
                </button>
                <button class="btn-bulk btn-bulk-deactivate" onclick="bulkArchive()">
                    <i class="fas fa-archive"></i>
                    Lưu trữ
                </button>
                <button class="btn-bulk btn-bulk-delete" onclick="bulkDelete()">
                    <i class="fas fa-trash"></i>
                    Xóa
                </button>
                <div style="width: 1px; height: 24px; background: #e2e8f0; margin: 0 5px;"></div>
                <button class="btn-bulk btn-bulk-cancel" onclick="cancelSelection()">
                    <i class="fas fa-times"></i>
                    Hủy
                </button>
            </div>
        </div>

    </main>
</div>

<script>

    function toggleSelectAll(checkbox) {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        rowCheckboxes.forEach(cb => {
            cb.checked = checkbox.checked;
        });
        updateBulkActions();
    }


    function updateBulkActions() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');
        const bulkActionsBar = document.getElementById('bulkActionsBar');
        const selectedCountSpan = document.getElementById('selectedCount');

        const checkedCount = Array.from(rowCheckboxes).filter(cb => cb.checked).length;
        const totalCount = rowCheckboxes.length;

        selectedCountSpan.textContent = checkedCount;

        if (checkedCount > 0) {
            bulkActionsBar.classList.add('active');
        } else {
            bulkActionsBar.classList.remove('active');
        }


        if (checkedCount === totalCount && totalCount > 0) {
            selectAllCheckbox.checked = true;
            selectAllCheckbox.indeterminate = false;
        } else if (checkedCount > 0) {
            selectAllCheckbox.checked = false;
            selectAllCheckbox.indeterminate = true;
        } else {
            selectAllCheckbox.checked = false;
            selectAllCheckbox.indeterminate = false;
        }
    }


    function getSelectedPosts() {
        return Array.from(document.querySelectorAll('.row-checkbox:checked'))
            .map(cb => parseInt(cb.value, 10))
            .filter(id => !isNaN(id));
    }

    function bulkPublish() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`Bạn có chắc muốn XUẤT BẢN \${selectedPosts.length} bài viết đã chọn?`)) {
            submitBulkForm(selectedPosts, 'published');
        }
    }

    function bulkArchive() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`Bạn có chắc muốn LƯU TRỮ \${selectedPosts.length} bài viết đã chọn?`)) {
            submitBulkForm(selectedPosts, 'archived');
        }
    }

    function bulkDelete() {
        const selectedPosts = getSelectedPosts();
        if (selectedPosts.length === 0) return;

        if (confirm(`CẢNH BÁO: Bạn có chắc muốn XÓA VĨNH VIỄN \${selectedPosts.length} bài viết?`)) {
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/admin/blog/delete';

            selectedPosts.forEach(id => {
                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'ids';
                input.value = id;
                form.appendChild(input);
            });

            document.body.appendChild(form);
            form.submit();
        }
    }


    function submitBulkForm(ids, status) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/admin/blog/change-status';

        ids.forEach(id => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'ids';
            input.value = id;
            form.appendChild(input);
        });

        const statusInput = document.createElement('input');
        statusInput.type = 'hidden';
        statusInput.name = 'status';
        statusInput.value = status;
        form.appendChild(statusInput);

        document.body.appendChild(form);
        form.submit();
    }

    function deleteSinglePost(postId) {
        if (!confirm('Bạn có chắc muốn xóa bài viết này?')) return;
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/admin/blog/delete';
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'ids';
        input.value = postId;
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }

    function cancelSelection() {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        const selectAllCheckbox = document.getElementById('selectAllCheckbox');

        rowCheckboxes.forEach(cb => cb.checked = false);
        selectAllCheckbox.checked = false;
        selectAllCheckbox.indeterminate = false;
        updateBulkActions();
    }


    (function () {
        const input = document.getElementById('adminBlogSearch');
        const form  = document.getElementById('blogFilterForm');
        if (!input || !form) return;

        let t;
        input.addEventListener('input', function () {
            clearTimeout(t);
            const v = input.value;
            if (/\s$/.test(v)) return;
            t = setTimeout(() => form.submit(), 900);
        });
    })();
</script>
</body>
</html>