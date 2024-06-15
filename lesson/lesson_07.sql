-- LOCAL VARIABLE: Biến cục bộ
-- Phạm vi sử dụng trong khối lênh BEGIN END
-- Từ khóa: DECLARE
-- VD: DECLARE id INT;

-- SESSION VARIABLE: Biến session
-- Phạm vi sử dụng: Trong 1 phiên làm việc
-- Từ khóa: SET
SET @age = 18;
SELECT @age;

-- GLOBAL VARIABLE: Biến toàn cục
-- Phạm vi sử dụng: Toàn bộ
-- Từ khóa: SET
-- Hiển thị danh sách biến
SHOW VARIABLES;
-- Thay đổi connec_timeout thành 5
SET GLOBAL connect_timeout = 5;

-- TRIGGER
-- Thời điểm: BEFORE, AFTER
-- Sự kiện: INSERT, UPDATE, DELETE
-- Tham chiếu: OLD, NEW
DROP TRIGGER IF EXISTS trigger_01;
DELIMITER $$
CREATE TRIGGER trigger_01
BEFORE INSERT ON group_account
FOR EACH ROW
BEGIN
	IF NEW.joined_date > CURRENT_DATE THEN
		SET NEW.joined_date = CURRENT_DATE;
    END IF;
END $$
DELIMITER ;

-- VD2:
DROP TRIGGER IF EXISTS trigger_02;
DELIMITER $$
CREATE TRIGGER trigger_02
BEFORE INSERT ON group_account
FOR EACH ROW
BEGIN
	IF NEW.joined_date > CURRENT_DATE THEN
		SIGNAL SQLSTATE "12345"
        SET MESSAGE_TEXT = "Thời gian tham gia không hợp lệ";
    END IF;
END $$
DELIMITER ;

INSERT INTO group_account (group_id, account_id, joined_date)
VALUES (5, 1, "4000-04-04");

SHOW TRIGGERS;

-- CASE WHEN
SELECT *,
	CASE
		WHEN duration <= 60 THEN "Short time"
        WHEN duration <= 90 THEN "Medium time"
        ELSE "Long time"
    END AS duration_type
FROM exam;


-- INDEX: Đánh chỉ mục
CREATE INDEX index_department_name ON department (department_name);

SELECT *
FROM department
WHERE department_name = "Sale";

-- Xóa index
DROP INDEX index_name ON department;

SHOW INDEX FROM department;
