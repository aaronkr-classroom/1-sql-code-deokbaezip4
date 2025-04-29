-- 기존 테이블 삭제 (존재할 경우)
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teacher;

-- 1. teacher 테이블 생성
CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 2. student 테이블 생성
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 3. course 테이블 생성
CREATE TABLE course (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

-- 4. student_course 테이블 생성
CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- teacher 데이터 삽입
INSERT INTO teacher (first_name, last_name) VALUES
('Taylah', 'Booker'),
('Sarah-Louise', 'Blake');

-- student 데이터 삽입
INSERT INTO student (first_name, last_name) VALUES
('Shreya', 'Bain'),
('Rianna', 'Foster'),
('Yosef', 'Naylor');

-- course 데이터 삽입
INSERT INTO course (name, teacher_id) VALUES
('Database design', 1),
('English literature', 2),
('Python programming', 1);

-- student_course 데이터 삽입
INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);

SELECT 
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    c.name AS course_name,
    t.first_name AS teacher_first_name,
    t.last_name AS teacher_last_name
FROM student s
JOIN student_course sc ON s.id = sc.student_id
JOIN course c ON sc.course_id = c.id
JOIN teacher t ON c.teacher_id = t.id;
