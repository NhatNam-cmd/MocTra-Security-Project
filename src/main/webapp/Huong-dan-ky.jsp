<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hướng Dẫn Ký Số Đơn Hàng – Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Roboto', sans-serif; color: #2d2d2d; background: #f8f9f6; }
        .top-bar a { color: #d4edda; text-decoration: none; margin-right: 20px; }
        .top-bar a:hover { color: #fff; }
        .top-bar .socials a { margin-right: 10px; }

        .breadcrumb { max-width: 1200px; margin: 20px auto 0; padding: 0 24px; font-size: 13px; color: #888; }
        .breadcrumb a { color: #107e84; text-decoration: none; }
        .breadcrumb span { margin: 0 6px; }

        .page-hero {
            background: linear-gradient(135deg, #107e84 0%, #0a5c61 100%);
            color: #fff;
            padding: 52px 24px 48px;
            text-align: center;
            margin-top: 24px;
        }
        .page-hero .badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255,255,255,0.15);
            border: 1px solid rgba(255,255,255,0.3);
            color: #d4f5f6;
            font-size: 12px;
            font-weight: 500;
            padding: 5px 14px;
            border-radius: 20px;
            margin-bottom: 18px;
        }
        .page-hero h1 { font-size: 32px; font-weight: 700; margin-bottom: 12px; }
        .page-hero p { font-size: 16px; color: rgba(255,255,255,0.8); max-width: 520px; margin: 0 auto; line-height: 1.6; }

        .guide-layout {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 24px 60px;
            display: grid;
            grid-template-columns: 240px 1fr;
            gap: 36px;
            align-items: start;
        }

        .sidebar-nav {
            background: #fff;
            border: 1px solid #d0e8ea;
            border-radius: 12px;
            padding: 20px 0;
            position: sticky;
            top: 84px;
        }
        .sidebar-nav h4 {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #999;
            padding: 0 20px 12px;
            border-bottom: 1px solid #e0edef;
            margin-bottom: 8px;
        }
        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px 20px;
            font-size: 14px;
            color: #444;
            text-decoration: none;
            border-left: 3px solid transparent;
            transition: all .15s;
        }
        .sidebar-nav a:hover { color: #107e84; background: #eef8f9; border-left-color: #107e84; }
        .sidebar-nav a i { font-size: 15px; color: #107e84; width: 18px; }
        .sidebar-nav .step-num {
            width: 22px; height: 22px;
            background: #d6f0f1;
            color: #107e84;
            border-radius: 50%;
            font-size: 11px;
            font-weight: 700;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }

        .download-banner {
            background: linear-gradient(135deg, #107e84 0%, #0a6268 100%);
            border-radius: 14px;
            padding: 28px 32px;
            display: flex;
            align-items: center;
            gap: 24px;
            color: #fff;
            margin-bottom: 32px;
        }
        .dl-icon {
            width: 60px; height: 60px;
            background: rgba(255,255,255,0.15);
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 28px;
            flex-shrink: 0;
        }
        .dl-info { flex: 1; }
        .dl-info h3 { font-size: 18px; font-weight: 700; margin-bottom: 4px; }
        .dl-info p { font-size: 13px; color: rgba(255,255,255,0.75); }
        .dl-info .meta { font-size: 12px; color: rgba(255,255,255,0.55); margin-top: 6px; }
        .btn-download {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background: #fff;
            color: #107e84;
            font-weight: 700;
            font-size: 14px;
            padding: 13px 24px;
            border-radius: 8px;
            text-decoration: none;
            white-space: nowrap;
            transition: transform .15s, box-shadow .15s;
        }
        .btn-download:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(0,0,0,0.18); }
        .btn-download i { font-size: 18px; }

        .steps-container { display: flex; flex-direction: column; gap: 28px; }

        .step-card {
            background: #fff;
            border: 1px solid #d0e8ea;
            border-radius: 14px;
            overflow: hidden;
        }
        .step-header {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 20px 28px;
            border-bottom: 1px solid #e5f2f3;
            background: #f4fbfb;
        }
        .step-number {
            width: 40px; height: 40px;
            background: #107e84;
            color: #fff;
            border-radius: 50%;
            font-size: 16px;
            font-weight: 700;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
        }
        .step-header h2 { font-size: 17px; font-weight: 700; color: #0a3d40; }
        .step-header .step-tag {
            margin-left: auto;
            font-size: 11px;
            background: #d6f0f1;
            color: #107e84;
            padding: 3px 10px;
            border-radius: 20px;
            font-weight: 500;
        }

        .step-body { padding: 24px 28px; }

        .step-desc {
            font-size: 15px;
            line-height: 1.7;
            color: #444;
            margin-bottom: 20px;
        }

        .img-placeholder {
            background: #eef8f9;
            border: 2px dashed #7ecfd3;
            border-radius: 10px;
            height: 220px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            color: #50a8ad;
            font-size: 14px;
            margin: 20px 0;
        }
        .img-placeholder i { font-size: 36px; }
        .img-placeholder span { font-size: 12px; color: #aaa; }

        .sub-steps {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 16px;
        }
        .sub-steps li {
            display: flex;
            gap: 12px;
            align-items: flex-start;
            font-size: 14px;
            line-height: 1.6;
            color: #444;
        }
        .sub-steps li .bullet {
            width: 24px; height: 24px;
            border-radius: 50%;
            background: #d6f0f1;
            color: #107e84;
            font-size: 12px;
            font-weight: 700;
            display: flex; align-items: center; justify-content: center;
            flex-shrink: 0;
            margin-top: 1px;
        }

        .note-box {
            display: flex;
            gap: 12px;
            background: #fff8e1;
            border: 1px solid #ffe082;
            border-left: 4px solid #f9a825;
            border-radius: 0 8px 8px 0;
            padding: 14px 18px;
            margin-top: 18px;
            font-size: 14px;
            line-height: 1.6;
            color: #5d4037;
        }
        .note-box i { color: #f9a825; font-size: 18px; margin-top: 1px; flex-shrink: 0; }

        .security-box {
            display: flex;
            gap: 12px;
            background: #fce4ec;
            border: 1px solid #f48fb1;
            border-left: 4px solid #c62828;
            border-radius: 0 8px 8px 0;
            padding: 14px 18px;
            margin-top: 18px;
            font-size: 14px;
            line-height: 1.6;
            color: #7b1a1a;
        }
        .security-box i { color: #c62828; font-size: 18px; margin-top: 1px; flex-shrink: 0; }

        .success-box {
            display: flex;
            gap: 12px;
            background: #e8f5e9;
            border: 1px solid #a5d6a7;
            border-left: 4px solid #2e7d32;
            border-radius: 0 8px 8px 0;
            padding: 14px 18px;
            margin-top: 18px;
            font-size: 14px;
            line-height: 1.6;
            color: #1b5e20;
        }
        .success-box i { color: #2e7d32; font-size: 18px; margin-top: 1px; flex-shrink: 0; }

        .key-visual {
            background: #0d1117;
            border-radius: 10px;
            padding: 16px 20px;
            margin: 16px 0;
            font-family: 'Courier New', monospace;
            font-size: 12px;
            color: #58d68d;
            line-height: 1.6;
            overflow: hidden;
            position: relative;
        }
        .key-visual .kv-label {
            font-family: 'Roboto', sans-serif;
            font-size: 11px;
            font-weight: 700;
            color: #7f8c8d;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }
        .key-visual .kv-fade {
            position: absolute;
            bottom: 0; left: 0; right: 0;
            height: 40px;
            background: linear-gradient(transparent, #0d1117);
        }

        .faq-section {
            background: #fff;
            border: 1px solid #d0e8ea;
            border-radius: 14px;
            padding: 28px;
            margin-top: 32px;
        }
        .faq-section h2 { font-size: 18px; font-weight: 700; color: #0a3d40; margin-bottom: 20px; }
        .faq-item { border-bottom: 1px solid #e5f2f3; padding: 16px 0; }
        .faq-item:last-child { border-bottom: none; padding-bottom: 0; }
        .faq-q { font-size: 15px; font-weight: 500; color: #0a3d40; margin-bottom: 8px; display: flex; gap: 10px; }
        .faq-q i { color: #107e84; font-size: 16px; margin-top: 2px; }
        .faq-a { font-size: 14px; color: #666; line-height: 1.7; padding-left: 26px; }

        .support-box {
            background: #eef8f9;
            border: 1px solid #b2dfe2;
            border-radius: 14px;
            padding: 24px 28px;
            margin-top: 28px;
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .support-icon {
            width: 50px; height: 50px;
            background: #107e84;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            color: #fff;
            font-size: 22px;
            flex-shrink: 0;
        }
        .support-box h3 { font-size: 15px; font-weight: 700; color: #0a3d40; margin-bottom: 4px; }
        .support-box p { font-size: 13px; color: #666; }
        .support-links { display: flex; gap: 10px; margin-top: 10px; flex-wrap: wrap; }
        .support-link-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 7px 16px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
            text-decoration: none;
            border: 1px solid #107e84;
            color: #107e84;
            background: #fff;
            transition: all .15s;
        }
        .support-link-btn:hover { background: #107e84; color: #fff; }

        .back-to-top {
            position: fixed;
            bottom: 28px;
            right: 28px;
            width: 44px; height: 44px;
            background: #107e84;
            color: #fff;
            border: none;
            border-radius: 50%;
            font-size: 16px;
            cursor: pointer;
            display: flex; align-items: center; justify-content: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            transition: transform .15s;
        }
        .back-to-top:hover { transform: translateY(-2px); }
    </style>
</head>
<body>

<jsp:include page="common/header.jsp"></jsp:include>

<main>
    <div class="breadcrumb">
        <a href="/">Trang chủ</a>
        <span>/</span>
        <a href="/ho-tro">Hỗ trợ</a>
        <span>/</span>
        Hướng dẫn ký số đơn hàng
    </div>

    <section class="page-hero">
        <div class="badge">
            <i class="fa-solid fa-shield-halved"></i>
            Bảo mật & Xác thực
        </div>
        <h1>Hướng Dẫn Ký Số Đơn Hàng</h1>
        <p>Xác nhận đơn hàng an toàn bằng chữ ký số DSA 2048-bit. Khóa bí mật chỉ bạn mới có – Mộc Trà không lưu trữ.</p>
    </section>

    <div class="guide-layout">

        <aside class="sidebar-nav">
            <h4>Nội dung hướng dẫn</h4>
            <a href="#download"><i class="fa-solid fa-download"></i> Tải công cụ ký số</a>
            <a href="#buoc-1"><span class="step-num">1</span> Cài đặt phần mềm</a>
            <a href="#buoc-2"><span class="step-num">2</span> Tạo cặp khóa & tải Private Key</a>
            <a href="#buoc-3"><span class="step-num">3</span> Ký số đơn hàng</a>
            <a href="#buoc-4"><span class="step-num">4</span> Gửi file đã ký</a>
            <a href="#faq"><i class="fa-solid fa-circle-question"></i> Câu hỏi thường gặp</a>
            <a href="#ho-tro"><i class="fa-solid fa-headset"></i> Liên hệ hỗ trợ</a>
        </aside>

        <div>

            <div class="download-banner" id="download">
                <div class="dl-icon"><i class="fa-solid fa-pen-nib"></i></div>
                <div class="dl-info">
                    <h3>Công cụ ký số Mộc Trà</h3>
                    <p>Phần mềm ký số chính thức – sử dụng thuật toán DSA 2048-bit, bảo mật chuẩn doanh nghiệp.</p>
                    <div class="meta">
                        <i class="fa-solid fa-windows"></i> Windows 10/11 &nbsp;·&nbsp;
                        <i class="fa-solid fa-file"></i> Phiên bản 2.1.0 &nbsp;·&nbsp;
                        <i class="fa-solid fa-weight-hanging"></i> 18 MB
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/download-ky-so" class="btn-download">
                    <i class="fa-solid fa-download"></i>
                    Tải về (.exe)
                </a>
            </div>

            <div class="steps-container">

                <div class="step-card" id="buoc-1">
                    <div class="step-header">
                        <div class="step-number">1</div>
                        <h2>Cài đặt phần mềm ký số</h2>
                        <span class="step-tag">~3 phút</span>
                    </div>
                    <div class="step-body">
                        <p class="step-desc">
                            Sau khi tải file <strong>MocTra-KySo-Setup.exe</strong> từ nút bên trên, tiến hành cài đặt theo hướng dẫn. Bạn chỉ cần thực hiện bước này một lần duy nhất.
                        </p>
                        <ul class="sub-steps">
                            <li>
                                <span class="bullet">a</span>
                                <span>Nhấn đúp vào file <strong>.exe</strong> vừa tải về. Nếu Windows hiện cảnh báo <em>"Unknown publisher"</em>, chọn <strong>Run anyway</strong> – phần mềm đã được kiểm duyệt an toàn.</span>
                            </li>
                            <li>
                                <span class="bullet">b</span>
                                <span>Cửa sổ cài đặt xuất hiện. Nhấn <strong>Next</strong> và chấp nhận điều khoản sử dụng.</span>
                            </li>
                            <li>
                                <span class="bullet">c</span>
                                <span>Giữ thư mục mặc định hoặc chọn nơi khác, rồi nhấn <strong>Install</strong>.</span>
                            </li>
                            <li>
                                <span class="bullet">d</span>
                                <span>Nhấn <strong>Finish</strong>. Biểu tượng phần mềm xuất hiện trên Desktop – quá trình cài đặt hoàn tất.</span>
                            </li>
                        </ul>

                        <div class="img-placeholder">
                            <i class="fa-regular fa-image"></i>
                            <strong>Hình minh họa: Cửa sổ cài đặt phần mềm</strong>
                            <span>[ Thêm ảnh chụp màn hình bước cài đặt tại đây ]</span>
                        </div>

                        <div class="note-box">
                            <i class="fa-solid fa-triangle-exclamation"></i>
                            <span><strong>Yêu cầu hệ thống:</strong> Windows 10 trở lên và .NET Framework 4.8. Nếu máy chưa có, bộ cài sẽ tự động hướng dẫn tải thêm.</span>
                        </div>
                    </div>
                </div>

                <div class="step-card" id="buoc-2">
                    <div class="step-header">
                        <div class="step-number">2</div>
                        <h2>Tạo cặp khóa & tải về Private Key</h2>
                        <span class="step-tag">~2 phút</span>
                    </div>
                    <div class="step-body">
                        <p class="step-desc">
                            Trước khi ký lần đầu, bạn cần tạo cặp khóa DSA 2048-bit. Hệ thống sẽ lưu <strong>Public Key</strong> vào tài khoản Mộc Trà của bạn để xác minh chữ ký. <strong>Private Key</strong> sẽ hiển thị ngay để bạn tải về – Mộc Trà không lưu trữ và không thể phục hồi nếu bạn mất.
                        </p>
                        <ul class="sub-steps">
                            <li>
                                <span class="bullet">a</span>
                                <span>Đăng nhập tài khoản Mộc Trà, vào mục <strong>Quản lý khóa</strong> trong trang cá nhân.</span>
                            </li>
                            <li>
                                <span class="bullet">b</span>
                                <span>Nhấn nút <strong>"Tạo cặp khóa mới"</strong>. Hệ thống sinh cặp khóa DSA 2048-bit tức thì.</span>
                            </li>
                            <li>
                                <span class="bullet">c</span>
                                <span>Public Key được lưu tự động vào hệ thống. <strong>Private Key hiển thị ngay tại màn hình</strong> – nhấn <strong>"Tải về private.key"</strong> ngay lập tức.</span>
                            </li>
                            <li>
                                <span class="bullet">d</span>
                                <span>Lưu file <code>private.key</code> vào nơi an toàn trên máy tính của bạn – ổ USB riêng hoặc thư mục mã hóa được khuyến nghị.</span>
                            </li>
                        </ul>

                        <div class="key-visual">
                            <div class="kv-label">Private Key (DSA 2048-bit) – ví dụ minh họa</div>
MIICXAIBADCCAjUGByqGSM44BAEwggInAoIBAQC9TXZuarpv6v
tiHrPSVG28y7FnjuvNxjo6sSWHz79NgbnQ1GpxBgzObgJ58KuH
FObp0dbhdARrbi0eYd1SYRpXKwOjxSzNggooi/6JxEKPWKpk0U
0CaD+aWxGWPhL3SCBnDcJoBBXsZWtzQAjPbpUhLYpH51kjviDR
IZ3l5zsBLQ0pqwudemYXeI9sCkvwRGMn/qdgYHnM423krcw17n
jSVkvaAmYchU5Feo9a4tGU8YzRY+AOzKkwuDycpAlbk4...
                            <div class="kv-fade"></div>
                        </div>

                        <div class="img-placeholder">
                            <i class="fa-regular fa-image"></i>
                            <strong>Hình minh họa: Trang Quản lý khóa – Tạo cặp khóa & tải Private Key</strong>
                            <span>[ Thêm ảnh chụp màn hình tại đây ]</span>
                        </div>

                        <div class="security-box">
                            <i class="fa-solid fa-lock"></i>
                            <span><strong>Quan trọng về bảo mật:</strong> Mộc Trà <strong>không lưu trữ</strong> Private Key của bạn dưới bất kỳ hình thức nào. Nếu bạn mất file <code>private.key</code>, bạn sẽ cần tạo lại cặp khóa mới và đăng ký lại với hệ thống. Không chia sẻ Private Key với bất kỳ ai, kể cả nhân viên Mộc Trà.</span>
                        </div>
                    </div>
                </div>

                <div class="step-card" id="buoc-3">
                    <div class="step-header">
                        <div class="step-number">3</div>
                        <h2>Ký số đơn hàng bằng Private Key</h2>
                        <span class="step-tag">~2 phút</span>
                    </div>
                    <div class="step-body">
                        <p class="step-desc">
                            Mở phần mềm ký số Mộc Trà, nạp file đơn hàng và file Private Key để tạo chữ ký số. Chữ ký DSA có giá trị pháp lý theo Luật Giao dịch điện tử 2023.
                        </p>
                        <ul class="sub-steps">
                            <li>
                                <span class="bullet">a</span>
                                <span>Mở phần mềm <strong>Mộc Trà Ký Số</strong> từ Desktop. Nhấn <strong>"Mở file đơn hàng"</strong> và chọn file PDF đơn hàng nhận từ email.</span>
                            </li>
                            <li>
                                <span class="bullet">b</span>
                                <span>Nhấn <strong>"Chọn Private Key"</strong> và dẫn đến file <code>private.key</code> bạn đã lưu ở bước 2.</span>
                            </li>
                            <li>
                                <span class="bullet">c</span>
                                <span>Kiểm tra kỹ toàn bộ thông tin đơn hàng hiển thị trong phần mềm trước khi tiếp tục. Sau khi ký, nội dung không thể thay đổi.</span>
                            </li>
                            <li>
                                <span class="bullet">d</span>
                                <span>Nhấn nút <strong>"Ký Số"</strong> (màu xanh). Phần mềm tạo chữ ký DSA và đính vào file đơn hàng tự động.</span>
                            </li>
                        </ul>

                        <div class="img-placeholder">
                            <i class="fa-regular fa-image"></i>
                            <strong>Hình minh họa: Giao diện phần mềm – Nạp Private Key và ký số</strong>
                            <span>[ Thêm ảnh chụp màn hình tại đây ]</span>
                        </div>

                        <div class="img-placeholder">
                            <i class="fa-regular fa-image"></i>
                            <strong>Hình minh họa: Màn hình xác nhận ký thành công</strong>
                            <span>[ Thêm ảnh chụp màn hình tại đây ]</span>
                        </div>

                        <div class="success-box">
                            <i class="fa-solid fa-circle-check"></i>
                            <span>Khi ký thành công, phần mềm hiển thị thông báo <strong>"Đã ký số – Hợp lệ"</strong> và tự động lưu file đã ký với hậu tố <code>_signed.pdf</code>.</span>
                        </div>
                    </div>
                </div>

<%--                <div class="step-card" id="buoc-4">--%>
<%--                    <div class="step-header">--%>
<%--                        <div class="step-number">4</div>--%>
<%--                        <h2>Gửi file đã ký cho Mộc Trà</h2>--%>
<%--                        <span class="step-tag">~1 phút</span>--%>
<%--                    </div>--%>
<%--                    <div class="step-body">--%>
<%--                        <p class="step-desc">--%>
<%--                            Sau khi ký xong, gửi file <code>_signed.pdf</code> về Mộc Trà qua một trong các cách bên dưới. Hệ thống sẽ tự động xác minh chữ ký bằng Public Key đã đăng ký.--%>
<%--                        </p>--%>
<%--                        <ul class="sub-steps">--%>
<%--                            <li>--%>
<%--                                <span class="bullet">a</span>--%>
<%--                                <span>Nhấn <strong>"Gửi qua Email"</strong> trong phần mềm – file tự động đính kèm và gửi về <a href="mailto:orders@moctra.com" style="color:#107e84;">orders@moctra.com</a>.</span>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <span class="bullet">b</span>--%>
<%--                                <span>Hoặc đăng nhập <a href="/tai-khoan/don-hang" style="color:#107e84;">Cổng quản lý đơn hàng</a>, vào đơn hàng tương ứng và nhấn <strong>"Tải lên xác nhận ký số"</strong>.</span>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <span class="bullet">c</span>--%>
<%--                                <span>Hệ thống xác minh chữ ký tự động bằng Public Key của bạn. Nếu hợp lệ, trạng thái đơn hàng chuyển sang <strong>"Đã xác nhận"</strong> ngay lập tức.</span>--%>
<%--                            </li>--%>
<%--                        </ul>--%>

<%--                        <div class="img-placeholder">--%>
<%--                            <i class="fa-regular fa-image"></i>--%>
<%--                            <strong>Hình minh họa: Tải file đã ký lên cổng đơn hàng</strong>--%>
<%--                            <span>[ Thêm ảnh chụp màn hình tại đây ]</span>--%>
<%--                        </div>--%>

<%--                        <div class="success-box">--%>
<%--                            <i class="fa-solid fa-circle-check"></i>--%>
<%--                            <span>Sau khi xác minh thành công, đội ngũ Mộc Trà xử lý đơn hàng trong <strong>vòng 24 giờ làm việc</strong>. Bạn sẽ nhận thông báo qua email và SMS.</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

            </div>

            <div class="faq-section" id="faq">
                <h2><i class="fa-solid fa-circle-question" style="color:#107e84; margin-right:8px;"></i>Câu hỏi thường gặp</h2>

                <div class="faq-item">
                    <div class="faq-q"><i class="fa-solid fa-chevron-right"></i> Mộc Trà có lưu Private Key của tôi không?</div>
                    <p class="faq-a">Không. Mộc Trà chỉ lưu Public Key để xác minh chữ ký. Private Key được sinh ra phía máy khách và chỉ hiển thị một lần duy nhất ngay sau khi tạo. Bạn có trách nhiệm tải về và bảo quản an toàn.</p>
                </div>

                <div class="faq-item">
                    <div class="faq-q"><i class="fa-solid fa-chevron-right"></i> Tôi mất file private.key thì làm thế nào?</div>
                    <p class="faq-a">Hệ thống không thể phục hồi Private Key đã mất. Bạn cần vào trang <strong>Quản lý khóa</strong>, thu hồi cặp khóa cũ và tạo cặp khóa mới. Public Key mới sẽ tự động cập nhật vào hệ thống.</p>
                </div>

                <div class="faq-item">
                    <div class="faq-q"><i class="fa-solid fa-chevron-right"></i> Chữ ký DSA có giá trị pháp lý không?</div>
                    <p class="faq-a">Có. Chữ ký số DSA 2048-bit tuân thủ Luật Giao dịch điện tử 2023 và Nghị định 130/2018/NĐ-CP, có giá trị pháp lý tương đương chữ ký tay trong các giao dịch thương mại điện tử.</p>
                </div>

                <div class="faq-item">
                    <div class="faq-q"><i class="fa-solid fa-chevron-right"></i> Phần mềm có hỗ trợ macOS hoặc Linux không?</div>
                    <p class="faq-a">Hiện tại phần mềm chỉ hỗ trợ Windows 10 và Windows 11. Phiên bản macOS đang phát triển, dự kiến ra mắt Quý 3/2026. Trong thời gian chờ, bạn có thể liên hệ hỗ trợ để ký qua cổng web.</p>
                </div>

                <div class="faq-item">
                    <div class="faq-q"><i class="fa-solid fa-chevron-right"></i> Tôi có thể ký nhiều đơn hàng cùng lúc không?</div>
                    <p class="faq-a">Có. Phần mềm hỗ trợ ký hàng loạt. Vào menu <strong>Tệp → Ký nhiều file</strong>, chọn tất cả file PDF cần ký, chọn Private Key một lần và xác nhận – toàn bộ file được ký đồng thời.</p>
                </div>
            </div>

            <div class="support-box" id="ho-tro">
                <div class="support-icon"><i class="fa-solid fa-headset"></i></div>
                <div>
                    <h3>Cần hỗ trợ thêm?</h3>
                    <p>Đội ngũ hỗ trợ kỹ thuật làm việc từ <strong>8:00 – 21:00</strong>, kể cả cuối tuần.</p>
                    <div class="support-links">
                        <a href="tel:0888531015" class="support-link-btn"><i class="fa-solid fa-phone"></i> 0888 531 015</a>
                        <a href="mailto:contact@moctra.com" class="support-link-btn"><i class="fa-solid fa-envelope"></i> contact@moctra.com</a>
                        <a href="#" class="support-link-btn"><i class="fa-brands fa-facebook-messenger"></i> Chat Messenger</a>
                        <a href="#" class="support-link-btn"><i class="fa-brands fa-youtube"></i> Video hướng dẫn</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>

<jsp:include page="common/footer.jsp"></jsp:include>

<button class="back-to-top" id="backToTop" title="Lên đầu trang" onclick="window.scrollTo({top:0,behavior:'smooth'})">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>
