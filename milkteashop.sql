/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 10.0.0.116:3306
 Source Schema         : milkteashop

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 21/06/2023 10:03:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `level` tinyint NOT NULL DEFAULT 0,
  `token` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'ha', NULL, NULL, 0, 'EOI8O1SoPuvief3alv1rcgFEMsE_BEI2');
INSERT INTO `admin` VALUES (2, 'admin2', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'dam', NULL, NULL, 1, '8VklvCb8o3wiBsdYvqDdPpuHmWqvVF-t');
INSERT INTO `admin` VALUES (3, 'admin3', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'trungtinh', 'tinhle2772002@gmail.com', '0986852943', 2, 'muevjxDP7Yf1EOMF1cNzLvMR2Pf6abH1');

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date` date NOT NULL DEFAULT 'now()',
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES (1, 'GRAND OPENING: PHÚC LONG 117 HÙNG VƯƠNG', '2022-04-10', 'Phúc Long 117 Hùng Vương: 117 Hùng Vương, P. 5, TP. Đông Hà, Tỉnh Quảng Trị Cửa hàng Phúc Long 117 Hùng Vương với không gian rộng mở và hiện đại, hứa hẹn sẽ là điểm đến đầy thú vị cho các buổi hẹn hò & gặp gỡ bạn bè, đồng nghiệp. Đặc biệt, trong 4 ngày khai trương, Khách Hàng ghé thăm các cửa hàng trên sẽ có cơ hội nhận được những phần quà vô cùng hấp dẫn.\r\nTrong 4 ngày khai trương từ 01.10 - 04.10.2022, khi Khách hàng ghé thăm cửa hàng mới sẽ nhận được những ưu đãi hấp dẫn sau:\r\n- Bình giữ nhiệt Phúc Long tiện lợi với hóa đơn từ 250.000đ\r\n- Ly sứ độc đáo phiên bản giới hạn \"Thành Cổ Quảng Trị\" với hóa đơn từ 120.000đ\r\n- Túi Tote độc đáo, xinh xắn/ Sổ tay Phúc Long với hóa đơn từ 90.000đ Ngoài ra, từ ngày 06.10 - 08.10.2022 với hóa đơn từ 55.000đ, Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\nMã mua 3 ly (size L) tặng 2 ly (size M) Mã mua 1 ly (size L) tặng 1 ly (size M) Voucher 50.000đ áp dụng cho hóa đơn từ 120.000đ Voucher 20.000đ áp dụng cho hóa đơn từ 55.000đ Mã mua combo 2 ly Special Tea (size M) với giá 65.000đ Mã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ Đừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại:\r\nPhúc Long 117 Hùng Vương: https://bit.ly/ktPL117HungVuong\r\n\r\nLƯU Ý:\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình. - Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết. - Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 18.10.2022. Sau thời gian trên mã sẽ không còn hiệu lực. - Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\nLƯU Ý CHUNG:\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử. - Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab,... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-1.jpg', '2022-04-10', '2022-04-11');
INSERT INTO `blogs` VALUES (2, 'GRAND OPENING: PHÚC LONG ĐƯỜNG 3 THÁNG 2', '2022-09-25', 'Trong 3 ngày khai trương từ 30.09.2022 - 02.10.2022, khi Khách hàng ghé thăm cửa hàng mới sẽ nhận được những ưu đãi hấp dẫn sau:\r\n\r\n- Với hóa đơn từ 120.000đ được tặng Ly sứ độc đáo, phiên bản giới hạn chủ đề \"Căng Lều Cắm Trại\" (Nguyễn Ái Quốc) & \"Thành Phố Về Đêm\" (Đường 3 Tháng 2)\r\n\r\n- Với hóa đơn từ 250.000đ được tặng Bình giữ nhiệt Phúc Long tiện lợi\r\n\r\n- Với hóa đơn từ 90.000đ được tặng Túi Tote cá tính/ Sổ tay Phúc Long cao cấp\r\n\r\nNgoài ra, với hóa đơn từ 55.000đ Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\n\r\nMã mua 3 ly (size L) tặng 2 ly (size M)\r\nMã mua 1 ly (size L) tặng 1 ly (size M)\r\nVoucher 50.000đ áp dụng cho hóa đơn từ 120.000đ\r\nVoucher 20.000đ áp dụng cho hóa đơn từ 55.000đ\r\nMã mua combo 2 ly Special Tea (size M) với giá 65.000đ\r\nMã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ\r\nĐừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại: \r\n\r\nPhúc Long Nguyễn Ái Quốc: https://bit.ly/ktPLNguyenAiQuoc\r\nPhúc Long Đường 3 Tháng 2: https://bit.ly/ktPLDuong3Thang2\r\nLƯU Ý:\r\n\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình.\r\n\r\n- Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết.\r\n\r\n- Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 16.10.2022. Sau thời gian trên mã sẽ không còn hiệu lực. \r\n\r\n- Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\nLƯU Ý CHUNG:\r\n\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử.\r\n\r\n- Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: Thẻ Gift Card/Cashless, Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-2.jpg', '2022-09-25', '2022-10-25');
INSERT INTO `blogs` VALUES (3, 'GRAND OPENING: PHÚC LONG BICONSI', '2022-09-14', 'Trong 3 ngày khai trương từ 23.09 - 25.09.2022, khi Khách hàng ghé thăm cửa hàng mới sẽ nhận được những ưu đãi hấp dẫn sau:\r\n\r\n- Bình giữ nhiệt Phúc Long tiện lợi với hóa đơn từ 250.000đ\r\n\r\n- Ly sứ độc đáo phiên bản giới hạn \"Thành Phố Mới Bình Dương\" với hóa đơn từ 120.000đ\r\n\r\n- Túi Tote độc đáo, xinh xắn/ Sổ tay Phúc Long với hóa đơn từ 90.000đ\r\n\r\nNgoài ra, với hóa đơn từ 55.000đ, Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\n\r\nMã mua 3 ly (size L) tặng 2 ly (size M)\r\nMã mua 1 ly (size L) tặng 1 ly (size M)\r\nVoucher 50.000đ áp dụng cho hóa đơn từ 120.000đ\r\nVoucher 20.000đ áp dụng cho hóa đơn từ 55.000đ\r\nMã mua combo 2 ly Special Tea (size M) với giá 65.000đ\r\nMã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ\r\nĐừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại:\r\n\r\nPhúc Long Biconsi: https://bit.ly/ktPLBiconsi\r\nLƯU Ý:\r\n\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình.\r\n\r\n- Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết.\r\n\r\n- Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 09.10.2022. Sau thời gian trên mã sẽ không còn hiệu lực. \r\n\r\n- Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\nLƯU Ý CHUNG:\r\n\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử.\r\n\r\n- Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab,... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-3.jpg', '2022-09-14', '2022-10-14');
INSERT INTO `blogs` VALUES (4, 'COMBO BACK TO SCHOOL - CHỈ TỪ 45,000Đ', '2022-11-09', 'Từ ngày 17.09 - 14.10.2022, Khách hàng ghé trực tiếp cửa hàng, đặt hàng qua Hotline 1800 6779 sẽ được hưởng ưu đãi:\r\n\r\nCombo \"Năng Lượng Đến Trường\" gồm 1 ly Cà Phê Phin Sữa Đá (Size M) & 1 Bánh Mì Xúc Xích với giá 45,000đ.\r\nCombo \"Thỏa Sức Sáng Tạo\" gồm 1 Special Tea (Size M) & 1 Bánh Croissant Butter với giá 55,000đ.\r\nCombo \"Tự Tin Bứt Phá\" gồm 1 Special Tea (Size M) & 1 Bánh Mì Phúc Long với giá 65,000đ.\r\nKhách hàng có thể bù chênh lệch khi muốn upsize hoặc đổi món. \r\n\r\nLƯU Ý:\r\n\r\n- Danh sách cửa hàng Phúc Long Flagship áp dụng: \r\n\r\nPhúc Long 42 Ngô Đức Kế\r\nPhúc Long 382 Trần Hưng Đạo\r\nPhúc Long Kumho Asiana Plaza\r\nPhúc Long FPT\r\nPhúc Long Centre Point\r\nPhúc Long Bàu Cát\r\nPhúc Long Nowzone\r\nPhúc Long Nguyễn Thị Minh Khai\r\nPhúc Long Đinh Tiên Hoàng\r\nPhúc Long Diamond\r\nPhúc Long Bệnh Viện Nhi Bình Chánh\r\nPhúc Long Crescent Mall\r\nPhúc Long 812 Sư Vạn Hạnh\r\nPhúc Long Mạc Thị Bưởi\r\nPhúc Long Lê Văn Lương\r\nPhúc Long 31 Ngô Đức Kế\r\nPhúc Long Nguyễn Văn Bảo\r\nPhúc Long Nguyễn Tri Phương\r\nPhúc Long Võ Thị Sáu\r\nPhúc Long Nguyễn Du\r\nPhúc Long Lê Đức Thọ (Hà Nội)\r\nPhúc Long Trung Yên\r\nPhúc Long Cầu Giấy\r\nPhúc Long Hà Đông\r\nPhúc Long Trung Hòa\r\nPhúc Long Vũ Trọng Phụng\r\nPhúc Long Hàng Điếu\r\nPhúc Long Tạ Quang Bửu\r\nPhúc Long Đặng Thai Mai\r\nPhúc Long Trần Xuân Soạn\r\nPhúc Long IPH\r\nPhúc Long Nguyễn Chí Thanh\r\nPhúc Long Newskyline\r\nPhúc Long Golden Palm\r\n- Số lượng combo mỗi ngày có hạn & chia đều cho từng cửa hàng. Chương trình có thể kết thúc sớm trong ngày.\r\n\r\n- Bánh các loại sẽ tuỳ thuộc vào độ sẵn có của từng cửa hàng & thời điểm trong ngày. Khách hàng vui lòng liên hệ thu ngân để được tư vấn chương trình.', 'img/blog/blog-4.jpg', '2022-11-09', '2022-11-10');
INSERT INTO `blogs` VALUES (5, 'GRAND OPENING: PHÚC LONG NGUYỄN TRÃI', '2022-04-09', 'Từ ngày 17.09 - 14.10.2022, Khách hàng ghé trực tiếp cửa hàng, đặt hàng qua Hotline 1800 6779 sẽ được hưởng ưu đãi:\r\n\r\nCombo \"Năng Lượng Đến Trường\" gồm 1 ly Cà Phê Phin Sữa Đá (Size M) & 1 Bánh Mì Xúc Xích với giá 45,000đ.\r\nCombo \"Thỏa Sức Sáng Tạo\" gồm 1 Special Tea (Size M) & 1 Bánh Croissant Butter với giá 55,000đ.\r\nCombo \"Tự Tin Bứt Phá\" gồm 1 Special Tea (Size M) & 1 Bánh Mì Phúc Long với giá 65,000đ.\r\nKhách hàng có thể bù chênh lệch khi muốn upsize hoặc đổi món. \r\n\r\nLƯU Ý:\r\n\r\n- Danh sách cửa hàng Phúc Long Flagship áp dụng: \r\n\r\nPhúc Long 42 Ngô Đức Kế\r\nPhúc Long 382 Trần Hưng Đạo\r\nPhúc Long Kumho Asiana Plaza\r\nPhúc Long FPT\r\nPhúc Long Centre Point\r\nPhúc Long Bàu Cát\r\nPhúc Long Nowzone\r\nPhúc Long Nguyễn Thị Minh Khai\r\nPhúc Long Đinh Tiên Hoàng\r\nPhúc Long Diamond\r\nPhúc Long Bệnh Viện Nhi Bình Chánh\r\nPhúc Long Crescent Mall\r\nPhúc Long 812 Sư Vạn Hạnh\r\nPhúc Long Mạc Thị Bưởi\r\nPhúc Long Lê Văn Lương\r\nPhúc Long 31 Ngô Đức Kế\r\nPhúc Long Nguyễn Văn Bảo\r\nPhúc Long Nguyễn Tri Phương\r\nPhúc Long Võ Thị Sáu\r\nPhúc Long Nguyễn Du\r\nPhúc Long Lê Đức Thọ (Hà Nội)\r\nPhúc Long Trung Yên\r\nPhúc Long Cầu Giấy\r\nPhúc Long Hà Đông\r\nPhúc Long Trung Hòa\r\nPhúc Long Vũ Trọng Phụng\r\nPhúc Long Hàng Điếu\r\nPhúc Long Tạ Quang Bửu\r\nPhúc Long Đặng Thai Mai\r\nPhúc Long Trần Xuân Soạn\r\nPhúc Long IPH\r\nPhúc Long Nguyễn Chí Thanh\r\nPhúc Long Newskyline\r\nPhúc Long Golden Palm\r\n- Số lượng combo mỗi ngày có hạn & chia đều cho từng cửa hàng. Chương trình có thể kết thúc sớm trong ngày.\r\n\r\n- Bánh các loại sẽ tuỳ thuộc vào độ sẵn có của từng cửa hàng & thời điểm trong ngày. Khách hàng vui lòng liên hệ thu ngân để được tư vấn chương trình.', 'img/blog/blog-5.jpg', '2022-04-09', '2022-04-10');
INSERT INTO `blogs` VALUES (6, 'GRAND OPENING: PHÚC LONG NGUYỄN HỮU HUÂN', '2022-08-28', 'Trong 3 ngày khai trương từ 26.08 - 28.08.2022, khi Khách hàng ghé thăm cửa hàng mới sẽ nhận được những ưu đãi hấp dẫn sau:\r\n\r\n- Với hóa đơn từ 120.000đ được tặng Ly sứ độc đáo, phiên bản giới hạn chủ đề \"Mùa Thu Hà Nội\" (Nguyễn Hữu Huân) & \"Hoa Phượng Đỏ Rực Rỡ\" (Văn Cao)\r\n\r\n- Với hóa đơn từ 250.000đ được tặng Bình giữ nhiệt Phúc Long tiện lợi\r\n\r\n- Với hóa đơn từ 90.000đ được tặng Túi Tote/ Sổ tay Phúc Long độc đáo, xinh xắn\r\n\r\nNgoài ra, với hóa đơn từ 55.000đ Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\n\r\nMã mua 3 ly (size L) tặng 2 ly (size M)\r\nMã mua 1 ly (size L) tặng 1 ly (size M)\r\nVoucher 50.000đ áp dụng cho hóa đơn từ 120.000đ\r\nVoucher 20.000đ áp dụng cho hóa đơn từ 55.000đ\r\nMã mua combo 2 ly Special Tea (size M) với giá 65.000đ\r\nMã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ\r\nĐừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại: \r\n\r\nPhúc Long Nguyễn Hữu Huân: https://bit.ly/ktnguyenhuuhuan\r\nPhúc Long Văn Cao: https://bit.ly/ktvancao\r\nLƯU Ý:\r\n\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình.\r\n\r\n- Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết.\r\n\r\n- Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 10.09.2022. Sau thời gian trên mã sẽ không còn hiệu lực. \r\n\r\n- Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\nLƯU Ý CHUNG:\r\n\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử.\r\n\r\n- Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: Thẻ Gift Card/Cashless, Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-6.jpg', '2022-08-28', '2022-09-28');
INSERT INTO `blogs` VALUES (7, 'GRAND OPENING: PHÚC LONG NGUYỄN VĂN BẢO', '2022-07-08', 'Ngoài ra, với hóa đơn từ 55.000đ Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\n\r\nMã mua 3 ly (size L) tặng 2 ly (size M)\r\nMã mua 1 ly (size L) tặng 1 ly (size M)\r\nVoucher 50.000đ áp dụng cho hóa đơn từ 120.000đ\r\nVoucher 20.000đ áp dụng cho hóa đơn từ 55.000đ\r\nMã mua combo 2 ly Special Tea (size M) với giá 65.000đ\r\nMã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ\r\nĐừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại: \r\n\r\nPhúc Long Nguyễn Văn Bảo: https://by.com.vn/kt33nguyenvanbao\r\nPhúc Long Lê Văn Khương: https://by.com.vn/kt68levankhuong\r\n\r\nLƯU Ý:\r\n\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình.\r\n\r\n- Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết.\r\n\r\n- Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 14.08.2022. Sau thời gian trên mã sẽ không còn hiệu lực. \r\n\r\n- Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\n- Cửa hàng Phúc Long Nguyễn Văn Bảo & Phúc Long Lê Văn Khương luôn thực hiện nghiêm túc các biện pháp phòng, chống dịch theo khuyến cáo “5K” của bộ Y Tế. Tại cửa hàng, Khách hàng luôn tuân thủ việc mang khẩu trang, đo thân nhiệt, sát khuẩn khi vào cửa hàng, giữ khoảng cách và tuân theo hướng dẫn của nhân viên nhằm không tụ tập, ùn tắc tại cửa hàng.\r\n\r\nLƯU Ý CHUNG:\r\n\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử.\r\n\r\n- Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: Thẻ Gift Card/Cashless, Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-7.jpg', '2022-07-08', '2022-07-09');
INSERT INTO `blogs` VALUES (8, 'MINIGAME: TRUNG THU VUI VẦYG', '2022-05-08', 'Thể lệ chương trình \"Trung Thu Vui Vầy - Quà Đầy Yêu Thương\"\r\n\r\nThời gian: Khi bài đăng Minigame được thông báo trên Fanpage đến 23:59 phút ngày 05.08.2022\r\n\r\nCác bước tham dự Minigame:\r\n\r\nBước 1: Like Fanpage, bài viết và bình luận lí do chia sẻ bánh Trung Thu Phúc Long “Thưởng Nguyệt Đoàn Viên” cùng với những người bạn/ người thân mà mình mong muốn gặp trong dịp Tết Trung Thu này.\r\n\r\nBước 2: Tag ít nhất 1 người bạn.\r\n\r\nQuy trình trao thưởng:\r\n\r\nThời gian Phúc Long kiểm tra tài khoản hợp lệ và gửi tin nhắn về thông tin vòng quay thưởng: 30.07 - 06.08.2022.\r\n\r\nThời gian tham gia vòng quay để nhận quà: 07.08 - 10.08.2022.\r\n\r\nThời gian nhận quà tại cửa hàng khi trúng giải: 07.08 - 20.08.2022.\r\n\r\nCách thức tham gia vòng quay may mắn:\r\n\r\nKhách hàng nhận được tin nhắn, truy cập vào đường link vòng quay, đăng nhập bằng mã dự thưởng mà Phúc Long cung cấp. \r\n\r\nĐiền đầy đủ và chính xác các thông tin và nhấn quay thưởng.\r\n\r\nQuà tặng và mã đổi quà xuất hiện trên màn hình, chụp lại màn hình điện thoại có đoạn mã đổi quà.\r\n\r\nKhách hàng đến cửa hàng Phúc Long có bán bánh trung thu, xuất trình màn hình điện thoại có mã đổi quà cho thu ngân và nhận quà tặng.\r\n\r\nDanh sách hệ thống cửa hàng Phúc Long: https://order.phuclong.com.vn/content/he-thong-cua-hang-phuc-long-coffee-tea\r\n\r\nCác lưu ý và quy định khác:\r\n\r\nTài khoản Facebook hợp lệ phải là tài khoản thật, chính chủ.\r\n\r\nBài đăng chia sẻ tại trang cá nhân phải ở chế độ công khai.\r\n\r\nThời gian tham gia vòng quay để nhận quà: 07.08 - 10.08.2022. Sau thời gian trên, vòng quay may mắn sẽ không còn hiệu lực.\r\n\r\nThời gian nhận quà tại cửa hàng khi trúng giải: 07.08 - 20.08.2022. Sau thời gian trên, mã đổi quà sẽ không còn hiệu lực.\r\n\r\nVị bánh & Hộp Bánh Trung Thu sẽ được tặng ngẫu nhiên tại cửa hàng.', 'img/blog/blog-8.jpg', '2022-05-08', '2022-05-09');
INSERT INTO `blogs` VALUES (9, 'GRAND OPENING: PHÚC LONG HÙNG VƯƠNG', '2022-02-08', 'Trong 4 ngày khai trương từ 30.07 - 02.08.2022, khi Khách hàng ghé thăm cửa hàng mới sẽ nhận được những ưu đãi hấp dẫn sau:\r\n\r\n- Bình giữ nhiệt Phúc Long tiện lợi với hóa đơn từ 250.000đ\r\n\r\n- Ly sứ độc đáo phiên bản giới hạn \"Rừng Tràm Xanh Mướt\" với hóa đơn từ 120.000đ\r\n\r\n- Túi Tote độc đáo, xinh xắn/ Sổ tay Phúc Long với hóa đơn từ 90.000đ\r\n\r\nNgoài ra, với hóa đơn từ 55.000đ Khách Hàng sẽ được tham gia vòng quay may mắn trúng các mã Gift Voucher sau:\r\n\r\nMã mua 3 ly (size L) tặng 2 ly (size M)\r\nMã mua 1 ly (size L) tặng 1 ly (size M)\r\nVoucher 50.000đ áp dụng cho hóa đơn từ 120.000đ\r\nVoucher 20.000đ áp dụng cho hóa đơn từ 55.000đ\r\nMã mua combo 2 ly Special Tea (size M) với giá 65.000đ\r\nMã mua combo Special Tea (size M) & Cafe (size M) với giá 60.000đ\r\nĐừng bỏ lỡ cơ hội nhận ngay mã ưu đãi 20,000đ và hàng trăm quà tặng miễn phí tại: https://by.com.vn/kt38hungvuong\r\n\r\nLƯU Ý:\r\n\r\n- Số lượng quà tặng có hạn và được phát cho đến khi hết quà. Khách hàng vui lòng gửi tin nhắn đến Fanpage Phuc Long Coffee & Tea để được hỗ trợ thêm thông tin về chương trình.\r\n\r\n- Chương trình có thể kết thúc sớm hơn dự kiến khi số lượng quà tặng/ mã Gift Voucher đã hết.\r\n\r\n- Các Mã đổi quà tặng & Gift Voucher có hạn sử dụng là 15.08.2022. Sau thời gian trên mã sẽ không còn hiệu lực. \r\n\r\n- Chương trình không áp dụng đồng thời các chương trình khuyến mãi.\r\n\r\n- Cửa hàng Phúc Long Hùng Vương luôn thực hiện nghiêm túc các biện pháp phòng, chống dịch theo khuyến cáo “5K” của bộ Y Tế. Tại cửa hàng, Khách hàng luôn tuân thủ việc mang khẩu trang, đo thân nhiệt, sát khuẩn khi vào cửa hàng, giữ khoảng cách và tuân theo hướng dẫn của nhân viên nhằm không tụ tập, ùn tắc tại cửa hàng.\r\n\r\nLƯU Ý CHUNG:\r\n\r\n- Chương trình áp dụng với các hình thức thanh toán: tiền mặt, thẻ ATM, thẻ tín dụng và ví điện tử.\r\n\r\n- Không áp dụng chung với các chương trình khuyến mãi khác bao gồm: thẻ Thành viên VIP ưu đãi giảm giá 10%, Diamond 15%, Thẻ Gift Card/Cashless, Voucher Phúc Long, Voucher Esteem Gift, Voucher Sodexo Meal, Chương trình Samsung, Voucher Got It, Chương trình Grab... và các chương trình khuyến mãi khác tương tự.', 'img/blog/blog-9.jpg', '2022-02-08', '2022-02-08');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Trà sữa ', 0);
INSERT INTO `categories` VALUES (2, 'Trà', 0);
INSERT INTO `categories` VALUES (3, 'Đá xay', 0);
INSERT INTO `categories` VALUES (4, 'Nước ép', 0);
INSERT INTO `categories` VALUES (5, 'Sữa chua', 0);
INSERT INTO `categories` VALUES (9, 'hjh', 2);
INSERT INTO `categories` VALUES (10, 'Lê Trọng Tình', 0);
INSERT INTO `categories` VALUES (11, 'dasda', 0);
INSERT INTO `categories` VALUES (12, 'dasda', 2);
INSERT INTO `categories` VALUES (13, 'dasda', 2);

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `percent` int NOT NULL,
  `max_price_sale` float NULL DEFAULT NULL,
  `quantity` int NOT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `min_price_order` float NULL DEFAULT 0,
  `date_regis_acc` date NULL DEFAULT NULL,
  `min_num_order` int NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'op', 12, 12000, 50, '2022-12-21', '2023-01-09', 20000, NULL, NULL, NULL);
INSERT INTO `coupons` VALUES (4, 'ABVVC', 25, 50000, 19, '2022-12-21', '2023-01-09', 0, '1970-01-01', 0, '');
INSERT INTO `coupons` VALUES (5, 'ABVVC', 25, 50000, 20, '2022-12-27', '2023-01-09', 0, '1970-01-01', 0, '');
INSERT INTO `coupons` VALUES (6, '61857', 212, 500000, 84512, '2022-12-14', '2023-01-09', 0, '2022-01-01', 0, '');
INSERT INTO `coupons` VALUES (10, 'sad', 12, 123, 123, '2022-12-19', '2023-06-19', 123, '2022-01-01', 0, '');
INSERT INTO `coupons` VALUES (15, 'hehe', 25, 60000, 100, '2023-01-09', '2023-01-09', 100000, '2022-01-01', 0, '');
INSERT INTO `coupons` VALUES (16, 'hehe', 42, 30000, 44, '2023-01-02', '2023-02-04', 0, '2022-01-01', 0, '');

-- ----------------------------
-- Table structure for forgot_pass
-- ----------------------------
DROP TABLE IF EXISTS `forgot_pass`;
CREATE TABLE `forgot_pass`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `send_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forgot_pass
-- ----------------------------
INSERT INTO `forgot_pass` VALUES (1, 'BfMeUEI89Vx7pWd0R6MDUeIaL59XRW1Mb73LEtLwbXNKP', '18', '2023-06-20 03:16:12');
INSERT INTO `forgot_pass` VALUES (2, 'uTx15m5qQImt4EOzX8C2XvUPxlsR3YuXAXgoeOP1XIPFj', '18', '2023-06-20 03:21:39');

