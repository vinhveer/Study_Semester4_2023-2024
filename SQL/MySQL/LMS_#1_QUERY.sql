USE course_management;

-- Đăng nhập
SET @input_username = 'nguyenquangvinh';
SET @input_password = 'dododododo';

SELECT ua.username, ua.password, r.role_name
FROM user_account ua
INNER JOIN user_role ur ON ua.user_id = ur.user_id
INNER JOIN role r ON ur.role_id = r.role_id
WHERE ua.username = @input_username
AND ua.password = @input_password;

-- Khóa học của tôi
SELECT co.course_code, co.course_name, us.full_name
FROM course co
INNER JOIN course_member cm ON co.course_id = cm.course_id
INNER JOIN user us ON cm.student_id = us.user_id WHERE us.user_id = 2;

-- Thời khóa biểu
SELECT co.course_name ,cs.day_of_week, cs.start_time, cs.end_time
FROM course_schedule cs
INNER JOIN course co ON cs.course_id = co.course_id
INNER JOIN course_member cm ON co.course_id = cm.course_id
INNER JOIN user us ON cm.student_id = us.user_id WHERE us.user_id = 1;

-- Đăng ký khóa học
SELECT co.*
FROM course co
WHERE NOT EXISTS (
    SELECT 1
    FROM course_member cm
    INNER JOIN user us ON cm.student_id = us.user_id
    WHERE co.course_id = cm.course_id AND us.user_id = 1
);

-- Trong khóa học, giả sử là INS325
-- Danh sách thành viên khóa học
SELECT us.user_id, us.full_name, co.course_code
FROM course co
INNER JOIN course_member cm ON co.course_id = cm.course_id
INNER JOIN user us ON cm.student_id = us.user_id
WHERE co.course_code = 'INS325';

-- Điểm số thành viên
SELECT us.user_id, us.full_name, co.course_code, gc.grade_column_name, gr.score
FROM course co
INNER JOIN course_member cm ON co.course_id = cm.course_id
INNER JOIN user us ON cm.student_id = us.user_id
INNER JOIN grade gr ON cm.member_id = gr.member_id
INNER JOIN grade_column gc ON gr.column_id = gc.column_id
WHERE co.course_code = 'INS325' AND us.user_id = 1;