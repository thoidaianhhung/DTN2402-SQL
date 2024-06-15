-- Assignment 1
CREATE DATABASE testing_system;

-- Table 1: Department
USE testing_system;
CREATE TABLE department (
	department_id int PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);
INSERT INTO department (department_id, department_name)
VALUES (1, "Sale");
INSERT INTO department (department_name)
VALUES ("Marketing");

-- Table 2: Position
DROP TABLE  IF EXISTS position;
CREATE TABLE position (
	position_id INT PRIMARY KEY AUTO_INCREMENT,
    position_name ENUM("Dev", "Test", "Scrum Master", "PM") NOT NULL
);
INSERT INTO position (position_id, position_name) 
VALUES  (1, "Dev");
INSERT INTO position (position_name)
VALUES  ("Test"),
		("Scrum master"),
		("PM");
        
-- Table 3: Account
CREATE TABLE account (
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    department_id INT,
    position_id INT,
    create_date DATE
);
INSERT INTO account (account_id, email, user_name, full_name, department_id, position_id, create_date) 
VALUES  (1, "nguyenvanhung@gmail.com", "thoidaianhhung", "Nguyễn Văn Hùng", 1, 1, "2024-05-10");

-- Table 4: Group
CREATE TABLE `group` (
	group_id INT PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(50) NOT NULL,
    creator_id INT NOT NULL,
    create_date DATE NOT NULL
);

-- Table 5: Group account
CREATE TABLE group_account (
	group_id INT NOT NULL,
    account_id INT NOT NULL,
    join_date DATE NOT NULL
);

-- Table 6: Type question
CREATE TABLE type_question (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL
);
INSERT INTO type_question (type_id, type_name)
VALUES  (1, "Essay"),
		(2, "Multiple-Choice");
        
-- Table 7: Category question
CREATE TABLE category_question (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);
INSERT INTO category_question (category_id, category_name)
VALUES (1, "Java");
INSERT INTO category_question(category_name)
VALUES  (".NET"),
		("SQL"),
        ("Postman"),
        ("Ruby");
        
-- Table 8: question
CREATE TABLE question (
	question_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    category_id VARCHAR(50) NOT NULL,
    type_id VARCHAR(50) NOT NULL,
    creator_id INT NOT NULL,
    create_date DATE NOT NULL
);

-- Table 9: Answer
CREATE TABLE answer (
	answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    question_id INT NOT NULL,
    is_correct BOOLEAN NOT NULL
);

-- Table 10: exam
CREATE TABLE exam (
	exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
    category_id INT NOT NULL,
    duration TIME NOT NULL,
    creator_id INT NOT NULL,
    create_date DATE
);

-- Table 11: exam question
CREATE TABLE exam_question (
	exam_id INT NOT NULL,
    question_id INT NOT NULL
);