-- ----------------------------
-- Table structure for forgot_pass_count
-- ----------------------------
DROP TABLE IF EXISTS `forgot_pass_count`;
CREATE TABLE `forgot_pass_count`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `count` int NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_email_date`(`email` ASC, `date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forgot_pass_count
-- ----------------------------
INSERT INTO `forgot_pass_count` VALUES (1, 'buithanhdam02@gmail.com', 3, '2023-06-20');

-- ----------------------------
-- Table structure for noti_coupon
-- ----------------------------
DROP TABLE IF EXISTS `noti_coupon`;
CREATE TABLE `noti_coupon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_seen` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `coupon_id`(`coupon_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `noti_coupon_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `noti_coupon_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of noti_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for noti_order
-- ----------------------------
DROP TABLE IF EXISTS `noti_order`;
CREATE TABLE `noti_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `is_seen` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `noti_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of noti_order
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_size_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `product_size_id`(`product_size_id` ASC) USING BTREE,
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 9, 1);
INSERT INTO `order_detail` VALUES (2, 3, 7, 1);
INSERT INTO `order_detail` VALUES (3, 4, 9, 1);
INSERT INTO `order_detail` VALUES (4, 4, 9, 1);
INSERT INTO `order_detail` VALUES (5, 5, 9, 1);
INSERT INTO `order_detail` VALUES (6, 5, 9, 2);
INSERT INTO `order_detail` VALUES (7, 6, 76, 1);
INSERT INTO `order_detail` VALUES (8, 7, 158, 1);
INSERT INTO `order_detail` VALUES (9, 8, 110, 1);
INSERT INTO `order_detail` VALUES (10, 9, 95, 1);
INSERT INTO `order_detail` VALUES (11, 10, 110, 1);
INSERT INTO `order_detail` VALUES (12, 10, 155, 1);
INSERT INTO `order_detail` VALUES (13, 11, 96, 1);
INSERT INTO `order_detail` VALUES (14, 11, 157, 1);
INSERT INTO `order_detail` VALUES (15, 11, 205, 1);
INSERT INTO `order_detail` VALUES (16, 12, 157, 1);
INSERT INTO `order_detail` VALUES (17, 12, 96, 1);
INSERT INTO `order_detail` VALUES (18, 13, 96, 1);
INSERT INTO `order_detail` VALUES (19, 13, 157, 1);
INSERT INTO `order_detail` VALUES (20, 14, 96, 1);
INSERT INTO `order_detail` VALUES (21, 15, 96, 2);

-- ----------------------------
-- Table structure for order_logistic
-- ----------------------------
DROP TABLE IF EXISTS `order_logistic`;
CREATE TABLE `order_logistic`  (
  `order_id` int NOT NULL,
  `logistic_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  INDEX `order_logistic_ibfk_1`(`order_id` ASC) USING BTREE,
  CONSTRAINT `order_logistic_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_logistic
-- ----------------------------
INSERT INTO `order_logistic` VALUES (13, '2136ba724e4845cea0f9d75fa8d58de7');
INSERT INTO `order_logistic` VALUES (14, '12ff92192e4246ba820560d8b792ee4c');
INSERT INTO `order_logistic` VALUES (15, 'c0477b9c89d14228bec7eb33ca8d2667');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `note` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `coupon_id` int NULL DEFAULT NULL,
  `total` float NOT NULL,
  `status` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `coupon_id`(`coupon_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 'HÃ ', '0344558306', '2022-07-04 00:00:00', 'abc', '123', NULL, 45000, '2');
