<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hướng dẫn Bảo mật & Ký số - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .guide-header {
            background: linear-gradient(135deg, #00695c 0%, #00897b 100%);
            color: white;
            padding: 40px 20px;
            text-align: center;
            border-radius: 12px;
            margin-bottom: 30px;
        }
        .guide-header h1 { margin-bottom: 15px; font-size: 2.2rem; }
        .guide-header p { font-size: 1.1rem; opacity: 0.9; max-width: 700px; margin: 0 auto; line-height: 1.6; }

        .download-card {
            background: #e8f5e9;
            border: 2px dashed #4caf50;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            margin-bottom: 40px;
        }
        .btn-download-tool {
            display: inline-block;
            background: #2e7d32;
            color: white;
            padding: 15px 30px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s;
            box-shadow: 0 4px 6px rgba(46, 125, 50, 0.2);
        }
        .btn-download-tool:hover { background: #1b5e20; transform: translateY(-2px); color: white;}

        .step-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            display: flex;
            gap: 20px;
        }
        .step-number {
            background: #00897b;
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            flex-shrink: 0;
        }
        .step-content h3 { color: #333; margin-top: 0; margin-bottom: 10px; font-size: 1.3rem; }
        .step-content p { color: #555; line-height: 1.6; margin-bottom: 10px; }
        .step-content img { max-width: 100%; border: 1px solid #ddd; border-radius: 8px; margin-top: 10px; }
    </style>
</head>
<body class="user-dashboard-page">

<jsp:include page="common/header.jsp"/>

<div class="container" style="max-width: 1000px; margin: 40px auto; padding: 0 20px;">

    <div class="guide-header">
        <h1><i class="fa-solid fa-shield-halved"></i> Hướng dẫn Ký số Điện tử</h1>
        <p>Mộc Trà áp dụng công nghệ Chữ ký số thuật toán DSA 2048-bit để đảm bảo tính toàn vẹn dữ liệu. Không một ai (kể cả quản trị viên) có thể thay đổi đơn hàng của bạn sau khi đã ký xác nhận.</p>
    </div>

    <div class="download-card">
        <h2 style="color: #2e7d32; margin-bottom: 15px;">Công cụ Ký số CryptoApp</h2>
        <p style="color: #555; margin-bottom: 20px;">Bạn cần tải công cụ này về máy tính để tạo chữ ký cho đơn hàng. Công cụ hoàn toàn an toàn, chạy trực tiếp không cần cài đặt.</p>
        <a href="https://github.com/NhatNam-cmd/sign-tool-tea-web/releases/download/v1.0.0/CryptoApp_v1.1.exe" class="btn-download-tool">
            <i class="fa-brands fa-windows"></i> Tải CryptoApp cho Windows (.exe)
        </a>
    </div>

    <div class="steps-container">
        <div class="step-card">
            <div class="step-number">1</div>
            <div class="step-content">
                <h3>Tạo cặp khóa bảo mật</h3>
                <p>Truy cập vào trang <strong><a href="key" style="color: #00897b;">Quản lý khóa</a></strong> trong tài khoản của bạn. Bấm "Tạo cặp khóa mới".</p>
                <p>Hệ thống sẽ tải về máy bạn một file tên là <code>private.key</code>. <strong>Lưu ý:</strong> Hãy cất giữ file này ở nơi an toàn, đây là "con dấu" cá nhân của bạn để ký các đơn hàng sau này.</p>
            </div>
        </div>

        <div class="step-card">
            <div class="step-number">2</div>
            <div class="step-content">
                <h3>Đặt hàng & Lấy mã băm</h3>
                <p>Thực hiện mua sắm và thanh toán như bình thường. Sau khi đặt hàng, hệ thống sẽ đưa bạn đến trang xác thực và cung cấp một chuỗi <strong>Mã băm đơn hàng (SHA-256)</strong> màu cam.</p>
                <p>Hãy bấm nút <strong>Copy mã băm</strong> để sao chép chuỗi này.</p>
            </div>
        </div>

        <div class="step-card">
            <div class="step-number">3</div>
            <div class="step-content">
                <h3>Dùng CryptoApp để Ký</h3>
                <p>Mở công cụ CryptoApp mà bạn đã tải ở trên. Thực hiện lần lượt:</p>
                <ul style="color: #555; line-height: 1.6; margin-left: 20px;">
                    <li>Bấm <strong>Duyệt...</strong> và chọn đường dẫn đến file <code>private.key</code> của bạn.</li>
                    <li>Dán mã băm vừa copy trên web vào ô <strong>Mã băm</strong>.</li>
                    <li>Bấm <strong>▶ Chữ ký</strong>. Công cụ sẽ mã hóa và nhả ra một chuỗi chữ ký điện tử.</li>
                    <li>Bấm <strong>Sao chép</strong> để lấy chữ ký này.</li>
                </ul>
            </div>
        </div>

        <div class="step-card">
            <div class="step-number">4</div>
            <div class="step-content">
                <h3>Chốt đơn hàng</h3>
                <p>Quay lại trang web, dán chữ ký vừa sao chép vào ô <strong>Dán chữ ký điện tử</strong> và bấm <strong>Xác nhận đơn hàng</strong>. Nếu chữ ký hợp lệ, đơn hàng của bạn sẽ chính thức được ghi nhận vào hệ thống!</p>
            </div>
        </div>
    </div>

</div>

<jsp:include page="common/footer.jsp"/>
</body>
</html>