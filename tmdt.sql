/*
 Navicat Premium Data Transfer

 Source Server         : Web
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : tmdt

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 22/12/2022 02:40:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` tinyint(1) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (0, 'admin', 'admin', 'ducminh0573@gmail..com', NULL, 1, '1');
INSERT INTO `account` VALUES (2, 'minh12345', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '123@gmail.com', '0124564214', 0, '1');
INSERT INTO `account` VALUES (37, 'leducminh74', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'besttroll1111@gmail.com', NULL, 0, '1');
INSERT INTO `account` VALUES (41, 'minh1234', '3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'ducminh0573@gmail.com', '01545464', 2, '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int NOT NULL,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Apple');
INSERT INTO `category` VALUES (2, 'Samsung');
INSERT INTO `category` VALUES (3, 'Xiaomi');
INSERT INTO `category` VALUES (4, 'Oppo');
INSERT INTO `category` VALUES (5, 'Vivo');
INSERT INTO `category` VALUES (6, 'Nokia');
INSERT INTO `category` VALUES (7, 'Realme');

-- ----------------------------
-- Table structure for info_user
-- ----------------------------
DROP TABLE IF EXISTS `info_user`;
CREATE TABLE `info_user`  (
  `user_id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info_user
-- ----------------------------
INSERT INTO `info_user` VALUES (39, 'Lê Đức Minh', 'Hồ Chí Minh');
INSERT INTO `info_user` VALUES (40, NULL, NULL);
INSERT INTO `info_user` VALUES (41, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `total` decimal(10, 2) NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`orders_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (117, 41, 292.90, '1', 'Minh', 'Linh chiểu, Thủ Đức', '0346082073', '2022-12-22 02:32:30', '2022-12-22 02:32:30', 1);

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail`  (
  `orders_detail_id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp,
  `status` int NOT NULL DEFAULT 1,
  `sid` int NOT NULL,
  PRIMARY KEY (`orders_detail_id`) USING BTREE,
  INDEX `orders_id`(`orders_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `orders_detail_ibfk_1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------
INSERT INTO `orders_detail` VALUES (163, 117, 4, 85.30, 2, '2022-12-22 02:32:30', '2022-12-22 02:32:30', 1, 0);
INSERT INTO `orders_detail` VALUES (164, 117, 5, 122.30, 1, '2022-12-22 02:32:30', '2022-12-22 02:32:30', 1, 0);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `payment_id` int NOT NULL,
  `payment_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (1, 'Thanh toán khi nhận hàng ');
INSERT INTO `payment` VALUES (2, 'Đã thanh toán ');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `brand` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `salient_features` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `sellprice` decimal(10, 2) NOT NULL,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `total_sold` int NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `account` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (3, 2, 'iPhone 14 Pro Max 128GB', 'Xanh dương', 'Apple', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 64.00, 60.00, 'iPhone 14 Pro Max 128GB.jpg', 17, 89, 1, '2022-01-12 16:11:47');
INSERT INTO `product` VALUES (4, 0, 'iPhone 13 Pro Max 128GB', 'Trắng', 'Apple', 'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 H', 'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao. Không gian hiển thị sống động - Màn hình 6.7\" Super Retina XDR độ sáng cao, sắc nét. Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học. ', 89.30, 85.30, 'iPhone 13 Pro Max 128GB.jpg', 89, 99, 1, '2022-01-11 17:11:47');
INSERT INTO `product` VALUES (5, 0, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 'Đỏ', 'Samsung', 'Samsung Galaxy S22 Ultra 5G 512GB - là chiếc điện thoại Galaxy S đầu tiên hỗ trợ bút S Pen tích hợp bên trong thân máy, có nhiều cải tiến về camera, màn hình ấn tượng hơn và hỗ trợ sạc 45 W nhanh hơn.', 'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm). Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh. S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác. Dung lương pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W.', 124.50, 122.30, 'Samsung Galaxy S22 Ultra (12GB - 512GB).jpg', 93, 98, 2, '2022-01-10 16:11:47');
INSERT INTO `product` VALUES (8, 0, 'Xiaomi 12T Pro', 'Đen', 'Xiaomi', 'Cuối cùng Xiaomi 12T Pro 5G cũng đã chính thức lộ diện trên thị trường sau hàng loạt thông tin rò rỉ về thông số, đúng như dự đoán thì độ phân giải trên camera của phiên bản này được nhà sản xuất nâng cấp lên đến 200 MP, giúp máy trở thành thiết bị có khả', 'Kiến tạo siêu khoảnh khắc - Hệ thống camera 200MP, chống rung quang học OIS và ống kính 8P. Thiết kế siêu việt - Trọn vẻ đẹp sang trọng, đẳng cấp, vỏ nhám chống bám vân tay, khung kim loại cứng cáp, độc đáo. Đạt đến sự ưu việt một cách dễ dàng - Chipset S', 123.60, 120.50, 'Xiaomi 12T Pro.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (26, 0, 'OPPO Reno6 Z 5G', 'Trắng', 'Oppo', 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “s', 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 173g. Tăng tốc kết nối, dẫn đầu xu hướng - Dimensity 800U 5G 8 nhân mạnh mẽ, kết nối 5G siêu nhanh. Chuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64MP, sắc nét, ấn tượng. Màn hìn', 50.30, 45.00, 'Vivo Y16.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (27, 2, 'Vivo V23e', 'Trắng', 'Vivo', 'Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh.', 'Hiển thị chân thực, sống động - Màn hình 6.44\" AMOLED Full HD. Hiệu năng mạnh mẽ vượt trội - Chip MediaTek Helio G96, RAM mở rộng đến 12GB, Android 11 mượt mà. Làm chủ mọi khung hình - Cụm 3 camera sau lên đến 64MP, camera selfie 50MP. Thiết kế mỏng nhẹ, ', 72.70, 68.10, 'Nokia G21.jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (29, 37, 'Nokia G21', 'Đỏ ', 'Nokia', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 89.90, 85.30, 'Realme 9i 6GB 128GB.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (30, 0, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nh', 'Bộ 3 camera AI sắc nét 13MP tính hợp ứng dụng camera từ Google cho những bức ảnh hoàn hảo. Màn hình siêu rộng 6.7\" chuẩn HD+ mang đến trải nghiệm giải trí chất lượng cao với hình ảnh sống động. Hệ điều hành Android 12 mới nhất với tính năng bảo mật chia s', 92.70, 90.00, 'Realme C11 (2021).jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (35, 0, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 'Đỏ', 'Samsung', 'Samsung Galaxy S22 Ultra 5G 512GB - là chiếc điện thoại Galaxy S đầu tiên hỗ trợ bút S Pen tích hợp bên trong thân máy, có nhiều cải tiến về camera, màn hình ấn tượng hơn và hỗ trợ sạc 45 W nhanh hơn.', 'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm). Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh. S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác. Dung lương pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W.', 96.30, 90.00, 'Xiaomi 12T Pro.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (36, 2, 'Samsung Galaxy M32', 'Trắng', 'Samsung', 'Samsung Galaxy M32 chiếc smartphone được trang bị hiệu năng ổn định cùng dung lượng pin khủng 6000 mAh, đi đầu với màn hình Super AMOLED đầy đột phá của Samsung mang đến trải nghiệm đầy thú vị với giá cả phải chăng mà người dùng không nên bỏ qua.', 'Tái hiện khung hình sắc nét, ấn tượng - Màn hình Super AMOLED 6.4 inch với độ phân giải Full HD+, 90Hz. Bắt trọn mọi khoảng khắc qua camera chuyên nghiệp - Camera sau lên đến 64MP, hỗ trợ chụp toàn cảnh, chụp chân dung ấn tượng. Xử lý mọi thao tác mượt mà', 88.50, 85.70, 'Xiaomi Redmi Note 11S.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (38, 37, 'Xiaomi Redmi Note 11S', 'Xanh lá', 'Xiaomi', 'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', 'Thiết kế tinh tế, cuốn hút - Mỏng nhẹ thời trang, nhỏ gọn trong tay. Trọn vẹn từng khung hình - Màn hình 6.43\" FHD+ AMOLED DotDisplay, 90Hz. Chụp ảnh chuyên nghiệp - Cụm 4 camera sau 108MP, hỗ trợ đa dạng chế độ chụp. Pin siêu lớn cùng khả năng sạc siêu t', 116.20, 110.10, 'OPPO Reno6 Z 5G.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (43, 0, 'Nokia G21', 'Đỏ ', 'Nokia', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 92.70, 90.30, 'iPhone 14 Pro Max 128GB.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (44, 2, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nh', 'Bộ 3 camera AI sắc nét 13MP tính hợp ứng dụng camera từ Google cho những bức ảnh hoàn hảo. Màn hình siêu rộng 6.7\" chuẩn HD+ mang đến trải nghiệm giải trí chất lượng cao với hình ảnh sống động. Hệ điều hành Android 12 mới nhất với tính năng bảo mật chia s', 76.40, 72.10, 'iPhone 13 Pro Max 128GB.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (46, 37, 'Realme C11 (2021)', 'Đen', 'Realme', 'Các dòng smartphone giá rẻ ngày càng được ưa chuộng trên thị trường di động, nắm bắt được nhu cầu đó hãng điện thoại Realme cũng đã cho ra mắt Realme C11 (2021) là một phiên bản đồng tên gọi với Realme C11 ra mắt trước đó.', 'Hiển thị rõ ràng, sắc nét - Màn hình HD+ 6.5 inch, hiển thị theo tỷ lệ 20:9. Hiệu năng ổn định, giải trí thoải mái - Chịp Spreadtrum SC9863A, 2GB RAM, Android 11. Thỏa sức sử dụng suốt ngày dài - Pin \"khủng\" tận 5000mAh, sạc 10W. Camera AI chụp đêm rõ nét', 110.80, 98.10, 'Samsung Galaxy M32.jpg', 97, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (47, 0, 'iPhone 14 Pro Max 128GB', 'Xanh dương', 'Apple', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 112.50, 109.20, 'Xiaomi 12T Pro.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (48, 0, 'iPhone 13 Pro Max 128GB', 'Trắng', 'Apple', 'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 H', 'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao. Không gian hiển thị sống động - Màn hình 6.7\" Super Retina XDR độ sáng cao, sắc nét. Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học. ', 92.60, 90.80, 'Xiaomi Redmi Note 11S.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (53, 0, 'OPPO Reno8', 'Đỏ', 'Oppo', 'Reno8 - sản phẩm tầm trung được OPPO đầu tư kỹ lưỡng về thiết kế lẫn cấu hình, khi sở hữu vẻ ngoài vuông vức hợp xu hướng, hiệu năng ổn định mang đến trải nghiệm mượt mà cùng với cụm camera có khả năng chụp ảnh đẹp mắt.', 'Chuyên gia chân dung, bừng sáng khoảnh khắc đêm - Cụm camera 64Mp + 2MP + 2MP hiện đại. Dẫn đầu xu hướng nhờ thiết kế tinh xảo, cao cấp và mỏng nhẹ, phù hợp với trải nghiệm hằng ngày. Sạc nhanh siêu tốc, tràn đầy năng lượng cho cả ngày - Viên pin 4500mAh,', 92.40, 89.20, 'Nokia G21.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (54, 2, 'OPPO Reno6 Z 5G', 'Trắng', 'Oppo', 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “s', 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 173g. Tăng tốc kết nối, dẫn đầu xu hướng - Dimensity 800U 5G 8 nhân mạnh mẽ, kết nối 5G siêu nhanh. Chuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64MP, sắc nét, ấn tượng. Màn hìn', 98.40, 90.00, 'Nokia C31 4GB 128GB.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (56, 37, 'Vivo Y16', 'Trắng ', 'Vivo', 'Vivo Y16 tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang lại cho người dùng những trải nghiệm ', 'Cuốn hút từ ánh nhìn đầu tiên - Thiết kế khung viền phẳng sang trọng, màu sắc họa tiết ánh sao. Hình ảnh sống động đến bất ngờ - Màn hình IPS LCD 6.51 inch, chế độ bảo vệ mắt thông minh. Hiệu suất ấn tượng với chip MediaTek Helio P35, RAM 4GB + mở rộng 1G', 210.40, 200.00, 'iPhone 13 Pro Max 128GB.jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (57, 0, 'Nokia G21', 'Đỏ ', 'Nokia', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 250.30, 244.70, 'Samsung Galaxy S22 Ultra (12GB - 512GB).jpg', 96, 96, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (58, 0, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nh', 'Bộ 3 camera AI sắc nét 13MP tính hợp ứng dụng camera từ Google cho những bức ảnh hoàn hảo. Màn hình siêu rộng 6.7\" chuẩn HD+ mang đến trải nghiệm giải trí chất lượng cao với hình ảnh sống động. Hệ điều hành Android 12 mới nhất với tính năng bảo mật chia s', 110.40, 102.50, 'Samsung Galaxy M32.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (59, 0, 'Realme 9i 6GB 128GB', 'Xanh dương', 'Realme', 'Realme 9i ra mắt với sự đón nhận và quan tâm của giới công nghệ khi sở hữu nhiều ưu điểm nổi bật như thiết kế đẹp mắt, cấu hình tốt và viên pin dung lượng cao cho thời gian sử dụng cả ngày.', 'Hiệu năng vượt trội - Chip Qualcomm Snapdragon 680 6nm, mở rộng RAM 11GB. Bền bỉ cả ngày dài - Viên pin lớn 5000mAh, sạc nhanh 33W. Trải nghiệm màn hình mượt mà, rõ nét - Kích thước siêu lớn 6.6\" cùng tần số quét 90Hz. Bắt trọn từng khung ảnh - Bộ 3 camer', 89.40, 80.80, 'Xiaomi 12T Pro.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (60, 0, 'Realme C11 (2021)', 'Đen', 'Realme', 'Các dòng smartphone giá rẻ ngày càng được ưa chuộng trên thị trường di động, nắm bắt được nhu cầu đó hãng điện thoại Realme cũng đã cho ra mắt Realme C11 (2021) là một phiên bản đồng tên gọi với Realme C11 ra mắt trước đó.', 'Hiển thị rõ ràng, sắc nét - Màn hình HD+ 6.5 inch, hiển thị theo tỷ lệ 20:9. Hiệu năng ổn định, giải trí thoải mái - Chịp Spreadtrum SC9863A, 2GB RAM, Android 11. Thỏa sức sử dụng suốt ngày dài - Pin \"khủng\" tận 5000mAh, sạc 10W. Camera AI chụp đêm rõ nét', 300.50, 289.90, 'Xiaomi Redmi Note 11S.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (61, 2, 'Versace Eros ', 'If you are used to seeing Versace Eros as a dynamic, young man, now Versace Eros EDP will appear as an experienced man, lingering more or less dust in his eyes. The fact that this guy was inherently wild, is now even more attractive by his dusty, dusty lo', 'Versace', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 110.50, 102.70, 'OPPO Reno8.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (63, 37, 'iPhone 13 Pro Max 128GB', 'Trắng', 'Apple', 'Samsung Galaxy S22 Ultra 5G 512GB - là chiếc điện thoại Galaxy S đầu tiên hỗ trợ bút S Pen tích hợp bên trong thân máy, có nhiều cải tiến về camera, màn hình ấn tượng hơn và hỗ trợ sạc 45 W nhanh hơn.', 'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm). Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh. S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác. Dung lương pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W.', 72.30, 77.10, 'Vivo V23e.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (64, 0, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 'Đỏ', 'Samsung', 'Samsung Galaxy M32 chiếc smartphone được trang bị hiệu năng ổn định cùng dung lượng pin khủng 6000 mAh, đi đầu với màn hình Super AMOLED đầy đột phá của Samsung mang đến trải nghiệm đầy thú vị với giá cả phải chăng mà người dùng không nên bỏ qua.', 'Tái hiện khung hình sắc nét, ấn tượng - Màn hình Super AMOLED 6.4 inch với độ phân giải Full HD+, 90Hz. Bắt trọn mọi khoảng khắc qua camera chuyên nghiệp - Camera sau lên đến 64MP, hỗ trợ chụp toàn cảnh, chụp chân dung ấn tượng. Xử lý mọi thao tác mượt mà', 65.40, 60.00, 'Vivo Y16.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (65, 0, 'Samsung Galaxy M32', 'Trắng', 'Samsung', 'Cuối cùng Xiaomi 12T Pro 5G cũng đã chính thức lộ diện trên thị trường sau hàng loạt thông tin rò rỉ về thông số, đúng như dự đoán thì độ phân giải trên camera của phiên bản này được nhà sản xuất nâng cấp lên đến 200 MP, giúp máy trở thành thiết bị có khả', 'Kiến tạo siêu khoảnh khắc - Hệ thống camera 200MP, chống rung quang học OIS và ống kính 8P. Thiết kế siêu việt - Trọn vẻ đẹp sang trọng, đẳng cấp, vỏ nhám chống bám vân tay, khung kim loại cứng cáp, độc đáo. Đạt đến sự ưu việt một cách dễ dàng - Chipset S', 72.70, 70.50, 'Nokia G21.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (66, 0, 'Xiaomi 12T Pro', 'Đen', 'Xiaomi', 'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', 'Thiết kế tinh tế, cuốn hút - Mỏng nhẹ thời trang, nhỏ gọn trong tay. Trọn vẹn từng khung hình - Màn hình 6.43\" FHD+ AMOLED DotDisplay, 90Hz. Chụp ảnh chuyên nghiệp - Cụm 4 camera sau 108MP, hỗ trợ đa dạng chế độ chụp. Pin siêu lớn cùng khả năng sạc siêu t', 89.80, 87.50, 'Nokia C31 4GB 128GB.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (67, 0, 'Xiaomi Redmi Note 11S', 'Xanh lá', 'Xiaomi', 'Reno8 - sản phẩm tầm trung được OPPO đầu tư kỹ lưỡng về thiết kế lẫn cấu hình, khi sở hữu vẻ ngoài vuông vức hợp xu hướng, hiệu năng ổn định mang đến trải nghiệm mượt mà cùng với cụm camera có khả năng chụp ảnh đẹp mắt.', 'Chuyên gia chân dung, bừng sáng khoảnh khắc đêm - Cụm camera 64Mp + 2MP + 2MP hiện đại. Dẫn đầu xu hướng nhờ thiết kế tinh xảo, cao cấp và mỏng nhẹ, phù hợp với trải nghiệm hằng ngày. Sạc nhanh siêu tốc, tràn đầy năng lượng cho cả ngày - Viên pin 4500mAh,', 92.60, 89.80, 'iPhone 14 Pro Max 128GB.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (68, 0, 'OPPO Reno8', 'Đỏ', 'Oppo', 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “s', 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 173g. Tăng tốc kết nối, dẫn đầu xu hướng - Dimensity 800U 5G 8 nhân mạnh mẽ, kết nối 5G siêu nhanh. Chuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64MP, sắc nét, ấn tượng. Màn hìn', 75.50, 72.10, 'iPhone 13 Pro Max 128GB.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (69, 0, 'OPPO Reno6 Z 5G', 'Trắng', 'Oppo', 'Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh.', 'Hiển thị chân thực, sống động - Màn hình 6.44\" AMOLED Full HD. Hiệu năng mạnh mẽ vượt trội - Chip MediaTek Helio G96, RAM mở rộng đến 12GB, Android 11 mượt mà. Làm chủ mọi khung hình - Cụm 3 camera sau lên đến 64MP, camera selfie 50MP. Thiết kế mỏng nhẹ, ', 68.40, 65.80, 'Samsung Galaxy S22 Ultra (12GB - 512GB).jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (70, 0, 'Vivo V23e', 'Trắng', 'Vivo', 'Vivo Y16 tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang lại cho người dùng những trải nghiệm ', 'Cuốn hút từ ánh nhìn đầu tiên - Thiết kế khung viền phẳng sang trọng, màu sắc họa tiết ánh sao. Hình ảnh sống động đến bất ngờ - Màn hình IPS LCD 6.51 inch, chế độ bảo vệ mắt thông minh. Hiệu suất ấn tượng với chip MediaTek Helio P35, RAM 4GB + mở rộng 1G', 89.20, 87.60, 'Samsung Galaxy M32.jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (71, 0, 'Vivo Y16', 'Trắng ', 'Vivo', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 127.40, 120.40, 'Xiaomi 12T Pro.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (72, 0, 'Nokia G21', 'Đỏ ', 'Nokia', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nh', 'Bộ 3 camera AI sắc nét 13MP tính hợp ứng dụng camera từ Google cho những bức ảnh hoàn hảo. Màn hình siêu rộng 6.7\" chuẩn HD+ mang đến trải nghiệm giải trí chất lượng cao với hình ảnh sống động. Hệ điều hành Android 12 mới nhất với tính năng bảo mật chia s', 130.50, 117.50, 'Xiaomi Redmi Note 11S.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (73, 2, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Realme 9i ra mắt với sự đón nhận và quan tâm của giới công nghệ khi sở hữu nhiều ưu điểm nổi bật như thiết kế đẹp mắt, cấu hình tốt và viên pin dung lượng cao cho thời gian sử dụng cả ngày.', 'Hiệu năng vượt trội - Chip Qualcomm Snapdragon 680 6nm, mở rộng RAM 11GB. Bền bỉ cả ngày dài - Viên pin lớn 5000mAh, sạc nhanh 33W. Trải nghiệm màn hình mượt mà, rõ nét - Kích thước siêu lớn 6.6\" cùng tần số quét 90Hz. Bắt trọn từng khung ảnh - Bộ 3 camer', 92.70, 90.00, 'OPPO Reno8.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (75, 37, 'Realme C11 (2021)', 'Đen', 'Realme', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 111.30, 105.70, 'Vivo V23e.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (76, 0, 'iPhone 14 Pro Max 128GB', 'Xanh dương', 'Apple', 'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 H', 'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao. Không gian hiển thị sống động - Màn hình 6.7\" Super Retina XDR độ sáng cao, sắc nét. Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học. ', 95.40, 90.00, 'Vivo Y16.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (77, 0, 'iPhone 13 Pro Max 128GB', 'Trắng', 'Apple', 'Samsung Galaxy S22 Ultra 5G 512GB - là chiếc điện thoại Galaxy S đầu tiên hỗ trợ bút S Pen tích hợp bên trong thân máy, có nhiều cải tiến về camera, màn hình ấn tượng hơn và hỗ trợ sạc 45 W nhanh hơn.', 'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm). Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh. S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác. Dung lương pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W.', 88.70, 75.00, 'Nokia G21.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (78, 0, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 'Đỏ', 'Samsung', 'Samsung Galaxy M32 chiếc smartphone được trang bị hiệu năng ổn định cùng dung lượng pin khủng 6000 mAh, đi đầu với màn hình Super AMOLED đầy đột phá của Samsung mang đến trải nghiệm đầy thú vị với giá cả phải chăng mà người dùng không nên bỏ qua.', 'Tái hiện khung hình sắc nét, ấn tượng - Màn hình Super AMOLED 6.4 inch với độ phân giải Full HD+, 90Hz. Bắt trọn mọi khoảng khắc qua camera chuyên nghiệp - Camera sau lên đến 64MP, hỗ trợ chụp toàn cảnh, chụp chân dung ấn tượng. Xử lý mọi thao tác mượt mà', 96.30, 90.00, 'Nokia C31 4GB 128GB.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (79, 0, 'Samsung Galaxy M32', 'Trắng', 'Samsung', 'Cuối cùng Xiaomi 12T Pro 5G cũng đã chính thức lộ diện trên thị trường sau hàng loạt thông tin rò rỉ về thông số, đúng như dự đoán thì độ phân giải trên camera của phiên bản này được nhà sản xuất nâng cấp lên đến 200 MP, giúp máy trở thành thiết bị có khả', 'Kiến tạo siêu khoảnh khắc - Hệ thống camera 200MP, chống rung quang học OIS và ống kính 8P. Thiết kế siêu việt - Trọn vẻ đẹp sang trọng, đẳng cấp, vỏ nhám chống bám vân tay, khung kim loại cứng cáp, độc đáo. Đạt đến sự ưu việt một cách dễ dàng - Chipset S', 88.50, 85.70, 'Realme 9i 6GB 128GB.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (80, 0, 'Xiaomi 12T Pro', 'Đen', 'Xiaomi', 'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', 'Thiết kế tinh tế, cuốn hút - Mỏng nhẹ thời trang, nhỏ gọn trong tay. Trọn vẹn từng khung hình - Màn hình 6.43\" FHD+ AMOLED DotDisplay, 90Hz. Chụp ảnh chuyên nghiệp - Cụm 4 camera sau 108MP, hỗ trợ đa dạng chế độ chụp. Pin siêu lớn cùng khả năng sạc siêu t', 121.30, 110.30, 'Realme C11 (2021).jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (81, 0, 'Xiaomi Redmi Note 11S', 'Xanh lá', 'Xiaomi', 'Reno8 - sản phẩm tầm trung được OPPO đầu tư kỹ lưỡng về thiết kế lẫn cấu hình, khi sở hữu vẻ ngoài vuông vức hợp xu hướng, hiệu năng ổn định mang đến trải nghiệm mượt mà cùng với cụm camera có khả năng chụp ảnh đẹp mắt.', 'Chuyên gia chân dung, bừng sáng khoảnh khắc đêm - Cụm camera 64Mp + 2MP + 2MP hiện đại. Dẫn đầu xu hướng nhờ thiết kế tinh xảo, cao cấp và mỏng nhẹ, phù hợp với trải nghiệm hằng ngày. Sạc nhanh siêu tốc, tràn đầy năng lượng cho cả ngày - Viên pin 4500mAh,', 116.20, 110.10, 'iPhone 14 Pro Max 128GB.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (82, 0, 'OPPO Reno8', 'Đỏ', 'Oppo', 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “s', 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 173g. Tăng tốc kết nối, dẫn đầu xu hướng - Dimensity 800U 5G 8 nhân mạnh mẽ, kết nối 5G siêu nhanh. Chuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64MP, sắc nét, ấn tượng. Màn hìn', 85.00, 74.00, 'iPhone 13 Pro Max 128GB.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (83, 0, 'OPPO Reno6 Z 5G', 'Trắng', 'Oppo', 'Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh.', 'Hiển thị chân thực, sống động - Màn hình 6.44\" AMOLED Full HD. Hiệu năng mạnh mẽ vượt trội - Chip MediaTek Helio G96, RAM mở rộng đến 12GB, Android 11 mượt mà. Làm chủ mọi khung hình - Cụm 3 camera sau lên đến 64MP, camera selfie 50MP. Thiết kế mỏng nhẹ, ', 98.20, 90.80, 'Samsung Galaxy S22 Ultra (12GB - 512GB).jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (84, 0, 'Vivo V23e', 'Trắng', 'Vivo', 'Vivo Y16 tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang lại cho người dùng những trải nghiệm ', 'Cuốn hút từ ánh nhìn đầu tiên - Thiết kế khung viền phẳng sang trọng, màu sắc họa tiết ánh sao. Hình ảnh sống động đến bất ngờ - Màn hình IPS LCD 6.51 inch, chế độ bảo vệ mắt thông minh. Hiệu suất ấn tượng với chip MediaTek Helio P35, RAM 4GB + mở rộng 1G', 123.60, 120.50, 'Samsung Galaxy M32.jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (85, 2, 'Vivo Y16', 'Trắng ', 'Vivo', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 88.40, 80.00, 'Xiaomi 12T Pro.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (87, 37, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Realme 9i ra mắt với sự đón nhận và quan tâm của giới công nghệ khi sở hữu nhiều ưu điểm nổi bật như thiết kế đẹp mắt, cấu hình tốt và viên pin dung lượng cao cho thời gian sử dụng cả ngày.', 'Hiệu năng vượt trội - Chip Qualcomm Snapdragon 680 6nm, mở rộng RAM 11GB. Bền bỉ cả ngày dài - Viên pin lớn 5000mAh, sạc nhanh 33W. Trải nghiệm màn hình mượt mà, rõ nét - Kích thước siêu lớn 6.6\" cùng tần số quét 90Hz. Bắt trọn từng khung ảnh - Bộ 3 camer', 126.80, 120.00, 'OPPO Reno8.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (88, 0, 'Realme 9i 6GB 128GB', 'Xanh dương', 'Realme', 'Các dòng smartphone giá rẻ ngày càng được ưa chuộng trên thị trường di động, nắm bắt được nhu cầu đó hãng điện thoại Realme cũng đã cho ra mắt Realme C11 (2021) là một phiên bản đồng tên gọi với Realme C11 ra mắt trước đó.', 'Hiển thị rõ ràng, sắc nét - Màn hình HD+ 6.5 inch, hiển thị theo tỷ lệ 20:9. Hiệu năng ổn định, giải trí thoải mái - Chịp Spreadtrum SC9863A, 2GB RAM, Android 11. Thỏa sức sử dụng suốt ngày dài - Pin \"khủng\" tận 5000mAh, sạc 10W. Camera AI chụp đêm rõ nét', 150.30, 135.50, 'OPPO Reno6 Z 5G.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (89, 0, 'Realme C11 (2021)', 'Đen', 'Realme', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 144.70, 123.60, 'Vivo V23e.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (90, 0, 'iPhone 14 Pro Max 128GB', 'Xanh dương', 'Apple', 'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 H', 'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao. Không gian hiển thị sống động - Màn hình 6.7\" Super Retina XDR độ sáng cao, sắc nét. Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học. ', 100.00, 98.99, 'Vivo Y16.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (91, 0, 'iPhone 13 Pro Max 128GB', 'Trắng', 'Apple', 'Samsung Galaxy S22 Ultra 5G 512GB - là chiếc điện thoại Galaxy S đầu tiên hỗ trợ bút S Pen tích hợp bên trong thân máy, có nhiều cải tiến về camera, màn hình ấn tượng hơn và hỗ trợ sạc 45 W nhanh hơn.', 'Vi xử lý mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm). Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh. S Pen đầu tiên trên Galaxy S - Độ trễ thấp, dễ thao tác. Dung lương pin bất chấp ngày đêm - Viên pin 5000mAh, sạc nhanh 45W.', 89.40, 85.00, 'Nokia G21.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (92, 2, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 'Đỏ', 'Samsung', 'Samsung Galaxy M32 chiếc smartphone được trang bị hiệu năng ổn định cùng dung lượng pin khủng 6000 mAh, đi đầu với màn hình Super AMOLED đầy đột phá của Samsung mang đến trải nghiệm đầy thú vị với giá cả phải chăng mà người dùng không nên bỏ qua.', 'Tái hiện khung hình sắc nét, ấn tượng - Màn hình Super AMOLED 6.4 inch với độ phân giải Full HD+, 90Hz. Bắt trọn mọi khoảng khắc qua camera chuyên nghiệp - Camera sau lên đến 64MP, hỗ trợ chụp toàn cảnh, chụp chân dung ấn tượng. Xử lý mọi thao tác mượt mà', 75.50, 72.30, 'Nokia C31 4GB 128GB.jpg', 100, 100, 2, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (94, 37, 'Xiaomi 12T Pro', 'Đen', 'Xiaomi', 'Điện thoại Xiaomi Redmi Note 11S sẵn sàng đem đến cho bạn những trải nghiệm vô cùng hoàn hảo về chơi game, các tác vụ sử dụng hằng ngày hay sự ấn tượng từ vẻ đẹp bên ngoài.', 'Thiết kế tinh tế, cuốn hút - Mỏng nhẹ thời trang, nhỏ gọn trong tay. Trọn vẹn từng khung hình - Màn hình 6.43\" FHD+ AMOLED DotDisplay, 90Hz. Chụp ảnh chuyên nghiệp - Cụm 4 camera sau 108MP, hỗ trợ đa dạng chế độ chụp. Pin siêu lớn cùng khả năng sạc siêu t', 124.60, 122.00, 'iPhone 13 Pro Max 128GB.jpg', 100, 100, 3, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (95, 0, 'Xiaomi Redmi Note 11S', 'Xanh lá', 'Xiaomi', 'Reno8 - sản phẩm tầm trung được OPPO đầu tư kỹ lưỡng về thiết kế lẫn cấu hình, khi sở hữu vẻ ngoài vuông vức hợp xu hướng, hiệu năng ổn định mang đến trải nghiệm mượt mà cùng với cụm camera có khả năng chụp ảnh đẹp mắt.', 'Chuyên gia chân dung, bừng sáng khoảnh khắc đêm - Cụm camera 64Mp + 2MP + 2MP hiện đại. Dẫn đầu xu hướng nhờ thiết kế tinh xảo, cao cấp và mỏng nhẹ, phù hợp với trải nghiệm hằng ngày. Sạc nhanh siêu tốc, tràn đầy năng lượng cho cả ngày - Viên pin 4500mAh,', 110.30, 103.70, 'Samsung Galaxy S22 Ultra (12GB - 512GB).jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (96, 0, 'OPPO Reno8', 'Đỏ', 'Oppo', 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “s', 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 173g. Tăng tốc kết nối, dẫn đầu xu hướng - Dimensity 800U 5G 8 nhân mạnh mẽ, kết nối 5G siêu nhanh. Chuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64MP, sắc nét, ấn tượng. Màn hìn', 154.30, 150.00, 'Samsung Galaxy M32.jpg', 100, 100, 4, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (97, 0, 'OPPO Reno6 Z 5G', 'Trắng', 'Oppo', 'Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh.', 'Hiển thị chân thực, sống động - Màn hình 6.44\" AMOLED Full HD. Hiệu năng mạnh mẽ vượt trội - Chip MediaTek Helio G96, RAM mở rộng đến 12GB, Android 11 mượt mà. Làm chủ mọi khung hình - Cụm 3 camera sau lên đến 64MP, camera selfie 50MP. Thiết kế mỏng nhẹ, ', 110.00, 99.90, 'Xiaomi 12T Pro.jpg', 99, 99, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (98, 0, 'Vivo V23e', 'Trắng', 'Vivo', 'Vivo Y16 tiếp tục sẽ là cái tên được hãng bổ sung cho bộ sưu tập điện thoại Vivo dòng Y trong thời điểm cuối năm 2022, với mục tiêu mang đến nhiều trải nghiệm tốt hơn đối với dòng sản phẩm giá rẻ, Vivo hứa hẹn sẽ mang lại cho người dùng những trải nghiệm ', 'Cuốn hút từ ánh nhìn đầu tiên - Thiết kế khung viền phẳng sang trọng, màu sắc họa tiết ánh sao. Hình ảnh sống động đến bất ngờ - Màn hình IPS LCD 6.51 inch, chế độ bảo vệ mắt thông minh. Hiệu suất ấn tượng với chip MediaTek Helio P35, RAM 4GB + mở rộng 1G', 103.70, 100.00, 'Xiaomi Redmi Note 11S.jpg', 100, 100, 5, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (99, 0, 'Vivo Y16', 'Trắng ', 'Vivo', 'Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp', 'Không gian giải trí bất tận - Màn hình lớn 6.5\" IPS LCD, tần số quét 90Hz. Hiệu năng ổn định, xử lí các tác vụ thông thường - Chipset Unisoc T606 (12nm), RAM 4GB. Ba camera siêu nét đến 50MP chụp trọn cảnh quan cùng nhiều chế độ chụp. Dung lượng pin 5050m', 126.50, 125.00, 'OPPO Reno8.jpg', 99, 99, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (100, 0, 'Nokia G21', 'Đỏ ', 'Nokia', 'Điện thoại Nokia C31 (4GB/128GB) được giới thiệu để đem lại cho người dùng những trải nghiệm sử dụng tốt hơn nhờ màn hình kích thước lớn, camera chụp ảnh chất lượng và hiệu năng ổn định, cùng với đó là những cải tiến mới nhất về tính năng đến từ Google nh', 'Bộ 3 camera AI sắc nét 13MP tính hợp ứng dụng camera từ Google cho những bức ảnh hoàn hảo. Màn hình siêu rộng 6.7\" chuẩn HD+ mang đến trải nghiệm giải trí chất lượng cao với hình ảnh sống động. Hệ điều hành Android 12 mới nhất với tính năng bảo mật chia s', 147.50, 140.20, 'OPPO Reno6 Z 5G.jpg', 100, 100, 6, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (101, 0, 'Nokia C31 4GB 128GB', 'Đen', 'Nokia', 'Realme 9i ra mắt với sự đón nhận và quan tâm của giới công nghệ khi sở hữu nhiều ưu điểm nổi bật như thiết kế đẹp mắt, cấu hình tốt và viên pin dung lượng cao cho thời gian sử dụng cả ngày.', 'Hiệu năng vượt trội - Chip Qualcomm Snapdragon 680 6nm, mở rộng RAM 11GB. Bền bỉ cả ngày dài - Viên pin lớn 5000mAh, sạc nhanh 33W. Trải nghiệm màn hình mượt mà, rõ nét - Kích thước siêu lớn 6.6\" cùng tần số quét 90Hz. Bắt trọn từng khung ảnh - Bộ 3 camer', 120.00, 106.00, 'Vivo V23e.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (102, 0, 'Realme 9i 6GB 128GB', 'Xanh dương', 'Realme', 'Các dòng smartphone giá rẻ ngày càng được ưa chuộng trên thị trường di động, nắm bắt được nhu cầu đó hãng điện thoại Realme cũng đã cho ra mắt Realme C11 (2021) là một phiên bản đồng tên gọi với Realme C11 ra mắt trước đó.', 'Hiển thị rõ ràng, sắc nét - Màn hình HD+ 6.5 inch, hiển thị theo tỷ lệ 20:9. Hiệu năng ổn định, giải trí thoải mái - Chịp Spreadtrum SC9863A, 2GB RAM, Android 11. Thỏa sức sử dụng suốt ngày dài - Pin \"khủng\" tận 5000mAh, sạc 10W. Camera AI chụp đêm rõ nét', 113.00, 100.00, 'Vivo Y16.jpg', 100, 100, 7, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (103, 0, 'Realme C11 (2021)', 'Đen', 'Realme', 'Cuối cùng thì chiếc iPhone 14 Pro Max cũng đã chính thức lộ diện tại sự kiện ra mắt thường niên vào ngày 08/09 đến từ nhà Apple, kết thúc bao lời đồn đoán bằng một bộ thông số cực kỳ ấn tượng cùng vẻ ngoài đẹp mắt sang trọng.', 'Màn hình Dynamic Island - Sự biến mất của màn hình tai thỏ thay thế bằng thiết kế viên thuốc, OLED 6.7 inch, hỗ trợ always on display. Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic. Làm chủ công nghệ nhiếp ảnh - Camera sau ', 98.00, 90.00, 'Nokia G21.jpg', 100, 100, 1, '2022-01-11 16:11:47');
INSERT INTO `product` VALUES (129, 41, 'Cơm gà chiên 1', NULL, 'Samsung', '123', NULL, 132.00, 231.00, '1.PNG', 231, NULL, 2, '2022-12-22 02:34:26');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'Khách hàng');
INSERT INTO `role` VALUES (1, 'Admin');
INSERT INTO `role` VALUES (2, 'Người bán hàng');

-- ----------------------------
-- Table structure for status_account
-- ----------------------------
DROP TABLE IF EXISTS `status_account`;
CREATE TABLE `status_account`  (
  `sa_id` int NOT NULL,
  `sa_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sa_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_account
-- ----------------------------
INSERT INTO `status_account` VALUES (0, 'Chưa kích hoạt');
INSERT INTO `status_account` VALUES (1, 'Đã kích hoạt');
INSERT INTO `status_account` VALUES (2, 'Vô hiệu hóa');

-- ----------------------------
-- Table structure for status_orders
-- ----------------------------
DROP TABLE IF EXISTS `status_orders`;
CREATE TABLE `status_orders`  (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status_orders
-- ----------------------------
INSERT INTO `status_orders` VALUES (1, 'Đang chờ xác nhận');
INSERT INTO `status_orders` VALUES (2, 'Đang lấy hàng');
INSERT INTO `status_orders` VALUES (3, 'Đang vận chuyển');
INSERT INTO `status_orders` VALUES (4, 'Đã giao hàng');
INSERT INTO `status_orders` VALUES (5, 'Đã hủy');

SET FOREIGN_KEY_CHECKS = 1;