INSERT INTO `orders` VALUES (3, 3, 'HÃ ', '0344558306', '2022-12-16 01:01:22', '123', '123', NULL, 69000, '2');
INSERT INTO `orders` VALUES (4, 3, 'Nguyễn Vũ Mạnh Hà', '0344558306', '2023-01-04 15:20:05', '123', '123', NULL, 135000, '2');
INSERT INTO `orders` VALUES (5, 5, 'H-Bell', '0344558306', '2023-01-06 19:28:26', '123', '', NULL, 165000, '2');
INSERT INTO `orders` VALUES (6, 5, 'H-Bell', '0344558306', '2023-01-06 19:35:33', '123', '1', NULL, 7500, '2');
INSERT INTO `orders` VALUES (7, 6, 'Nguyễn Vũ Mạnh Hà', '0344558306', '2023-01-07 02:25:50', '1235', '', NULL, 19500, '2');
INSERT INTO `orders` VALUES (8, 3, 'Nguyễn Vũ Mạnh Hà', '0344558306', '2023-01-08 00:57:37', 'bcas', '', 4, 21937.5, '2');
INSERT INTO `orders` VALUES (9, 9, 'Hà', '0344558306', '2023-01-09 02:06:29', '213', '', NULL, 48000, '2');
INSERT INTO `orders` VALUES (10, 16, 'Hà', '0344558306', '2023-01-10 08:36:38', 'đh nông lâm', '', NULL, 25500, '2');
INSERT INTO `orders` VALUES (11, 18, 'Dam Thanh', '0377184642', '2023-04-23 11:10:43', '11/22 Hồ Chí Minh Quận 11 Phường 4', '', NULL, 75000, '4');
INSERT INTO `orders` VALUES (12, 18, 'Dam Thanh', '0377184642', '2023-04-23 11:24:36', '11/18-Hồ Chí Minh-Quận 12-Phường Thạnh Xuân', '', NULL, 50000, '4');
INSERT INTO `orders` VALUES (13, 18, 'Dam Thanh', '0377184642', '2023-04-23 11:28:43', 'khong biet nua-Hồ Chí Minh-Quận Tân Bình-Phường 10', 'oke bro', NULL, 71000, '3');
INSERT INTO `orders` VALUES (14, 18, 'Dam Thanh', '0377184642', '2023-05-05 11:27:40', 'oke-Hồ Chí Minh-Huyện Cần Giờ-Xã Lý Nhơn', '', NULL, 51000, '3');
INSERT INTO `orders` VALUES (15, 18, 'Dam Thanh', '0377184642', '2023-06-21 02:48:16', 'ad-Hồ Chí Minh-Thành Phố Thủ Đức-Phường An Khánh', '', NULL, 81000, '2');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `product_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (1, NULL, 'img/product/products/BanhOreoXayCungCaPheCappuccino.png', 1, 0);
INSERT INTO `product_image` VALUES (2, NULL, 'img/product/products/CamEp.png', 4, 0);
INSERT INTO `product_image` VALUES (3, NULL, 'img/product/products/CaramenChay.png', 6, 0);
INSERT INTO `product_image` VALUES (4, NULL, 'img/product/products/DauEp.png', 7, 0);
INSERT INTO `product_image` VALUES (5, NULL, 'img/product/products/DuaEp.png', 8, 0);
INSERT INTO `product_image` VALUES (6, NULL, 'img/product/products/KemTraXanh.png', 12, 0);
INSERT INTO `product_image` VALUES (7, NULL, 'img/product/products/SinhToChanh.png', 18, 0);
INSERT INTO `product_image` VALUES (8, NULL, 'img/product/products/SinhToDau.png', 19, 0);
INSERT INTO `product_image` VALUES (9, NULL, 'img/product/products/SinhToXoai.png', 20, 0);
INSERT INTO `product_image` VALUES (10, NULL, 'img/product/products/So-Co-LaCaPheDaXay.png', 21, 0);
INSERT INTO `product_image` VALUES (11, NULL, 'img/product/products/So-Co-LaXayCungHanhNhanVaEspresso.png', 22, 0);
INSERT INTO `product_image` VALUES (12, NULL, 'img/product/products/SuaChuaPhucBonTuDacCam.png', 23, 0);
INSERT INTO `product_image` VALUES (13, NULL, 'img/product/products/SuaChuaXoaiDacThom.png', 24, 0);
INSERT INTO `product_image` VALUES (14, NULL, 'img/product/products/TaoEp.png', 25, 0);
INSERT INTO `product_image` VALUES (15, NULL, 'img/product/products/TaoVaDauEp.png', 26, 0);
INSERT INTO `product_image` VALUES (16, NULL, 'img/product/products/ThomVaDauEp.png', 27, 0);
INSERT INTO `product_image` VALUES (17, NULL, 'img/product/products/TraDaoDaXay.png', 28, 0);
INSERT INTO `product_image` VALUES (18, NULL, 'img/product/products/TraDaoPhucLong.png', 29, 0);
INSERT INTO `product_image` VALUES (19, NULL, 'img/product/products/TraDaoSua.png', 30, 0);
INSERT INTO `product_image` VALUES (20, NULL, 'img/product/products/TraHoaHong.png', 31, 0);
INSERT INTO `product_image` VALUES (21, NULL, 'img/product/products/TraLaiDacThom.png', 32, 0);
INSERT INTO `product_image` VALUES (22, NULL, 'img/product/products/TraNhan-Lai.png', 33, 0);
INSERT INTO `product_image` VALUES (23, NULL, 'img/product/products/TraNhan-Sen.png', 34, 0);
INSERT INTO `product_image` VALUES (24, NULL, 'img/product/products/TraOLongDau.png', 35, 0);
INSERT INTO `product_image` VALUES (25, NULL, 'img/product/products/TraOLongMangCau.png', 36, 0);
INSERT INTO `product_image` VALUES (26, NULL, 'img/product/products/TraOLongSua.png', 37, 0);
INSERT INTO `product_image` VALUES (27, NULL, 'img/product/products/TraSenVangCuNang.png', 38, 0);
INSERT INTO `product_image` VALUES (28, NULL, 'img/product/products/TraSenVangSen.png', 39, 0);
INSERT INTO `product_image` VALUES (29, NULL, 'img/product/products/TraSuaPhucLong.png', 40, 0);
INSERT INTO `product_image` VALUES (30, NULL, 'img/product/products/TraThachVai.png', 41, 0);
INSERT INTO `product_image` VALUES (31, NULL, 'img/product/products/TraThanhDao.png', 42, 0);
INSERT INTO `product_image` VALUES (32, NULL, 'img/product/products/TraThaoMoc.png', 43, 0);
INSERT INTO `product_image` VALUES (33, NULL, 'img/product/products/TraVai-Sen.png', 44, 0);
INSERT INTO `product_image` VALUES (34, NULL, 'img/product/products/TraVaiLai.png', 45, 0);
INSERT INTO `product_image` VALUES (35, NULL, 'img/product/products/TraXanhDaXay.png', 46, 0);
INSERT INTO `product_image` VALUES (36, NULL, 'img/product/products/ChocoNguCocKemCafe.png', 47, 0);
INSERT INTO `product_image` VALUES (37, NULL, 'img/product/products/CremeBruleeLatte.png', 48, 0);
INSERT INTO `product_image` VALUES (38, NULL, 'img/product/products/CremeBruleeMatcha.png', 49, 0);
INSERT INTO `product_image` VALUES (39, NULL, 'img/product/products/CremeBruleeMilkTea.png', 50, 0);
INSERT INTO `product_image` VALUES (40, NULL, 'img/product/products/CremeBruleeTea.png', 51, 0);
INSERT INTO `product_image` VALUES (41, NULL, 'img/product/products/DaoLatte.png', 52, 0);
INSERT INTO `product_image` VALUES (42, NULL, 'img/product/products/DauLatte.png', 53, 0);
INSERT INTO `product_image` VALUES (43, NULL, 'img/product/products/DolceMilkTeaFloat.png', 54, 0);
INSERT INTO `product_image` VALUES (44, NULL, 'img/product/products/GrassJellyMilkCoffee.png', 55, 0);
INSERT INTO `product_image` VALUES (45, NULL, 'img/product/products/HongTra.png', 56, 0);
INSERT INTO `product_image` VALUES (46, NULL, 'img/product/products/HongTraBuoiMatOng.png', 57, 0);
INSERT INTO `product_image` VALUES (47, NULL, 'img/product/products/HongTraDau.png', 58, 0);
INSERT INTO `product_image` VALUES (48, NULL, 'img/product/products/HongTraNguCocKemCafe.png', 59, 0);
INSERT INTO `product_image` VALUES (49, NULL, 'img/product/products/InstantMilkTea–Original.png', 60, 0);
INSERT INTO `product_image` VALUES (50, NULL, 'img/product/products/InstantMilkTea–Strawberry.png', 61, 0);
INSERT INTO `product_image` VALUES (51, NULL, 'img/product/products/KemTuyetSocola.png', 62, 0);
INSERT INTO `product_image` VALUES (52, NULL, 'img/product/products/KemTuyetTraXanhNhatBan.png', 63, 0);
INSERT INTO `product_image` VALUES (53, NULL, 'img/product/products/MatchaDauDo.png', 64, 0);
INSERT INTO `product_image` VALUES (54, NULL, 'img/product/products/OLongKemPhoMai.png', 65, 0);
INSERT INTO `product_image` VALUES (55, NULL, 'img/product/products/OLongThaiCuc.png', 66, 0);
INSERT INTO `product_image` VALUES (56, NULL, 'img/product/products/OLongXoaiKemCaPhe.png', 67, 0);
INSERT INTO `product_image` VALUES (57, NULL, 'img/product/products/OkinawaLatte.png', 68, 0);
INSERT INTO `product_image` VALUES (58, NULL, 'img/product/products/OkinawaLatteFloat.png', 69, 0);
INSERT INTO `product_image` VALUES (59, NULL, 'img/product/products/OkinawaOreoCreamMilkTea.png', 70, 0);
INSERT INTO `product_image` VALUES (60, NULL, 'img/product/products/OolongTranChauBabyKemCafe.png', 71, 0);
INSERT INTO `product_image` VALUES (61, NULL, 'img/product/products/ProbiBuoiTranChauSuongMai.png', 72, 0);
INSERT INTO `product_image` VALUES (62, NULL, 'img/product/products/ProbiXoaiTranChauSuongMai.png', 73, 0);
INSERT INTO `product_image` VALUES (63, NULL, 'img/product/products/RoyalPearlMilkCoffee.png', 74, 0);
INSERT INTO `product_image` VALUES (64, NULL, 'img/product/products/StrawberryMilkTea.png', 75, 0);
INSERT INTO `product_image` VALUES (65, NULL, 'img/product/products/SuaChuaDauTamHatDe.png', 76, 0);
INSERT INTO `product_image` VALUES (66, NULL, 'img/product/products/SuaChuaDauTamHoangKim.png', 77, 0);
INSERT INTO `product_image` VALUES (67, NULL, 'img/product/products/SuaChuaManHatSen.png', 78, 0);
INSERT INTO `product_image` VALUES (68, NULL, 'img/product/products/SuaChuaTrang.png', 79, 0);
INSERT INTO `product_image` VALUES (69, NULL, 'img/product/products/SuaTuoiLongNhanTaoDo.png', 80, 0);
INSERT INTO `product_image` VALUES (70, NULL, 'img/product/products/SuaTuoiOkinawa.png', 81, 0);
INSERT INTO `product_image` VALUES (71, NULL, 'img/product/products/SuaTuoiTranChauBabyKemCafe.png', 82, 0);
INSERT INTO `product_image` VALUES (72, NULL, 'img/product/products/TigerSugar.png', 83, 0);
INSERT INTO `product_image` VALUES (73, NULL, 'img/product/products/ToffeeBlackTeaLatte.png', 84, 0);
INSERT INTO `product_image` VALUES (74, NULL, 'img/product/products/ToffeeChocolatea.png', 85, 0);
INSERT INTO `product_image` VALUES (75, NULL, 'img/product/products/TraAlisanGongCha.png', 86, 0);
INSERT INTO `product_image` VALUES (76, NULL, 'img/product/products/TraBiDaoGongCha.png', 87, 0);
INSERT INTO `product_image` VALUES (77, NULL, 'img/product/products/TraDao.png', 88, 0);
INSERT INTO `product_image` VALUES (78, NULL, 'img/product/products/TraDaoBuoiHongTranChauBaby.png', 89, 0);
INSERT INTO `product_image` VALUES (79, NULL, 'img/product/products/TraDauTamPhaLeTuyet.png', 90, 0);
INSERT INTO `product_image` VALUES (80, NULL, 'img/product/products/TraDenGongCha.png', 91, 0);
INSERT INTO `product_image` VALUES (81, NULL, 'img/product/products/Traduanhietdoi.png', 92, 0);
INSERT INTO `product_image` VALUES (82, NULL, 'img/product/products/TraOolongGongCha.png', 93, 0);
INSERT INTO `product_image` VALUES (83, NULL, 'img/product/products/TraSua.png', 94, 0);
INSERT INTO `product_image` VALUES (84, NULL, 'img/product/products/TraSuaBaAnhEm.png', 95, 0);
INSERT INTO `product_image` VALUES (85, NULL, 'img/product/products/TraSuaBacHa.png', 96, 0);
INSERT INTO `product_image` VALUES (86, NULL, 'img/product/products/TraSuaChocolate.png', 97, 0);
INSERT INTO `product_image` VALUES (87, NULL, 'img/product/products/TraSuaDao.png', 98, 0);
INSERT INTO `product_image` VALUES (88, NULL, 'img/product/products/TraSuaDauTay.png', 99, 0);
INSERT INTO `product_image` VALUES (89, NULL, 'img/product/products/TraSuaDolceTranChauHoangKim.png', 100, 0);
INSERT INTO `product_image` VALUES (90, NULL, 'img/product/products/TraSuaGaoRang.png', 101, 0);
INSERT INTO `product_image` VALUES (91, NULL, 'img/product/products/TraSuaGaoRangOkinawa.png', 102, 0);
INSERT INTO `product_image` VALUES (92, NULL, 'img/product/products/TraSuaHanhPhuc.png', 103, 0);
INSERT INTO `product_image` VALUES (93, NULL, 'img/product/products/TraSuaHokkaido.png', 104, 0);
INSERT INTO `product_image` VALUES (94, NULL, 'img/product/products/TraSuaKhoaiMon.png', 105, 0);
INSERT INTO `product_image` VALUES (95, NULL, 'img/product/products/TraSuaKimCuongDenOkinawa.png', 106, 0);
INSERT INTO `product_image` VALUES (96, NULL, 'img/product/products/TraSuaMatcha.png', 107, 0);
INSERT INTO `product_image` VALUES (97, NULL, 'img/product/products/TraSuaMatchaDauDo.png', 108, 0);
INSERT INTO `product_image` VALUES (98, NULL, 'img/product/products/TraSuaOLong.png', 109, 0);
INSERT INTO `product_image` VALUES (99, NULL, 'img/product/products/TraSuaOkinawa.png', 110, 0);
INSERT INTO `product_image` VALUES (100, NULL, 'img/product/products/TraSuaOolong.png', 111, 0);
INSERT INTO `product_image` VALUES (101, NULL, 'img/product/products/TrasuaOolong3J.png', 112, 0);
INSERT INTO `product_image` VALUES (102, NULL, 'img/product/products/TraSuaPanda.png', 113, 0);
INSERT INTO `product_image` VALUES (103, NULL, 'img/product/products/TraSuaPuddingDauDo.png', 114, 0);
INSERT INTO `product_image` VALUES (104, NULL, 'img/product/products/TraSuaSocola.png', 115, 0);
INSERT INTO `product_image` VALUES (105, NULL, 'img/product/products/TraSuaSuongSao.png', 116, 0);
INSERT INTO `product_image` VALUES (106, NULL, 'img/product/products/TraSuaTraDen.png', 117, 0);
INSERT INTO `product_image` VALUES (107, NULL, 'img/product/products/TraSuaTraXanh.png', 118, 0);
INSERT INTO `product_image` VALUES (108, NULL, 'img/product/products/TraSuaTranChauDen.png', 119, 0);
INSERT INTO `product_image` VALUES (109, NULL, 'img/product/products/TraSuaTranChauHoangGia.png', 120, 0);
INSERT INTO `product_image` VALUES (110, NULL, 'img/product/products/TraSuaTranChauHoangKim.png', 121, 0);
INSERT INTO `product_image` VALUES (111, NULL, 'img/product/products/TraSuaTruyenThong.png', 122, 0);
INSERT INTO `product_image` VALUES (112, NULL, 'img/product/products/TraSuaXoaiTranChauDen.png', 123, 0);
INSERT INTO `product_image` VALUES (113, NULL, 'img/product/products/TraVai.png', 124, 0);
INSERT INTO `product_image` VALUES (114, NULL, 'img/product/products/TraXanh.png', 125, 0);
INSERT INTO `product_image` VALUES (115, NULL, 'img/product/products/TraXanhGongCha.png', 126, 0);
INSERT INTO `product_image` VALUES (116, NULL, 'img/product/products/TraXanhKiwi.png', 127, 0);
INSERT INTO `product_image` VALUES (117, NULL, 'img/product/products/TraXanhSuaViNhai.png', 128, 0);
INSERT INTO `product_image` VALUES (118, NULL, 'img/product/products/TraXoaiBuoiHong.png', 129, 0);
INSERT INTO `product_image` VALUES (119, NULL, 'img/product/products/TraXoaiBuoiHongKemPhoMai.png', 130, 0);
INSERT INTO `product_image` VALUES (120, NULL, 'img/product/products/XoaiMatchaLatte.png', 131, 0);

-- ----------------------------
-- Table structure for product_size
-- ----------------------------
DROP TABLE IF EXISTS `product_size`;
CREATE TABLE `product_size`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` float NULL DEFAULT 0,
  `original_price` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `product_size_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 211 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_size
-- ----------------------------
INSERT INTO `product_size` VALUES (1, 1, 'M', 60000, 60000);
INSERT INTO `product_size` VALUES (4, 4, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (7, 6, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (8, 6, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (9, 7, 'M', 45000, 55000);
INSERT INTO `product_size` VALUES (10, 8, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (16, 12, 'M', 55000, 55000);
INSERT INTO `product_size` VALUES (17, 12, 'L', 60000, 60000);
INSERT INTO `product_size` VALUES (28, 18, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (29, 19, 'M', 55000, 55000);
INSERT INTO `product_size` VALUES (30, 20, 'M', 55000, 55000);
INSERT INTO `product_size` VALUES (31, 21, 'M', 60000, 60000);
INSERT INTO `product_size` VALUES (32, 22, 'M', 60000, 60000);
INSERT INTO `product_size` VALUES (33, 23, 'M', 70000, 70000);
INSERT INTO `product_size` VALUES (34, 24, 'M', 70000, 70000);
INSERT INTO `product_size` VALUES (35, 25, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (36, 26, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (37, 27, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (38, 28, 'M', 65000, 65000);
INSERT INTO `product_size` VALUES (39, 29, 'M', 55000, 50000);
INSERT INTO `product_size` VALUES (40, 29, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (41, 30, 'M', 40000, 40000);
INSERT INTO `product_size` VALUES (42, 30, 'L', 45000, 45000);
INSERT INTO `product_size` VALUES (43, 31, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (44, 31, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (45, 32, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (46, 32, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (47, 33, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (48, 33, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (49, 34, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (50, 34, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (51, 35, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (52, 35, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (53, 36, 'L', 54000, 54000);
INSERT INTO `product_size` VALUES (54, 37, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (55, 37, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (56, 38, 'M', 9750, 45000);
INSERT INTO `product_size` VALUES (57, 38, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (58, 39, 'M', 7500, 45000);
INSERT INTO `product_size` VALUES (59, 39, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (60, 40, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (61, 40, 'L', 8250, 50000);
INSERT INTO `product_size` VALUES (62, 41, 'M', 6000, 45000);
INSERT INTO `product_size` VALUES (63, 41, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (64, 42, 'M', 45000, 45000);
INSERT INTO `product_size` VALUES (65, 42, 'L', 6750, 50000);
INSERT INTO `product_size` VALUES (66, 43, 'M', 7500, 50000);
INSERT INTO `product_size` VALUES (67, 43, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (68, 44, 'M', 50000, 50000);
INSERT INTO `product_size` VALUES (69, 44, 'L', 8250, 55000);
INSERT INTO `product_size` VALUES (70, 45, 'M', 7500, 50000);
INSERT INTO `product_size` VALUES (71, 45, 'L', 55000, 55000);
INSERT INTO `product_size` VALUES (72, 46, 'M', 60000, 60000);
INSERT INTO `product_size` VALUES (73, 48, 'L', 8250, 32000);
INSERT INTO `product_size` VALUES (74, 49, 'L', 38000, 38000);
INSERT INTO `product_size` VALUES (75, 52, 'L', 8250, 40000);
INSERT INTO `product_size` VALUES (76, 55, 'L', 7500, 30000);
INSERT INTO `product_size` VALUES (77, 66, 'L', 45000, 45000);
INSERT INTO `product_size` VALUES (78, 76, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (79, 77, 'L', 6750, 36000);
INSERT INTO `product_size` VALUES (80, 87, 'L', 6000, 35000);
INSERT INTO `product_size` VALUES (81, 89, 'L', 5700, 40000);
INSERT INTO `product_size` VALUES (82, 93, 'L', 4950, 32000);
INSERT INTO `product_size` VALUES (83, 95, 'L', 4800, 40000);
INSERT INTO `product_size` VALUES (84, 102, 'L', 37000, 37000);
INSERT INTO `product_size` VALUES (85, 103, 'L', 32000, 32000);
INSERT INTO `product_size` VALUES (86, 106, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (87, 107, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (88, 108, 'L', 42000, 42000);
INSERT INTO `product_size` VALUES (89, 109, 'L', 38000, 38000);
INSERT INTO `product_size` VALUES (90, 110, 'L', 38000, 38000);
INSERT INTO `product_size` VALUES (91, 112, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (92, 113, 'L', 38000, 38000);
INSERT INTO `product_size` VALUES (93, 114, 'L', 33000, 33000);
INSERT INTO `product_size` VALUES (94, 120, 'L', 35000, 35000);
INSERT INTO `product_size` VALUES (95, 125, 'L', 32000, 32000);
INSERT INTO `product_size` VALUES (96, 127, 'L', 30000, 30000);
INSERT INTO `product_size` VALUES (98, 130, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (99, 51, 'M', 7500, 30000);
INSERT INTO `product_size` VALUES (100, 57, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (101, 58, 'M', 6750, 35000);
INSERT INTO `product_size` VALUES (102, 60, 'M', 6750, 35000);
INSERT INTO `product_size` VALUES (103, 61, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (104, 65, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (105, 74, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (106, 79, 'M', 28000, 28000);
INSERT INTO `product_size` VALUES (107, 83, 'M', 28000, 28000);
INSERT INTO `product_size` VALUES (108, 92, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (109, 124, 'M', 4200, 35000);
INSERT INTO `product_size` VALUES (110, 129, 'M', 5250, 30000);
INSERT INTO `product_size` VALUES (111, 47, 'M', 7500, 35000);
INSERT INTO `product_size` VALUES (112, 50, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (113, 53, 'M', 28000, 28000);
INSERT INTO `product_size` VALUES (114, 54, 'M', 6750, 30000);
INSERT INTO `product_size` VALUES (115, 56, 'M', 6750, 32000);
INSERT INTO `product_size` VALUES (116, 59, 'M', 42000, 42000);
INSERT INTO `product_size` VALUES (117, 62, 'M', 6750, 35000);
INSERT INTO `product_size` VALUES (118, 63, 'M', 32000, 32000);
INSERT INTO `product_size` VALUES (119, 64, 'M', 6750, 28000);
INSERT INTO `product_size` VALUES (120, 67, 'M', 49000, 49000);
INSERT INTO `product_size` VALUES (121, 68, 'M', 7500, 32000);
INSERT INTO `product_size` VALUES (122, 69, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (123, 70, 'M', 7500, 35000);
INSERT INTO `product_size` VALUES (124, 71, 'M', 28000, 28000);
INSERT INTO `product_size` VALUES (125, 72, 'M', 32000, 32000);
INSERT INTO `product_size` VALUES (126, 73, 'M', 32000, 32000);
INSERT INTO `product_size` VALUES (127, 75, 'M', 40000, 40000);
INSERT INTO `product_size` VALUES (128, 78, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (129, 80, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (130, 81, 'M', 40000, 40000);
INSERT INTO `product_size` VALUES (131, 82, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (132, 84, 'M', 28000, 28000);
INSERT INTO `product_size` VALUES (133, 85, 'M', 36000, 36000);
INSERT INTO `product_size` VALUES (134, 86, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (135, 88, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (136, 90, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (137, 91, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (138, 94, 'M', 30000, 30000);
INSERT INTO `product_size` VALUES (139, 96, 'M', 22000, 22000);
INSERT INTO `product_size` VALUES (140, 97, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (141, 98, 'M', 35000, 35000);
INSERT INTO `product_size` VALUES (142, 99, 'M', 4500, 35000);
INSERT INTO `product_size` VALUES (143, 100, 'M', 4500, 28000);
INSERT INTO `product_size` VALUES (144, 101, 'M', 5250, 38000);
INSERT INTO `product_size` VALUES (145, 104, 'M', 5250, 32000);
INSERT INTO `product_size` VALUES (146, 105, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (147, 111, 'M', 36000, 36000);
INSERT INTO `product_size` VALUES (148, 115, 'M', 4800, 22000);
INSERT INTO `product_size` VALUES (149, 116, 'M', 6300, 35000);
INSERT INTO `product_size` VALUES (150, 117, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (151, 118, 'M', 38000, 38000);
INSERT INTO `product_size` VALUES (152, 119, 'M', 36000, 36000);
INSERT INTO `product_size` VALUES (153, 121, 'M', 4800, 45000);
INSERT INTO `product_size` VALUES (154, 122, 'M', 4500, 29000);
INSERT INTO `product_size` VALUES (155, 123, 'M', 5250, 40000);
INSERT INTO `product_size` VALUES (156, 126, 'M', 4800, 38000);
INSERT INTO `product_size` VALUES (157, 128, 'M', 20000, 20000);
INSERT INTO `product_size` VALUES (158, 131, 'M', 4500, 35000);
INSERT INTO `product_size` VALUES (159, 47, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (160, 50, 'L', 8250, 35000);
INSERT INTO `product_size` VALUES (161, 53, 'L', 8100, 33000);
INSERT INTO `product_size` VALUES (162, 54, 'L', 35000, 35000);
INSERT INTO `product_size` VALUES (163, 56, 'L', 37000, 37000);
INSERT INTO `product_size` VALUES (164, 59, 'L', 7500, 47000);
INSERT INTO `product_size` VALUES (165, 62, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (166, 63, 'L', 7500, 37000);
INSERT INTO `product_size` VALUES (167, 64, 'L', 33000, 33000);
INSERT INTO `product_size` VALUES (168, 67, 'L', 8250, 54000);
INSERT INTO `product_size` VALUES (169, 68, 'L', 37000, 37000);
INSERT INTO `product_size` VALUES (170, 69, 'L', 8250, 35000);
INSERT INTO `product_size` VALUES (171, 70, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (172, 71, 'L', 8250, 33000);
INSERT INTO `product_size` VALUES (173, 72, 'L', 37000, 37000);
INSERT INTO `product_size` VALUES (174, 73, 'L', 4800, 37000);
INSERT INTO `product_size` VALUES (175, 75, 'L', 6000, 45000);
INSERT INTO `product_size` VALUES (176, 78, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (177, 80, 'L', 5250, 40000);
INSERT INTO `product_size` VALUES (178, 81, 'L', 6000, 45000);
INSERT INTO `product_size` VALUES (179, 82, 'L', 4800, 35000);
INSERT INTO `product_size` VALUES (180, 84, 'L', 5550, 33000);
INSERT INTO `product_size` VALUES (181, 85, 'L', 4800, 41000);
INSERT INTO `product_size` VALUES (182, 86, 'L', 6000, 40000);
INSERT INTO `product_size` VALUES (183, 88, 'L', 6300, 43000);
INSERT INTO `product_size` VALUES (184, 90, 'L', 5700, 40000);
INSERT INTO `product_size` VALUES (185, 91, 'L', 6000, 35000);
INSERT INTO `product_size` VALUES (186, 94, 'L', 5250, 35000);
INSERT INTO `product_size` VALUES (187, 96, 'L', 4500, 27000);
INSERT INTO `product_size` VALUES (188, 97, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (189, 98, 'L', 6000, 40000);
INSERT INTO `product_size` VALUES (190, 99, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (191, 100, 'L', 33000, 33000);
INSERT INTO `product_size` VALUES (192, 101, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (193, 104, 'L', 37000, 37000);
INSERT INTO `product_size` VALUES (194, 105, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (195, 111, 'L', 41000, 41000);
INSERT INTO `product_size` VALUES (196, 115, 'L', 27000, 27000);
INSERT INTO `product_size` VALUES (197, 116, 'L', 40000, 40000);
INSERT INTO `product_size` VALUES (198, 117, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (199, 118, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (200, 119, 'L', 41000, 41000);
INSERT INTO `product_size` VALUES (201, 121, 'L', 50000, 50000);
INSERT INTO `product_size` VALUES (202, 122, 'L', 34000, 34000);
INSERT INTO `product_size` VALUES (203, 123, 'L', 45000, 45000);
INSERT INTO `product_size` VALUES (204, 126, 'L', 43000, 43000);
INSERT INTO `product_size` VALUES (205, 128, 'L', 25000, 25000);
INSERT INTO `product_size` VALUES (206, 131, 'L', 40000, 40000);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Bánh Oreo Xay Cùng Cà Phê Cappuccino', 3, 0);
INSERT INTO `products` VALUES (4, 'Cam Ép', 4, 0);
INSERT INTO `products` VALUES (6, 'Caramen Chảy', 3, 0);
INSERT INTO `products` VALUES (7, 'Dâu Ép', 4, 1);
INSERT INTO `products` VALUES (8, 'Dứa Ép', 4, 0);
INSERT INTO `products` VALUES (12, 'Kem Trà Xanh', 3, 0);
INSERT INTO `products` VALUES (18, 'Sinh Tố Chanh', 4, 0);
INSERT INTO `products` VALUES (19, 'Sinh Tố Dâu', 4, 0);
INSERT INTO `products` VALUES (20, 'Sinh Tố Xoài', 4, 0);
INSERT INTO `products` VALUES (21, 'Sô-Cô-La Cà Phê Đá Xay', 3, 0);
INSERT INTO `products` VALUES (22, 'Sô-Cô-La Xay Cùng Hạnh Nhân Và Espresso', 3, 0);
INSERT INTO `products` VALUES (23, 'Sữa Chua Phúc Bồn Tử Đác Cam', 5, 0);
INSERT INTO `products` VALUES (24, 'Sữa Chua Xoài Đác Thơm', 5, 0);
INSERT INTO `products` VALUES (25, 'Táo Ép', 4, 0);
INSERT INTO `products` VALUES (26, 'Táo Và Dâu Ép', 4, 0);
INSERT INTO `products` VALUES (27, 'Thơm Và Dâu Ép', 4, 0);
INSERT INTO `products` VALUES (28, 'Trà Đào Đá Xay', 1, 1);
INSERT INTO `products` VALUES (29, 'Trà Đào Phúc Long', 1, 1);
INSERT INTO `products` VALUES (30, 'Trà Đào Sữa', 1, 1);
INSERT INTO `products` VALUES (31, 'Trà Hoa Hồng', 1, 1);
INSERT INTO `products` VALUES (32, 'Trà Lài Đác Thơm', 1, 1);
INSERT INTO `products` VALUES (33, 'Trà Nhãn - Lài', 1, 1);
INSERT INTO `products` VALUES (34, 'Trà Nhãn - Sen', 1, 1);
INSERT INTO `products` VALUES (35, 'Trà Ô Long Dâu', 1, 1);
INSERT INTO `products` VALUES (36, 'Trà Ô Long Mãng Cầu', 1, 1);
INSERT INTO `products` VALUES (37, 'Trà Ô Long Sữa', 1, 1);
INSERT INTO `products` VALUES (38, 'Trà Sen Vàng (Củ Năng)', 1, 1);
INSERT INTO `products` VALUES (39, 'Trà Sen Vàng (Sen)', 1, 1);
INSERT INTO `products` VALUES (40, 'Trà Sữa Phúc Long', 1, 1);
INSERT INTO `products` VALUES (41, 'Trà Thạch Vãi', 1, 1);
INSERT INTO `products` VALUES (42, 'Trà Thanh Đào', 1, 1);
INSERT INTO `products` VALUES (43, 'Trà Thảo Mộc', 1, 1);
INSERT INTO `products` VALUES (44, 'Trà Vãi - Sen', 1, 1);
INSERT INTO `products` VALUES (45, 'Trà Vãi Lài', 1, 1);
INSERT INTO `products` VALUES (46, 'Trà Xanh Đá Xay', 3, 0);
INSERT INTO `products` VALUES (47, 'Choco Ngũ Cốc Kem Cafe', 2, 1);
INSERT INTO `products` VALUES (48, 'Creme Brulee Latte', 1, 1);
INSERT INTO `products` VALUES (49, 'Creme Brulee Matcha', 1, 1);
INSERT INTO `products` VALUES (50, 'Creme Brulee Milk Tea', 1, 1);
INSERT INTO `products` VALUES (51, 'Creme Brulee Tea', 1, 1);
INSERT INTO `products` VALUES (52, 'Đào Latte', 1, 1);
INSERT INTO `products` VALUES (53, 'Dâu Latte', 1, 1);
INSERT INTO `products` VALUES (54, 'Dolce Milk Tea Float', 1, 1);
INSERT INTO `products` VALUES (55, 'Grass Jelly Milk Coffee', 2, 1);
INSERT INTO `products` VALUES (56, 'Hồng Trà', 1, 1);
INSERT INTO `products` VALUES (57, ' Hồng Trà Bưởi Mật Ong', 1, 1);
INSERT INTO `products` VALUES (58, 'Hồng Trà Dâu', 1, 1);
INSERT INTO `products` VALUES (59, 'Hồng Trà Ngũ Cốc Kem Cafe', 1, 1);
INSERT INTO `products` VALUES (60, 'Instant Milk Tea – Original ', 1, 1);
INSERT INTO `products` VALUES (61, 'Instant Milk Tea – Strawberry ', 1, 1);
INSERT INTO `products` VALUES (62, ' Kem Tuyết Socola', 3, 1);
INSERT INTO `products` VALUES (63, 'Kem Tuyết Trà Xanh Nhật Bản', 3, 1);
INSERT INTO `products` VALUES (64, 'Matcha Đậu Đỏ', 3, 1);
INSERT INTO `products` VALUES (65, 'Ô Long Kem Phô Mai', 1, 1);
INSERT INTO `products` VALUES (66, ' Ô Long Thái Cực', 1, 1);
INSERT INTO `products` VALUES (67, ' Ô Long Xoài Kem Cà Phê ', 1, 1);
INSERT INTO `products` VALUES (68, ' Okinawa Latte', 1, 1);
INSERT INTO `products` VALUES (69, 'Okinawa Latte Float', 1, 1);
INSERT INTO `products` VALUES (70, 'Okinawa Oreo Cream Milk Tea', 1, 1);
INSERT INTO `products` VALUES (71, 'Oolong Trân Châu Baby Kem Café', 1, 1);
INSERT INTO `products` VALUES (72, 'Probi Bưởi Trân Châu Sương Mai', 1, 1);
INSERT INTO `products` VALUES (73, 'Probi Xoài Trân Châu Sương Mai', 1, 1);
INSERT INTO `products` VALUES (74, ' Royal Pearl Milk Coffee', 2, 0);
INSERT INTO `products` VALUES (75, ' Strawberry Milk Tea', 1, 1);
INSERT INTO `products` VALUES (76, 'Sữa Chua Dâu Tằm Hạt Dẻ', 5, 0);
INSERT INTO `products` VALUES (77, 'Sữa Chua Dâu Tằm Hoàng Kim', 5, 1);
INSERT INTO `products` VALUES (78, 'Sữa Chua Mận Hạt Sen', 5, 0);
INSERT INTO `products` VALUES (79, 'Sữa Chua Trắng', 5, 0);
INSERT INTO `products` VALUES (80, 'Sữa Tươi Long Nhãn Táo Đỏ', 1, 1);
INSERT INTO `products` VALUES (81, ' Sữa Tươi Okinawa', 1, 1);
INSERT INTO `products` VALUES (82, ' Sữa Tươi Trân Châu Baby Kem Café', 1, 1);
INSERT INTO `products` VALUES (83, 'Tiger Sugar', 1, 1);
INSERT INTO `products` VALUES (84, 'Toffee Black Tea Latte', 1, 1);
INSERT INTO `products` VALUES (85, 'Toffee Chocolatea', 1, 1);
INSERT INTO `products` VALUES (86, ' Trà Alisan Gong Cha', 1, 1);
INSERT INTO `products` VALUES (87, ' Trà Bí Đao Gong Cha', 1, 1);
INSERT INTO `products` VALUES (88, ' Trà Đào', 1, 1);
INSERT INTO `products` VALUES (89, ' Trà Đào Bưởi Hồng Trân Châu Baby', 1, 1);
INSERT INTO `products` VALUES (90, 'Trà Dâu Tầm Pha Lê Tuyết', 1, 1);
INSERT INTO `products` VALUES (91, 'Trà Đen Gong Cha', 1, 1);
INSERT INTO `products` VALUES (92, 'Trà dứa nhiệt đới', 1, 1);
INSERT INTO `products` VALUES (93, 'Trà Oolong Gong Cha', 1, 1);
INSERT INTO `products` VALUES (94, 'Trà Sữa', 1, 1);
INSERT INTO `products` VALUES (95, 'Trà Sữa Ba Anh Em', 1, 1);
INSERT INTO `products` VALUES (96, 'Trà Sữa Bạc Hà', 1, 1);
INSERT INTO `products` VALUES (97, 'Trà Sữa Chocolate', 1, 1);
INSERT INTO `products` VALUES (98, 'Trà Sữa Đào', 1, 1);
INSERT INTO `products` VALUES (99, 'Trà Sữa Dâu Tây', 1, 1);
INSERT INTO `products` VALUES (100, 'Trà Sữa Dolce Trân Châu Hoàng Kim', 1, 1);
INSERT INTO `products` VALUES (101, 'Trà Sữa Gạo Rang', 1, 1);
INSERT INTO `products` VALUES (102, 'Trà Sữa Gạo Rang Okinawa', 1, 1);
INSERT INTO `products` VALUES (103, 'Trà Sữa Hạnh Phúc', 1, 1);
INSERT INTO `products` VALUES (104, 'Trà Sữa Hokkaido', 1, 1);
INSERT INTO `products` VALUES (105, ' Trà Sữa Khoai Môn', 1, 1);
INSERT INTO `products` VALUES (106, 'Trà Sữa Kim Cương Đen Okinawa', 1, 1);
INSERT INTO `products` VALUES (107, 'Trà Sữa Matcha', 1, 1);
INSERT INTO `products` VALUES (108, ' Trà Sữa Matcha Đậu Đỏ', 1, 1);
INSERT INTO `products` VALUES (109, 'Trà Sữa Ô Long', 1, 1);
INSERT INTO `products` VALUES (110, 'Trà Sữa Okinawa', 1, 1);
INSERT INTO `products` VALUES (111, 'Trà Sữa Oolong', 1, 1);
INSERT INTO `products` VALUES (112, 'Trà sữa Oolong 3J', 1, 1);
INSERT INTO `products` VALUES (113, 'Trà Sữa Panda', 1, 1);
INSERT INTO `products` VALUES (114, 'Trà Sữa Pudding Đậu Đỏ', 1, 1);
INSERT INTO `products` VALUES (115, 'Trà Sữa Socola', 1, 1);
INSERT INTO `products` VALUES (116, 'Trà Sữa Sương Sáo', 1, 1);
INSERT INTO `products` VALUES (117, 'Trà Sữa Trà Đen', 1, 1);
INSERT INTO `products` VALUES (118, 'Trà Sữa Trà Xanh', 1, 1);
INSERT INTO `products` VALUES (119, 'Trà Sữa Trân Châu Đen', 1, 1);
INSERT INTO `products` VALUES (120, 'Trà Sữa Trân Châu Hoàng Gia', 1, 3);
INSERT INTO `products` VALUES (121, ' Trà Sữa Trân Châu Hoàng Kim', 1, 1);
INSERT INTO `products` VALUES (122, ' Trà Sữa Truyền Thống', 1, 1);
INSERT INTO `products` VALUES (123, 'Trà Sữa Xoài Trân Châu Đen', 1, 1);
INSERT INTO `products` VALUES (124, 'Trà Vải', 1, 1);
INSERT INTO `products` VALUES (125, 'Trà Xanh', 1, 1);
INSERT INTO `products` VALUES (126, 'Trà Xanh Gong Cha', 1, 1);
INSERT INTO `products` VALUES (127, 'Trà Xanh Kiwi', 1, 1);
INSERT INTO `products` VALUES (128, 'Trà Xanh Sữa Vị Nhài', 1, 1);
INSERT INTO `products` VALUES (129, 'Trà Xoài Bưởi Hồng', 1, 1);
INSERT INTO `products` VALUES (130, ' Trà Xoài Bưởi Hồng Kem Phô Mai', 1, 1);
INSERT INTO `products` VALUES (131, 'Xoài Matcha Latte', 1, 3);

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NULL DEFAULT NULL,
  `category_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  INDEX `sale_id`(`sale_id` ASC) USING BTREE,
  CONSTRAINT `sale_detail_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sale_detail_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
INSERT INTO `sale_detail` VALUES (6, 8, NULL, 1);
INSERT INTO `sale_detail` VALUES (7, 9, NULL, 1);
INSERT INTO `sale_detail` VALUES (8, 10, NULL, 1);
INSERT INTO `sale_detail` VALUES (9, 10, NULL, 2);
INSERT INTO `sale_detail` VALUES (10, 10, NULL, 3);
INSERT INTO `sale_detail` VALUES (11, 10, NULL, 4);
INSERT INTO `sale_detail` VALUES (12, 11, 6, NULL);
INSERT INTO `sale_detail` VALUES (13, 11, 7, NULL);
INSERT INTO `sale_detail` VALUES (14, 11, 26, NULL);
INSERT INTO `sale_detail` VALUES (15, 11, NULL, 2);
INSERT INTO `sale_detail` VALUES (16, 11, NULL, 3);
INSERT INTO `sale_detail` VALUES (17, 11, NULL, 4);
INSERT INTO `sale_detail` VALUES (18, 11, NULL, 5);
INSERT INTO `sale_detail` VALUES (19, 12, NULL, 1);

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `percent` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (8, 'Teets', 15, '2023-01-28', '2023-02-04');
INSERT INTO `sales` VALUES (9, 'Teets', 15, '2023-01-28', '2023-02-04');
INSERT INTO `sales` VALUES (10, 'Teets', 15, '2023-01-28', '2023-02-04');
INSERT INTO `sales` VALUES (11, 'Nguyễn Vũ Mạnh Hà', 15, '2022-12-27', '2022-12-27');
INSERT INTO `sales` VALUES (12, 'Năm mới 2023', 15, '2023-01-01', '2023-01-15');

-- ----------------------------
-- Table structure for topping_order
-- ----------------------------
DROP TABLE IF EXISTS `topping_order`;
CREATE TABLE `topping_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `topping_id` int NOT NULL,
  `order_detail_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_detail_id`(`order_detail_id` ASC) USING BTREE,
  INDEX `topping_id`(`topping_id` ASC) USING BTREE,
  CONSTRAINT `topping_order_ibfk_1` FOREIGN KEY (`order_detail_id`) REFERENCES `order_detail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `topping_order_ibfk_2` FOREIGN KEY (`topping_id`) REFERENCES `toppings` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of topping_order
-- ----------------------------
INSERT INTO `topping_order` VALUES (1, 17, 2);
INSERT INTO `topping_order` VALUES (2, 4, 3);
INSERT INTO `topping_order` VALUES (3, 7, 3);
INSERT INTO `topping_order` VALUES (4, 10, 3);
INSERT INTO `topping_order` VALUES (5, 4, 5);
INSERT INTO `topping_order` VALUES (6, 10, 5);
INSERT INTO `topping_order` VALUES (7, 12, 8);
INSERT INTO `topping_order` VALUES (8, 16, 9);
INSERT INTO `topping_order` VALUES (9, 15, 10);
INSERT INTO `topping_order` VALUES (10, 6, 12);

-- ----------------------------
-- Table structure for toppings
-- ----------------------------
DROP TABLE IF EXISTS `toppings`;
CREATE TABLE `toppings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` float NOT NULL,
  `category_id` int NOT NULL,
  `status` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `toppings_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of toppings
