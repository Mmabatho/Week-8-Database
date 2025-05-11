
# Student Portal Database

## Description

This project provides a simple database schema for managing student information, courses, and enrollments in a student portal system. It includes tables for students, courses, and a junction table to handle the many-to-many relationship between students and courses. Sample data is also included for initial testing and demonstration.

## Database Schema

The database consists of three main tables:

* **students:** Stores information about individual students, including their personal details, contact information, enrollment date, and status.
* **courses:** Stores information about the courses offered, including course codes, titles, descriptions, credits, instructor details, maximum student capacity, and start/end dates.
* **enrollments:** A junction table that establishes the many-to-many relationship between students and courses. It tracks student enrollments in specific courses, enrollment dates, grades, and enrollment status.

## Table Details

### `students` Table

| Column           | Data Type      | Description                                                    |
| ---------------- | -------------- | -------------------------------------------------------------- |
| `student_id`     | INT            | Primary key, auto-incrementing unique identifier for each student |
| `first_name`     | VARCHAR(50)    | Student's first name                                           |
| `last_name`      | VARCHAR(50)    | Student's last name                                            |
| `email`          | VARCHAR(100)   | Student's email address (must be unique)                       |
| `date_of_birth`  | DATE           | Student's date of birth                                        |
| `address`        | VARCHAR(255)   | Student's address                                              |
| `phone`          | VARCHAR(20)    | Student's phone number                                         |
| `enrollment_date`| DATE           | Date when the student enrolled                                 |
| `status`         | ENUM           | Current status of the student (active, inactive, graduated, on_leave) |
| `created_at`     | TIMESTAMP      | Timestamp when the student record was created                  |
| `updated_at`     | TIMESTAMP      | Timestamp when the student record was last updated              |

### `courses` Table

| Column         | Data Type      | Description                                                      |
| -------------- | -------------- | ---------------------------------------------------------------- |
| `course_id`    | INT            | Primary key, auto-incrementing unique identifier for each course  |
| `course_code`  | VARCHAR(20)    | Unique code for the course                                       |
| `title`        | VARCHAR(100)   | Title of the course                                              |
| `description`  | TEXT           | Description of the course                                        |
| `credits`      | INT            | Number of credits for the course                                 |
| `instructor`   | VARCHAR(100)   | Name of the instructor                                           |
| `max_students` | INT            | Maximum number of students allowed in the course                  |
| `start_date`   | DATE           | Start date of the course                                         |
| `end_date`     | DATE           | End date of the course                                           |
| `created_at`   | TIMESTAMP      | Timestamp when the course record was created                     |
| `updated_at`   | TIMESTAMP      | Timestamp when the course record was last updated                 |

### `enrollments` Table

| Column          | Data Type      | Description                                                                 |
| --------------- | -------------- | --------------------------------------------------------------------------- |
| `enrollment_id` | INT            | Primary key, auto-incrementing unique identifier for each enrollment        |
| `student_id`    | INT            | Foreign key referencing `students(student_id)`, identifies the enrolled student |
| `course_id`     | INT            | Foreign key referencing `courses(course_id)`, identifies the enrolled course   |
| `enrollment_date`| DATE           | Date when the student enrolled in the course                                |
| `grade`         | VARCHAR(2)     | Grade received by the student in the course                                 |
| `status`        | ENUM           | Current status of the enrollment (enrolled, completed, dropped, failed)      |
| `created_at`    | TIMESTAMP      | Timestamp when the enrollment record was created                            |
| `updated_at`    | TIMESTAMP      | Timestamp when the enrollment record was last updated                        |

## Relationships

* One-to-many relationship between `students` and `enrollments` (one student can have multiple enrollments).
* One-to-many relationship between `courses` and `enrollments` (one course can have multiple enrollments).
* Many-to-many relationship between `students` and `courses` is resolved by the `enrollments` junction table.

## How to Setup/Run the Project

1.  **Create the database:**

    ```sql
    CREATE DATABASE IF NOT EXISTS student_portal;
    USE student_portal;
    ```
2.  **Import the SQL schema and data:**

    You can execute the `student_portal_schema.sql` file against your MySQL server. This will create the tables and insert the sample data. For example, using the MySQL command-line client:

    ```bash
    mysql -u your_username -p < student_portal_schema.sql
    ```

    *(Replace `your_username` with your MySQL username)*

## ERD (Entity-Relationship Diagram)

![ERD Diagram](https://i.ibb.co/6y0C4sL/Draw-Mmabatho-drawio-2.png)

## student\_portal\_schema.sql Content



