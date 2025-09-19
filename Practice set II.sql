-- Part A

DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE IF NOT EXISTS StudentEnrollments (
    enrollment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    enrollment_date DATE NOT NULL,
    UNIQUE(student_name, course_id)
);
INSERT INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date) VALUES
(1, 'Ashish', 'CSE101', '2024-07-01'),
(2, 'Smaran', 'CSE102', '2024-07-01'),
(3, 'Vaibhav', 'CSE101', '2024-07-01');

INSERT INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (4, 'Ashish', 'CSE101', '2024-07-02');  


-- Part B

-- User A
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

-- User B
START TRANSACTION;
UPDATE StudentEnrollments
SET enrollment_date = '2024-07-05'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';

COMMIT;


-- Part C

-- User A:
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

-- User B
START TRANSACTION;
SELECT * FROM StudentEnrollments
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

-- User A updates:
UPDATE StudentEnrollments
SET enrollment_date = '2024-07-10'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;

-- User B proceeds:
UPDATE StudentEnrollments
SET enrollment_date = '2024-07-15'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;


SELECT * FROM StudentEnrollments WHERE student_name = 'Ashish' AND course_id = 'CSE101';
