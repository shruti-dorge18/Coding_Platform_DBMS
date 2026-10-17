-- ==========================================
-- Coding Practice and Contest Platform
-- SQL Lab Mini Project
-- Database: MySQL
-- ==========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS CodingPlatform;
USE CodingPlatform;

-- ==========================================
-- 1. USERS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

INSERT IGNORE INTO Users VALUES
(1, 'Shruti', 'shruti@example.com'),
(2, 'Vaishnavi', 'vaishnavi@example.com'),
(3, 'Janhavi', 'janhavi@example.com'),
(4, 'Sakshi', 'sakshi@example.com');

-- ==========================================
-- 2. PROBLEMS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS Problems (
    problem_id INT PRIMARY KEY,
    problem_name VARCHAR(100) NOT NULL,
    difficulty VARCHAR(20),
    points INT
);

INSERT IGNORE INTO Problems VALUES
(101, 'Two Sum', 'Easy', 10),
(102, 'Binary Search', 'Medium', 20),
(103, 'Graph Traversal', 'Hard', 30);

-- ==========================================
-- 3. CONTESTS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS Contests (
    contest_id INT PRIMARY KEY,
    contest_name VARCHAR(100) NOT NULL,
    contest_date DATE,
    total_problems INT
);

INSERT IGNORE INTO Contests VALUES
(201, 'Weekly Coding Challenge', '2026-10-10', 5),
(202, 'Beginner Coding Contest', '2026-10-12', 3),
(203, 'Algorithm Challenge', '2026-10-15', 7);

-- ==========================================
-- 4. SUBMISSIONS TABLE
-- ==========================================

CREATE TABLE IF NOT EXISTS Submissions (
    submission_id INT PRIMARY KEY,
    user_id INT,
    problem_id INT,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (problem_id) REFERENCES Problems(problem_id)
);

INSERT IGNORE INTO Submissions VALUES
(1, 1, 101, 'Accepted'),
(2, 2, 102, 'Accepted'),
(3, 3, 103, 'Wrong Answer'),
(4, 4, 101, 'Accepted');

-- ==========================================
-- SQL QUERIES AND OUTPUTS
-- ==========================================

-- Display all tables
SHOW TABLES;

-- Display all users
SELECT * FROM Users;

-- Display all problems
SELECT * FROM Problems;

-- Display all contests
SELECT * FROM Contests;

-- Display all submissions
SELECT * FROM Submissions;

-- Display Easy problems
SELECT * FROM Problems
WHERE difficulty = 'Easy';

-- Count total problems
SELECT COUNT(*) AS Total_Problems
FROM Problems;

-- Count problems by difficulty
SELECT difficulty, COUNT(*) AS Number_of_Problems
FROM Problems
GROUP BY difficulty;

-- Calculate total points
SELECT SUM(points) AS Total_Points
FROM Problems;

-- Display contests with more than 3 problems
SELECT * FROM Contests
WHERE total_problems > 3;

-- Join users, problems, and submissions
SELECT Users.username,
       Problems.problem_name,
       Submissions.status
FROM Submissions
JOIN Users
    ON Submissions.user_id = Users.user_id
JOIN Problems
    ON Submissions.problem_id = Problems.problem_id;

-- Count accepted submissions
SELECT COUNT(*) AS Accepted_Submissions
FROM Submissions
WHERE status = 'Accepted';

-- Count submissions by status
SELECT status, COUNT(*) AS Total
FROM Submissions
GROUP BY status;

-- Display table structure
DESCRIBE Users;
DESCRIBE Problems;
DESCRIBE Contests;
DESCRIBE Submissions;

-- Display foreign key constraints
SHOW CREATE TABLE Submissions;
