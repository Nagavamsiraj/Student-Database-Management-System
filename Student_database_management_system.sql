-- ===============================================================================
-- STUDENT MANAGEMENT SYSTEM
-- Created By : Naga Vamsi Raj
-- Tool Used : MySQL Workbench
-- SQL Project
-- ===============================================================================

-- ===============================================================================
-- DATABASE CREATION
-- ===============================================================================

CREATE DATABASE Student_database;

USE Student_database;

-- ===============================================================================
-- TABLE CREATION
-- ===============================================================================
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration VARCHAR(20),
    Course_Fee INT,
    Application_Fee INT,
    Available_Seats INT,
    Course_Status VARCHAR(20)
);

CREATE TABLE Departments (
  Dept_ID INT PRIMARY KEY,
  Dept_Name VARCHAR(50),
  HOD_Name VARCHAR(50)
  );
  
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(15),
    Course_ID INT,
    Dept_ID INT,
    FOREIGN KEY (Course_ID)
    REFERENCES Courses(Course_ID),
    FOREIGN KEY (Dept_ID)
    REFERENCES Departments(Dept_ID)
); 
 
CREATE TABLE Subjects (
    Subject_ID INT PRIMARY KEY,
    Subject_Name VARCHAR(50)
);
  
CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Student_ID INT,
    Total_Classes INT,
    Attended_Classes INT,
    Percentage DECIMAL(5,2),
    FOREIGN KEY (Student_ID)
    REFERENCES Students(Student_ID)
);

CREATE TABLE Performance (
    Performance_ID INT PRIMARY KEY,
    Student_ID INT,
    Subject_ID INT,
    Marks INT,
    Grade VARCHAR(5),
    FOREIGN KEY (Student_ID)
    REFERENCES Students(Student_ID),
    FOREIGN KEY (Subject_ID)
    REFERENCES Subjects(Subject_ID)
);

CREATE TABLE Fees (
    Fee_ID INT PRIMARY KEY,
    Student_ID INT,
    Total_Fee INT,
    Paid_Amount INT,
    Balance INT,
    FOREIGN KEY (Student_ID)
    REFERENCES Students(Student_ID)
);

-- ===============================================================================
-- INSERTING DATA INTO COURSES TABLE
-- ===============================================================================

INSERT INTO Courses VALUES
(1,'B.Tech AI & DS','4 Years',140000,1500,60,'Open'),
(2,'B.Tech AI & ML','4 Years',145000,1500,50,'Open'),
(3,'B.Tech Cybersecurity','4 Years',135000,1200,40,'Open'),
(4,'B.Tech Robotics','4 Years',150000,1500,25,'Open'),
(5,'B.Tech Mechanical','4 Years',100000,1000,35,'Open'),
(6,'B.Tech ECE','4 Years',110000,1000,45,'Open'),
(7,'B.Tech EEE','4 Years',105000,1000,30,'Open'),
(8,'B.Tech Aeronautics','4 Years',160000,2000,0,'Closed'),
(9,'MBA','2 Years',90000,1500,0,'Closed'),
(10,'B.Tech CSE','4 Years',120000,1000,55,'Open');

-- ===============================================================================
-- INSERTING DATA INTO DEPARTMENTS TABLE
-- ===============================================================================

INSERT INTO Departments VALUES
(1,'AI & DS','Dr. Srinivas'),
(2,'AI & ML','Dr. Nagraj'),
(3,'Cybersecurity','Dr. Reeyanshi'),
(4,'Robotics','Dr. Naveen Kumar'),
(5,'Mechanical','Dr. Teja'),
(6,'ECE','Dr. Pallavi'),
(7,'EEE','Dr. Vignesh Kumar'),
(8,'Aeronautics','Dr. Pavan'),
(9,'MBA','Dr. Varun'),
(10,'CSE','Dr. Harish');

-- ===============================================================================
-- INSERTING DATA INTO SUBJECTS TABLE
-- ===============================================================================

INSERT INTO Subjects VALUES
(1,'Python Programming'),
(2,'Database Management Systems'),
(3,'Artificial Intelligence'),
(4,'Machine Learning'),
(5,'Cyber Security'),
(6,'Thermal Engineering'),
(7,'Electrical Circuits'),
(8,'Digital Electronics'),
(9,'Robotics Engineering'),
(10,'Software Engineering');

-- ===============================================================================
-- INSERTING DATA INTO STUDENTS TABLE
-- ===============================================================================

