<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Khuyến Mãi - Mộc Trà Admin</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

    <style>

        .badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        .status-active { background-color: #e6fffa; color: #047481; }
        .status-inactive { background-color: #fff5f5; color: #c53030; }


        .modal-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
            z-index: 9999;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal-content {
            background: #fff;
            width: 800px;
            max-width: 95%;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transform: translateY(-20px);
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            max-height: 90vh;
        }

        .modal-overlay.active .modal-content { transform: translateY(0); }


        .modal-header {
            padding: 20px 24px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8f9fa;
        }

        .modal-header h3 {
            margin: 0;
            font-size: 1.25rem;
            color: #333;
            font-weight: 600;
        }

        .close-modal {
            font-size: 24px;
            color: #999;
            cursor: pointer;
            transition: color 0.2s;
            line-height: 1;
        }
        .close-modal:hover { color: #d32f2f; }


        .modal-body {
            padding: 24px;
            overflow-y: auto;
        }

        .form-grid-layout {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }

        .form-group { margin-bottom: 16px; }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 0.9rem;
        }

        .form-group label .required { color: red; margin-left: 4px; }

        .form-control {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 0.95rem;
            transition: border-color 0.2s, box-shadow 0.2s;
            background-color: #fff;
        }

        .form-control:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
            outline: none;
        }


        .upload-area {
            border: 2px dashed #cbd5e0;
            border-radius: 8px;
            background-color: #f8fafc;
            height: 180px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: all 0.2s;
            position: relative;
            overflow: hidden;
        }

        .upload-area:hover {
            border-color: #4CAF50;
            background-color: #f0fdf4;
        }

        .upload-placeholder {
            text-align: center;
            pointer-events: none;
        }

        .upload-placeholder i { font-size: 2rem; color: #a0aec0; margin-bottom: 8px; }
        .upload-placeholder p { color: #718096; font-size: 0.9rem; margin: 0; }

        .image-preview {
            width: 100%;
            height: 100%;
            object-fit: contain;
            display: none;
            background: #fff;
        }


        .modal-footer {
            padding: 16px 24px;
            border-top: 1px solid #eee;
            background-color: #f8f9fa;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn { padding: 10px 20px; border: none; border-radius: 6px; cursor: pointer; font-weight: 500; font-size: 0.95rem; transition: background 0.2s; }
        .btn-secondary { background-color: #e2e8f0; color: #4a5568; }
        .btn-secondary:hover { background-color: #cbd5e0; }
        .btn-primary {
            background-color: #007d88;
            color: white;
        }

        .btn-primary:hover {
            background-color: #006064;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px rgba(0, 125, 136, 0.2);
        }


        @media (max-width: 768px) {
            .form-grid-layout { grid-template-columns: 1fr; }
            .modal-content { width: 95%; margin: 10px; }
        }
    </style>
</head>
<body>
<div class="admin-container">
    <jsp:include page="/common/admin-sidebar.jsp">
        <jsp:param name="activePage" value="promotions" />
    </jsp:include>

    <main class="admin-main">
        <header class="admin-header">
            <div class="header-left">
                <h1>Quản lý Chương trình Khuyến mãi</h1>
            </div>
            <div class="header-right">
                <button class="btn btn-primary" onclick="openCreateModal()">
                    <i class="fas fa-plus"></i> Tạo chương trình mới
                </button>
            </div>
        </header>

        <div class="admin-content">
            <div class="products-container">
                <div class="table-responsive">
                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th>Ảnh</th>
                            <th>Thông tin chương trình</th>
                            <th>Giảm giá</th>
                            <th>Thời gian</th>
                            <th>Trạng thái</th>
                            <th style="text-align: center">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${promotionList}">
                            <fmt:formatNumber value="${p.discountValue}" pattern="#" var="cleanValue" />

                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${p.imageUrl}"
                                         alt="Promo" style="width: 80px; height: 50px; object-fit: cover; border-radius: 6px; border: 1px solid #eee;">
                                </td>
                                <td>
                                    <strong style="color: #2d3748; font-size: 1rem;">${p.name}</strong><br>
                                    <small style="color: #718096;">${p.description}</small>
                                </td>
                                <td>
                                    <c:if test="${p.discountType == 'PERCENT'}">
                                        <span class="badge" style="background: #e3f2fd; color: #0d47a1;">-${cleanValue}%</span>
                                    </c:if>
                                    <c:if test="${p.discountType == 'FIXED_AMOUNT'}">
                                        <span class="badge" style="background: #fff3e0; color: #e65100;">
                                            -<fmt:formatNumber value="${p.discountValue}" pattern="#,###"/>₫
                                        </span>
                                    </c:if>
                                </td>
                                <td>
                                    <div style="font-size: 0.85rem; line-height: 1.5;">
                                        <i class="far fa-calendar-alt" style="color: #4CAF50; width: 15px;"></i>
                                        <span>${fn:replace(p.startDate, 'T', ' ')}</span><br>
                                        <i class="far fa-calendar-times" style="color: #e53e3e; width: 15px;"></i>
                                        <span>${fn:replace(p.endDate, 'T', ' ')}</span>
                                    </div>
                                </td>
                                <td>
                                    <span class="status-badge ${p.active ? 'status-active' : 'status-inactive'}">
                                            ${p.active ? 'Đang chạy' : 'Đã tắt'}
                                    </span>
                                </td>
                                <td style="text-align: center">
                                    <div class="action-buttons" style="justify-content: center;">
                                        <button class="btn-action" title="Chỉnh sửa"
                                                onclick="openEditModal(this)"
                                                data-id="${p.id}"
                                                data-name="${p.name}"
                                                data-desc="${p.description}"
                                                data-type="${p.discountType}"
                                                data-value="${cleanValue}"
                                                data-start="${p.startDate}"
                                                data-end="${p.endDate}"
                                                data-image="${p.imageUrl}">
                                            <i class="fas fa-edit"></i>
                                        </button>

                                        <c:if test="${!p.active}">
                                            <button class="btn-action" title="Kích hoạt ngay" onclick="toggleStatus(${p.id}, true)" style="color: #38a169;">
                                                <i class="fas fa-play"></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${p.active}">
                                            <button class="btn-action" title="Tắt chương trình" onclick="toggleStatus(${p.id}, false)" style="color: #e53e3e;">
                                                <i class="fas fa-stop"></i>
                                            </button>
                                        </c:if>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty promotionList}">
                            <tr>
                                <td colspan="6" style="text-align: center; padding: 30px; color: #718096;">
                                    Chưa có chương trình khuyến mãi nào. Hãy tạo mới ngay!
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>

<div id="promoModal" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="modalTitle">Tạo chương trình khuyến mãi</h3>
            <span class="close-modal" onclick="closeModal()">&times;</span>
        </div>

        <form action="promotions" method="POST" enctype="multipart/form-data" id="promoForm">
            <input type="hidden" name="action" id="formAction" value="create">
            <input type="hidden" name="id" id="promoId" value="">
            <input type="hidden" name="current_image" id="currentImage" value="">

            <div class="modal-body">
                <div class="form-grid-layout">
                    <div class="left-col">
                        <div class="form-group">
                            <label>Tên chương trình <span class="required">*</span></label>
                            <input type="text" name="name" id="pName" class="form-control" required placeholder="Ví dụ: Sale 8/3, Mua 1 Tặng 1...">
                        </div>

                        <div class="form-group">
                            <label>Mô tả ngắn</label>
                            <textarea name="description" id="pDesc" class="form-control" rows="3" placeholder="Mô tả ngắn gọn hiển thị bên dưới tên"></textarea>
                        </div>

                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 12px;">
                            <div class="form-group">
                                <label>Loại giảm giá</label>
                                <select name="discount_type" id="pType" class="form-control">
                                    <option value="PERCENT">Phần trăm (%)</option>
                                    <option value="FIXED_AMOUNT">Tiền mặt (VNĐ)</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Giá trị giảm <span class="required">*</span></label>
                                <input type="number" name="discount_value" id="pValue" class="form-control" required min="0" placeholder="0">
                            </div>
                        </div>
                    </div>

                    <div class="right-col">
                        <div class="form-group">
                            <label>Thời gian bắt đầu <span class="required">*</span></label>
                            <input type="datetime-local" name="start_date" id="pStart" class="form-control" required step="1">
                        </div>

                        <div class="form-group">
                            <label>Thời gian kết thúc <span class="required">*</span></label>
                            <input type="datetime-local" name="end_date" id="pEnd" class="form-control" required step="1">
                        </div>

                        <div class="form-group">
                            <label>Banner / Ảnh đại diện</label>
                            <div class="upload-area" onclick="document.getElementById('imageInput').click()">
                                <div class="upload-placeholder" id="uploadPlaceholder">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                    <p>Nhấn để tải ảnh lên</p>
                                    <small style="color: #a0aec0">(Hỗ trợ JPG, PNG, WEBP)</small>
                                </div>
                                <img id="imagePreview" class="image-preview" src="" alt="Preview">
                            </div>
                            <input type="file" name="image" id="imageInput" style="display: none;" accept="image/*" onchange="handleImagePreview(this)">
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal()">Đóng</button>
                <button type="submit" class="btn btn-primary" id="btnSubmit">Lưu chương trình</button>
            </div>
        </form>
    </div>
</div>

<script>

    function handleImagePreview(input) {
        const preview = document.getElementById('imagePreview');
        const placeholder = document.getElementById('uploadPlaceholder');

        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                placeholder.style.display = 'none';
            }
            reader.readAsDataURL(input.files[0]);
        }
    }


    function openCreateModal() {
        document.getElementById('promoForm').reset();

        document.getElementById('modalTitle').innerText = "Tạo chương trình mới";
        document.getElementById('formAction').value = "create";
        document.getElementById('btnSubmit').innerText = "Tạo mới";
        document.getElementById('promoId').value = "";
        document.getElementById('currentImage').value = "";


        document.getElementById('imagePreview').style.display = 'none';
        document.getElementById('imagePreview').src = '';
        document.getElementById('uploadPlaceholder').style.display = 'block';

        document.getElementById('promoModal').classList.add('active');
    }


    function openEditModal(btn) {

        const id = btn.getAttribute('data-id');
        const name = btn.getAttribute('data-name');
        const desc = btn.getAttribute('data-desc');
        const type = btn.getAttribute('data-type');
        const value = btn.getAttribute('data-value');
        let start = btn.getAttribute('data-start');
        let end = btn.getAttribute('data-end');
        const image = btn.getAttribute('data-image');


        document.getElementById('modalTitle').innerText = "Cập nhật chương trình #" + id;
        document.getElementById('formAction').value = "update";
        document.getElementById('promoId').value = id;
        document.getElementById('pName').value = name;
        document.getElementById('pDesc').value = desc;
        document.getElementById('pType').value = type;
        document.getElementById('pValue').value = value;
        document.getElementById('currentImage').value = image;


        document.getElementById('pStart').value = start.replace(" ", "T");
        document.getElementById('pEnd').value = end.replace(" ", "T");


        const preview = document.getElementById('imagePreview');
        const placeholder = document.getElementById('uploadPlaceholder');

        if(image && image.trim() !== "") {
            preview.src = '${pageContext.request.contextPath}/' + image;
            preview.style.display = 'block';
            placeholder.style.display = 'none';
        } else {
            preview.style.display = 'none';
            placeholder.style.display = 'block';
        }

        document.getElementById('btnSubmit').innerText = "Lưu thay đổi";
        document.getElementById('promoModal').classList.add('active');
    }


    function closeModal() {
        document.getElementById('promoModal').classList.remove('active');
    }


    function toggleStatus(id, status) {
        let msg = status ?
            "Kích hoạt chương trình này? Khách hàng sẽ thấy ngay lập tức." :
            "CẢNH BÁO: Tắt chương trình này sẽ tự động GỠ BỎ tất cả sản phẩm đang tham gia. Bạn có chắc chắn không?";

        if(confirm(msg)) {
            const params = new URLSearchParams();
            params.append('action', 'toggle');
            params.append('id', id);
            params.append('status', status);

            fetch('${pageContext.request.contextPath}/admin/promotions', {
                method: 'POST',
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                body: params
            }).then(res => {
                if(res.ok) {
                    alert("Cập nhật thành công!");
                    location.reload();
                } else {
                    alert("Có lỗi xảy ra khi cập nhật trạng thái.");
                }
            }).catch(err => {
                console.error(err);
                alert("Lỗi kết nối server.");
            });
        }
    }


    window.onclick = function(event) {
        const modal = document.getElementById('promoModal');
        if (event.target == modal) {
            closeModal();
        }
    }
</script>
</body>
</html>