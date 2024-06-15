-- SUBQUERY : Truy vấn con
-- Thứ tự chạy từ trong ra ngoài
-- VD: lấy ra tất cả chức vụ có ít người nhất
SELECT COUNT(account_id)
FROM position
LEFT JOIN account USING (position_id)
GROUP BY position_id;

SELECT MIN(account_count)
FROM (
	SELECT COUNT(account_id) AS account_count
	FROM position
	LEFT JOIN account USING (position_id)
	GROUP BY position_id
	) AS T;
    
SELECT position.*, COUNT(account_id) AS account_count
FROM position
LEFT JOIN account USING(position_id)
GROUP BY position_id
HAVING COUNT(account_id) = (
SELECT MIN(account_count)
	FROM (
		SELECT COUNT(account_id) AS account_count
		FROM position
		LEFT JOIN account USING (position_id)
		GROUP BY position_id
		) AS T);
        
-- ANY, ALL
SELECT  *
FROM account
WHERE department_id = ANY
	(SELECT department_id
    FROM department
    WHERE department_name IN ("Bảo vệ", "Sale"));
-- EXISTS;
SELECT `group`.*
FROM `group` AS g
WHERE NOT EXISTS 
	(SELECT *
    FROM group_account AS ga
    WHERE g.group_id = ga.group_id);
-- VIEW: Bảng ảo
DROP  VIEW IF EXISTS view_01;
CREATE OR REPLACE VIEW view_01 AS
SELECT *
FROM department;

SELECT *
FROM view_01;

-- CTE: Common Table Expression
-- Bang tam lưu trong bộ nhớ RAM, câu lệnh kết thúc bộ nhớ giải phóng
-- VD: lấy ra tất cả phòng ban có nhiều nhân viên nhất
WITH c1 AS (
	SELECT department.*, COUNT(account_id) AS account_count
    FROM department
    LEFT JOIN account USING (department_id)
    GROUP BY department_id
)
SELECT *
FROM c1 
WHERE account_count = 
	(SELECT MAX(account_count)
	FROM c1);