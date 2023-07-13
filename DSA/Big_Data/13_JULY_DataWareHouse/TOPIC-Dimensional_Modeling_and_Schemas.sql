-- A Question
-- Create the dimension tables
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  student_name VARCHAR(100),
  date_of_birth DATE,
  gender VARCHAR(10)
  );

CREATE TABLE courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(100),
  course_department VARCHAR(50)
);

CREATE TABLE time (
  time_id SERIAL PRIMARY KEY,
  year INT,
  month INT,
  day INT
);

-- Create the fact table
CREATE TABLE student_enrollments (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT,
  course_id INT,
  time_id INT,
  enrollment_status VARCHAR(20)
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (time_id) REFERENCES time (time_id)
);

-- B Question
-- Get the total number of enrollments
SELECT COUNT(*) AS total_enrollments
FROM student_enrollments;

-- Get the count of enrollments by course department
SELECT c.course_department, COUNT(*) AS enrollments_count
FROM student_enrollments se
INNER JOIN courses c ON se.course_id = c.course_id
GROUP BY c.course_department;

-- Get student enrollments with student names and course names
SELECT se.enrollment_date, s.student_name, c.course_name
FROM student_enrollments se
INNER JOIN students s ON se.student_id = s.student_id
INNER JOIN courses c ON se.course_id = c.course_id;

-- Get student enrollments by month with student names and enrollment statuses
SELECT t.month, s.student_name, se.enrollment_status
FROM student_enrollments se
INNER JOIN students s ON se.student_id = s.student_id
INNER JOIN time t ON se.time_id = t.time_id;
