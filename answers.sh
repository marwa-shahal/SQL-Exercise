# Basic Queries #
# Get all the names of students in the database
SELECT name 
FROM students;

# Get all the data of students above 30 years old
SELECT age 
FROM students
WHERE age > 30;

# Get the names of the females who are 30 years old
SELECT Name
FROM students
WHERE Gender = "F" AND Age = 30;

# Get the number of Points of **Alex** 
SELECT Points
FROM students
WHERE Name = "Alex";

# Add yourself as a new student \(your name, your age...\)
INSERT INTO students
VALUES (7, "Marwa", "28", "F", "400");

# Increase the points of **Basma** because she solved a new exercise
UPDATE students
SET Points = 400
WHERE Name="Basma";

# Decrease the points of **Alex** because he's late today
UPDATE students
SET Points = 150
WHERE Name="Alex";

# Creating Table #
CREATE TABLE graduates(
    ID INTEGER  PRIMARY KEY AUTOINCREMENT,
    Name  TEXT NOT NULL UNIQUE,
    Age INTEGER,
	Gender TEXT,
	Points INTEGER,
	Graduation TEXT
);

# 1. Copy Layal's data from **students** to **graduates**
INSERT INTO graduates (Name, Age, Gender, Points)
SELECT Name, Age, Gender, Points
FROM students
WHERE name = "Layal";

# 2. Add the graduation date previously mentioned to Layal's record in **graduates**
UPDATE graduates 
SET Graduation='08-09-2018' 
WHERE Name='Layal';

# 3. Remove Layal's record from **students**
DELETE 
FROM students
WHERE Name='Layal';

# Joins #
# 1. Produce a table that contains, for each employee, his/her name, company name, and company date.
SELECT employees.name, employees.Company, companies.date 
FROM employees 
Inner join companies 
ON employees.Company=companies.name;

# 2. Find the name of **employees** that work in companies made before 2000.
SELECT employees.name 
FROM employees 
Inner join companies 
ON employees.Company=companies.name and companies.Date < 2000;

# 3. Find the name of company that has a graphic designer.
SELECT companies.name 
FROM companies 
Inner join employees 
ON employees.Company=companies.name and employees.Role='Graphic Designer';

# Count & Filter #
# 1. Find the person with the highest number of points in **students**
SELECT Name
FROM students
WHERE Points=(SELECT max(Points)FROM students);

# 2. Find the average of points in **students**
SELECT AVG(Points)
FROM students;

# 3. Find the number of students that have 500 points
SELECT COUNT(Name) 
FROM students 
WHERE points=500;

# 4. Find the names of students that contains 's'
SELECT Name
FROM students 
WHERE Name like '%s%';

# 5. Find all students based on the decreasing order of their points
SELECT Name
FROM students 
ORDER BY Points DESC;
