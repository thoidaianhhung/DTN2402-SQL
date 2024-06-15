-- Mệnh đề SELECT
SELECT CURRENT_DATE ;
SELECT CURRENT_DATE AS "Today", NOW() AS "Now";
SELECT CURRENT_DATE  "Today", NOW()  "Now";

-- Mệnh đề FROM Lấy dữ liệu từ đâu
SELECT department_name, department_id
FROM department;

-- *: Lấy ra tất cả
SELECT *
FROM question;

-- Where: Lọc dữ liệu
-- Toán tử: >, >=, <, <=, +, != (<>)
SELECT *
FROM department
WHERE department_id <> 5;

-- ADN, OR
SELECT *
FROM department
WHERE department_id >3 AND department_id < 8;
SELECT * 
FROM department
WHERE department_id < 3 OR department_id > 8;

-- BETWEEN .. AND ... 
SELECT *
FROM department
WHERE department_id BETWEEN 3 AND 8 ;

-- IN 
SELECT *
FROM department
WHERE department_id IN (2, 4, 7);

-- Question 2:
SELECT *
FROM department;

-- Question 3:
SELECT department_id
FROM department
WHERE department_name = "Sale" ;

-- Question 6:
SELECT group_name
FROM `group`
WHERE created_date < "2019-12-20" ;

-- Question 8:
SELECT code
FROM exam
WHERE created_date < "2019-12-20" and duration >= 60;

-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- Question 2: lấy ra tất cả các phòng ban
-- Question 3: lấy ra id của phòng ban "Sale"
-- Question 4: lấy ra thông tin account có full name dài nhất
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng
-- ban có id= 3
-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
-- Question 7: Lấy ra ID của question có &gt;= 4 câu trả lời
-- Question 8: Lấy ra các mã đề thi có thời gian thi &gt;= 60 phút và được tạo
-- trước ngày
-- 20/12/2019
-- Question 9: Lấy ra 5 group được tạo gần đây nhất
-- Question 10: Đếm số nhân viên thuộc department có id = 2
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ &quot;D&quot; và kết thúc
-- bằng chữ &quot;o&quot;
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ &quot;câu hỏi&quot;
-- Question 14: Update thông tin của account có id = 5 thành tên &quot;Nguyễn Bá
-- Lộc&quot; và
-- email thành loc.nguyenba@vti.com.vn
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

-- LIKE 
-- _: Đại diện cho 1 ký tự
-- %: Dại diện cho 0 hoặc nhiều kí tự
SELECT *
FROM department
WHERE department_name LIKE "%n%";

-- IS NULL / IS NOT NULL
SELECT *
FROM department
WHERE department_name IS NOT NULL;

-- Mệnh đề LIMIT giới hạn
SELECT *
FROM department
LIMIT 5;
-- 1000
-- 10 -> 100
-- Page: 1, 10
-- Page: 2, 10
SELECT *
FROM department
LIMIT 6, 3; -- Start, Number

-- Mệnh đề ORDER BY
-- ASC tăng dần, DESC giảm dần
-- Mặc đinh ASC
SELECT * 
FROM exam
ORDER BY duration DESC;
-- 
SELECT * 
FROM exam
ORDER BY duration DESC, created_date ASC;

-- Hàm tổng hợp
-- COUNT (*): Đếm số dòng
SELECT COUNT(*) AS exam_account
FROM exam;

-- COUNT (id): Đếm số dòng có id IS NOT NULL
INSERT INTO exam (exam_id, code, title, category_id, duration, creator_id)
VALUES 			 ('11', 'VTIQ011', 'Đề thi MySQL', '2', null, '9');
SELECT COUNT(duration) 
FROM exam;

-- SUM, MIN, MAX, AVG
SELECT SUM(duration), MIN(duration), MAX(duration), AVG(duration)
FROM exam;

-- Mệnh đề group by
SELECT duration, COUNT(exam_id) AS exam_account
FROM exam
GROUP BY duration;

SELECT duration, created_date, COUNT(exam_id) AS exam_account
FROM exam
GROUP BY created_date,  duration
ORDER BY duration, created_date;

-- Mệnh đề HAVING điều kiện trên 1 nhóm
SELECT duration, created_date, COUNT(exam_id) AS exam_account
FROM exam
GROUP BY created_date,  duration
HAVING COUNT(exam_id) > 1
ORDER BY duration, created_date;

-- Cập nhật dữ liệu
UPDATE department
SET department_name = "Phòng chờ"
WHERE department_id = 1;

-- Xóa dữ liệu
DELETE FROM exam
WHERE duration IS NULL;