INSERT INTO Students VALUES
(101,'Naga Raju','Kandukur','9876543210',1,1),
(102,'Sowmya','Chennai','7993173216',2,2),
(103,'Varun Raj','Bangalore','9542869682',3,3),
(104,'Reeya','Mukthinutalapadu','7013327390',4,4),
(105,'Arjun','Vijayawada','9876543214',5,5),
(106,'Priya','Guntur','9876543215',6,6),
(107,'Vamsi','Chittoor','9652152992',7,7),
(108,'Tejaswini','Hyderabad','9876543217',8,8),
(109,'Harsha','Tirupati','9876543218',9,9),
(110,'Chaitanya','Ongole','9052049249',10,10);

-- Display Students Table

  SELECT * FROM Students;

-- ===============================================================================
-- INSERTING DATA INTO ATTENDANCE TABLE
-- ===============================================================================

INSERT INTO Attendance VALUES
(1,101,100,92,92.00),
(2,102,100,85,85.00),
(3,103,100,78,78.00),
(4,104,100,95,95.00),
(5,105,100,88,88.00),
(6,106,100,72,72.00),
(7,107,100,90,90.00),
(8,108,100,81,81.00),
(9,109,100,69,69.00),
(10,110,100,87,87.00);

-- ===============================================================================
-- INSERTING DATA INTO PERFORMANCE TABLE
-- ===============================================================================

INSERT INTO Performance VALUES
(1,101,1,95,'A+'),
(2,102,2,88,'A'),
(3,103,3,76,'B'),
(4,104,4,92,'A+'),
(5,105,6,81,'A'),
(6,106,7,69,'C'),
(7,107,8,90,'A+'),
(8,108,9,85,'A'),
(9,109,5,72,'B'),
(10,110,10,94,'A+');

-- Display Performance Table

   SELECT * FROM Performance;

-- ===============================================================================
-- INSERTING DATA INTO FEES TABLE
-- ===============================================================================

INSERT INTO Fees VALUES
(1,101,140000,100000,40000),
(2,102,145000,145000,0),
(3,103,135000,90000,45000),
(4,104,150000,120000,30000),
(5,105,100000,100000,0),
(6,106,110000,80000,30000),
(7,107,105000,95000,10000),
(8,108,160000,100000,60000),
(9,109,90000,90000,0),
(10,110,120000,110000,10000);

-- Display Fees Table

  SELECT * FROM Fees;

-- ===============================================================================
-- REPORT QUERIES
-- ===============================================================================

-- View available courses
SELECT Course_Name,
       Course_Fee,
       Application_Fee,
       Course_Status
FROM Courses
WHERE Course_Status = 'Open';

-- Display student details with selected courses

SELECT s.Student_ID,
       s.Student_Name,
       c.Course_Name,
       c.Course_Fee,
       c.Course_Status
FROM Students s
JOIN Courses c
ON s.Course_ID = c.Course_ID;

-- Display attendance and performance details of students

SELECT s.Student_Name,
       a.Percentage AS Attendance_Percentage,
       p.Marks,
       p.Grade
FROM Students s
JOIN Attendance a
ON s.Student_ID = a.Student_ID
JOIN Performance p
ON s.Student_ID = p.Student_ID;

-- ===============================================================================
-- STORED PROCEDURE
-- ===============================================================================

-- Stored Procedure to display student report

DELIMITER //

CREATE PROCEDURE Student_Report()
BEGIN
    SELECT s.Student_Name,
           c.Course_Name,
           a.Percentage,
           p.Marks,
           p.Grade
    FROM Students s
    JOIN Courses c 
    ON s.Course_ID = c.Course_ID
    JOIN Attendance a 
    ON s.Student_ID = a.Student_ID
    JOIN Performance p 
    ON s.Student_ID = p.Student_ID;
END //

DELIMITER ;

-- Execute stored procedure

CALL Student_Report();

-- Trigger to reduce available seats after student admission

DELIMITER //

CREATE TRIGGER Reduce_Seats
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    UPDATE Courses
    SET Available_Seats = Available_Seats - 1
    WHERE Course_ID = NEW.Course_ID;
END //

DELIMITER ;

-- Total number of students

SELECT COUNT(*) AS Total_Students
FROM Students;


-- Number of available/open courses

SELECT COUNT(*) AS Open_Courses
FROM Courses
WHERE Course_Status = 'Open';

-- Average marks of students

SELECT AVG(Marks) AS Average_Marks
FROM Performance;

-- Students having attendance below 75%

SELECT s.Student_Name,
       a.Percentage
FROM Students s
JOIN Attendance a
 ON s.Student_ID = a.Student_ID
WHERE a.Percentage < 75;

-- ================================================================================
-- End Of Project
-- ================================================================================