-- ----------------------------
INSERT INTO `toppings` VALUES (3, 'Đào', 15000, 1, 0);
INSERT INTO `toppings` VALUES (4, 'Đào', 15000, 4, 0);
INSERT INTO `toppings` VALUES (5, 'Đào', 15000, 5, 0);
INSERT INTO `toppings` VALUES (6, 'Vải', 15000, 1, 0);
INSERT INTO `toppings` VALUES (7, 'Vải', 15000, 4, 0);
INSERT INTO `toppings` VALUES (8, 'Vải', 15000, 5, 0);
INSERT INTO `toppings` VALUES (9, 'Nhãn', 15000, 1, 0);
INSERT INTO `toppings` VALUES (10, 'Nhãn', 15000, 4, 0);
INSERT INTO `toppings` VALUES (11, 'Nhãn', 15000, 5, 0);
INSERT INTO `toppings` VALUES (12, 'Whipped cream ', 15000, 1, 0);
INSERT INTO `toppings` VALUES (13, 'Whipped cream', 15000, 3, 1);
INSERT INTO `toppings` VALUES (14, 'Whipped cream', 15000, 5, 1);
INSERT INTO `toppings` VALUES (15, 'Bánh Flan', 16000, 1, 0);
INSERT INTO `toppings` VALUES (16, 'Espresso Shot', 24000, 1, 0);
INSERT INTO `toppings` VALUES (17, 'Espresso Shot', 24000, 3, 0);
INSERT INTO `toppings` VALUES (18, 'Espresso Shot', 24000, 5, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `level` tinyint NOT NULL DEFAULT 0,
  `token` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'manhha5842', 'a4c9e6e813cf99bc40046b06cad1848e4819cab63c18eb58debac9592229683e', 'HÃ ', '', '0344558306', 'manhha584224@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (3, 'abc', '804498493bae57df2783c3a70cb22f13859f13dbf141e9201e8712b4ff209d33', 'Nguyễn Vũ Mạnh Hà', '', '0344558306', 'manhha584224@gmail.com', 1, 'qFNAm5gw9R-IY_x8o7uPUlQpu7y5EdJi');
INSERT INTO `user` VALUES (4, 'undefined', 'eb045d78d273107348b0300c01d29b7552d622abbc6faf81b3ec55359aa9950c', 'undefined', '', '', 'undefined', 0, NULL);
INSERT INTO `user` VALUES (5, '113088951446987270620', '8f574df2c949477d190503f36f467d465489c3b7c8c1bde0fe4e45ed6f97de70', 'H-Bell', '', '0344558306', 'manhha584224@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (6, 'manhha584224', 'b08befce0a28f4799a1db011f81a69b6bf05a358def74e0b4df4c8342949dd9', 'Nguyễn Vũ Mạnh Hà', '', '0344558306', 'manhha584224@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (7, '123', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'aasds', '', '0366443541', '123@gmail.com', 0, 'EPOxwf4fGqQcAXak4xrKKIiPjR5QaU_o');
INSERT INTO `user` VALUES (8, 'cay', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'Trái', '', '0345582306', '123@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (9, 'abcd', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'Hà', '', '0344558306', '123@gmail.com', 0, 'iyWqbQqy7USO7wkvG2w0ckrrSSJcm2ye');
INSERT INTO `user` VALUES (10, 'asd', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'Hà', '', '0344558306', 'abc@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (11, '456', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'sáa', '', '0344558306', 'manhha584224@gmail.com', 0, 'CkbgTujUgXRGU8yvECZN7I2fltbKueOo');
INSERT INTO `user` VALUES (12, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '', '', '', 1, 'rxkzVhQMTLhW51qAqWmFxfAIG8I7yOwR');
INSERT INTO `user` VALUES (15, '113922272377385336933', '416252e39f2f986975f2f361536167f03879d8a6e1b438a68dbc37fee857d2a', 'H-N z', '', '', 'manhha300622@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (16, 'hahaha', '49a68c15c0d6e26c8b4a0743e6b87f074864c2fae5983c88956cb2882d608f5', 'Hà', '', '0344558306', 'manhhha584224@gmail.com', 0, 'AfiTuKufNspUKdFL5lLwh3iwt0F6PEDb');
INSERT INTO `user` VALUES (18, 'dam', '60166a3b3b252885e0c489b2da291048d8af0349326d23d96140b065f65f31f5', 'Dam Thanh', '', '0377184642', 'buithanhdam02@gmail.com', 0, '47HEPK1rN5L4QtqqJg0_rOh_2j-TLLQj');
INSERT INTO `user` VALUES (19, 'tinhdeptrai', '3501a09179ac933084b1314bc537bb6d517c0c6a57cffc5e89c93348dafd598f', 'Lê Trọng Tình', '', '0986852943', 'tinhle2772002@gmail.com', 0, NULL);
INSERT INTO `user` VALUES (21, 'dam2', '8c65b9f5b3790fe6b4e1b72d6ec5aee1d27f8162c8ef3fe48748b38562bd1bed', 'Damm', '', '0377184642', 'thanhdamcd@gmail.com', 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
