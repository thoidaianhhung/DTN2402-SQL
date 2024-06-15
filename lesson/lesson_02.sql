-- UNIQUE KEY: Kháo duy nhất
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	id INT PRIMARY KEY  AUTO_INCREMENT,
	email VARCHAR(100) UNIQUE
);
--
INSERT INTO customer (email)
VALUES ("hungnv@gmail.com");

-- DEFAULT: Mặc định
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	id INT PRIMARY KEY  AUTO_INCREMENT,
	email VARCHAR(100) DEFAULT "unknow@gmail.com",
    created_date DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO customer (id)
VALUES (1);

-- Check: kiểm tra
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	id INT PRIMARY KEY  AUTO_INCREMENT,
	age INT CHECK (age >= 18)
);
INSERT INTO `user` (age)
VALUES (20);

-- FOREIGN KEY: Khóa ngoại
DROP TABLE IF EXISTS account;
CREATE TABLE account (
	id INT PRIMARY KEY  AUTO_INCREMENT,
	full_name VARCHAR(200),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
    ON UPDATE CASCADE ON DELETE CASCADE -- SET NULL
);
INSERT INTO account (full_name, department_id)
VALUES ("Nguyễn Văn Hùng", 1);
