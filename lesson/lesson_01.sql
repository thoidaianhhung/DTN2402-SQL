-- Tạo cơ sở dữ liệu
CREATE DATABASE lesson_01;
CREATE DATABASE lesson_02;
-- Xóa cơ sở dữ liệu (nếu tồn tại);
DROP DATABASE IF EXISTS lesson_01;

-- Hiển thị danh sách Database
SHOW DATABASES;

-- Chọn DATABASE
USE lesson_01;

-- Kiểu dữ liệu
-- Số nguyên: TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
-- Số thực:FLOAT, DOUBLE
-- Chuỗi: VARCHAR(50), CHAR(50)
-- Thời gian: DATE (YYYY-MM-dd), TIME, DATETIME
-- Logic: BOOLEAN, BIT
-- Enum: ENUM("Loading", "Success", "Error")

-- Tạo Bảng
CREATE TABLE department (
	id INT,
    name VARCHAR(50),
    created_date DATE
);

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS department;

-- Thêm dữ liệu vào bảng
INSERT INTO department (id, name, created_date)
VALUES 					(1, "Bảo Vệ", "2020-05-19"),
						(2, "Kinh Doanh", "2020-07-23"),
						(3, "Giám Đốc", "2023-09-22");
TABLE department;
SELECT * FROM department;
-- Ràng buộc dữ liệu
-- Khóa chính (PRIMARY KEY)
-- 1. Một bảng có tối đa 1 khóa chính
-- 2. Giá trị là duy nhất
-- 3. Phải NOT NULL
-- Tự động tăng: AUTO_INCREMENT
CREATE TABLE product (
	id INT PRIMARY KEY AUTO_iNCREMENT,
    name VARCHAR(50)
);

INSERT INTO product (id, name)
VALUES (1, "Chuột máy tính");
--
INSERT INTO product (id, name)
VALUES (2, "Chuột máy tính");
--
INSERT INTO product (name)
VALUES ("Bàn phím máy tính");

-- NOT NULL: Không được để chống

DROP TABLE IF EXISTS question;
 CREATE TABLE question (
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(100) NOT NULL
);

INSERT INTO question (content)
VALUES (NULL);

INSERT INTO question (content)
VALUES ("");

