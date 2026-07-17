-- Cập nhật ngày: 24/05/2026
-- Nội dung: Thêm bảng quản lý khóa và các cột phục vụ Chữ ký điện tử (PKI)

-- 1. Tạo bảng lưu trữ Khóa Công Khai (Public Key)
CREATE TABLE `user_keys` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `user_id` int(11) NOT NULL,
                             `public_key_content` text NOT NULL COMMENT 'Nội dung chuỗi Public Key',
                             `status` enum('ACTIVE','REVOKED') DEFAULT 'ACTIVE' COMMENT 'ACTIVE: Đang dùng, REVOKED: Đã báo mất',
                             `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Thời điểm tạo khóa',
                             `revoked_at` timestamp NULL DEFAULT NULL COMMENT 'Thời điểm báo mất khóa',
                             PRIMARY KEY (`id`),
                             KEY `fk_user_keys_user` (`user_id`),
                             CONSTRAINT `fk_user_keys_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. Thêm các cột bảo mật vào bảng orders
ALTER TABLE `orders`
    ADD COLUMN `order_hash` varchar(255) DEFAULT NULL COMMENT 'Mã băm SHA-256 của đơn hàng',
ADD COLUMN `signature` text DEFAULT NULL COMMENT 'Chữ ký điện tử sinh ra từ Tool',
ADD COLUMN `public_key_id` int(11) DEFAULT NULL COMMENT 'Khóa ngoại trỏ về bảng user_keys',
ADD COLUMN `is_tampered` tinyint(1) DEFAULT 0 COMMENT '0: An toàn, 1: Bị sửa đổi trái phép';

-- 3. Thêm khóa ngoại để liên kết đơn hàng với khóa Public Key
ALTER TABLE `orders`
    ADD CONSTRAINT `fk_order_public_key` FOREIGN KEY (`public_key_id`) REFERENCES `user_keys` (`id`) ON DELETE SET NULL;
-- Snapshot product display data for order items.
-- Keeps old orders stable when product name or image changes later.

ALTER TABLE `order_items`
    ADD COLUMN `product_name_snapshot` varchar(255) DEFAULT NULL AFTER `product_id`,
    ADD COLUMN `product_image_snapshot` varchar(500) DEFAULT NULL AFTER `product_name_snapshot`;