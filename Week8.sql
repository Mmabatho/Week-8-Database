-- Create the database
CREATE DATABASE IF NOT EXISTS student_portal;
USE student_portal;

-- Create students table
CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  date_of_birth DATE,
  address VARCHAR(255),
  phone VARCHAR(20),
  enrollment_date DATE NOT NULL,
  status ENUM('active', 'inactive', 'graduated', 'on_leave') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create courses table
CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_code VARCHAR(20) NOT NULL UNIQUE,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  credits INT NOT NULL,
  instructor VARCHAR(100),
  max_students INT,
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create enrollments table (junction table for many-to-many relationship)
CREATE TABLE enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  grade VARCHAR(2),
  status ENUM('enrolled', 'completed', 'dropped', 'failed') DEFAULT 'enrolled',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
  UNIQUE KEY unique_enrollment (student_id, course_id)
);

-- Insert sample data for students
INSERT INTO students (first_name, last_name, email, date_of_birth, address, phone, enrollment_date, status)
VALUES 
('John', 'Doe', 'john.doe@example.com', '2000-05-15', '123 Main St, Anytown', '555-123-4567', '2022-09-01', 'active'),
('Jane', 'Smith', 'jane.smith@example.com', '2001-02-20', '456 Oak Ave, Somewhere', '555-987-6543', '2022-09-01', 'active'),
('Michael', 'Johnson', 'michael.j@example.com', '1999-11-10', '789 Pine Rd, Nowhere', '555-456-7890', '2021-09-01', 'active'),
('Emily', 'Williams', 'emily.w@example.com', '2002-07-25', '321 Cedar Ln, Anywhere', '555-789-0123', '2023-01-15', 'active'),
('David', 'Brown', 'david.b@example.com', '2000-09-30', '654 Birch Blvd, Someplace', '555-234-5678', '2022-01-10', 'on_leave');

-- Insert sample data for courses
INSERT INTO courses (course_code, title, description, credits, instructor, max_students, start_date, end_date)
VALUES 
('CS101', 'Introduction to Computer Science', 'Fundamental concepts of programming and computer science', 3, 'Dr. Alan Turing', 30, '2023-09-01', '2023-12-15'),
('MATH201', 'Calculus I', 'Limits, derivatives, and integrals of algebraic and transcendental functions', 4, 'Dr. Katherine Johnson', 25, '2023-09-01', '2023-12-15'),
('ENG102', 'English Composition', 'Principles of effective writing and argumentation', 3, 'Prof. Jane Austen', 20, '2023-09-01', '2023-12-15'),
('PHYS101', 'Physics I', 'Mechanics, thermodynamics, and waves', 4, 'Dr. Richard Feynman', 25, '2023-09-01', '2023-12-15'),
('BIO110', 'Introduction to Biology', 'Basic principles of cellular and molecular biology', 3, 'Dr. Rosalind Franklin', 30, '2023-09-01', '2023-12-15');

-- Insert sample data for enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade, status)
VALUES 
(1, 1, '2023-08-15', NULL, 'enrolled'),
(1, 2, '2023-08-15', NULL, 'enrolled'),
(2, 1, '2023-08-20', NULL, 'enrolled'),
(2, 3, '2023-08-20', NULL, 'enrolled'),
(3, 2, '2023-08-10', NULL, 'enrolled'),
(3, 4, '2023-08-10', NULL, 'enrolled'),
(4, 3, '2023-08-25', NULL, 'enrolled'),
(4, 5, '2023-08-25', NULL, 'enrolled'),
(5, 4, '2023-08-05', NULL, 'enrolled'),
(5, 5, '2023-08-05', NULL, 'enrolled');
