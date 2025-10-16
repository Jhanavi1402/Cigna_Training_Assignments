DROP TABLE Dept;

DROP TABLE Emps;

CREATE TABLE Dept (
    Deptno NUMBER(2) PRIMARY KEY,
    Dname VARCHAR2(20),
    Loc VARCHAR2(50)
);

CREATE TABLE Emps (
    Empno INT PRIMARY KEY,
    Ename VARCHAR2(20),
    EJob VARCHAR2(50),
    Salary NUMBER (10, 2),
    Deptno NUMBER(2),
    CONSTRAINT fk_emps_dept FOREIGN KEY (Deptno) REFERENCES Dept(Deptno)
);

DELETE FROM Dept;

DELETE FROM Emps;

SELECT * FROM Emps;

SELECT * FROM Dept;


INSERT INTO Dept (Deptno, Dname, Loc)
VALUES (10, 'HR', 'BLR');

INSERT INTO Dept (Deptno, Dname, Loc)
VALUES (11, 'IT', 'HYD');

INSERT INTO Dept (Deptno, Dname, Loc)
VALUES (12, 'Sales', 'DEL');

-- ALTER TABLE Dept MODIFY Dname VARCHAR(20);

INSERT INTO Dept (Deptno, Dname, Loc)
VALUES (13, 'Consultancy', 'BLR');


INSERT INTO Emps (Empno, Ename, EJob, Salary, Deptno)
VALUES ('200', 'Abhi', 'Salesman', 30000, 10);

INSERT INTO Emps (Empno, Ename, EJob, Salary, Deptno)
VALUES ('201', 'Bhavya', 'Developer', 50000, 11);

INSERT INTO Emps (Empno, Ename, EJob, Salary, Deptno)
VALUES ('202', 'Kavya', 'Technician', 35000, 11);

INSERT INTO Emps (Empno, Ename, EJob, Salary, Deptno)
VALUES ('203', 'Roshini', 'Clerk', 25000, 13);

-- QUERIES
-- 1. Display employee names along with their department names.
SELECT Ename, Dname
FROM Emps, Dept
WHERE Dept.Deptno = Emps.Deptno;

-- 2. List all employees with their job titles and the location of their department.
SELECT Ename, EJob, Loc
FROM Emps
JOIN Dept
ON Dept.Deptno = Emps.Deptno;

-- 3. Display employees who work in the SALES department.
SELECT Ename, EJob, Salary, Dname
FROM Emps
JOIN Dept 
ON Dept.Deptno = Emps.Deptno
WHERE Dname = 'IT';

-- 4. List all employees along with their department name and location, including departments that have no employees.
SELECT d.Deptno, d.Dname, d.Loc, e.Empno, e.Ename, e.EJob, e.Salary
FROM Dept d
LEFT JOIN Emps e
ON d.Deptno = e.Deptno
ORDER BY d.Deptno;

-- 5. Display all departments and employees, even if some employees are not assigned to any department.
SELECT d.Deptno, d.Dname, d.Loc, e.Empno, e.Ename, e.EJob, e.Salary, e.Deptno
FROM Dept d
FULL OUTER JOIN Emps e 
ON d.Deptno = e.Deptno
ORDER BY d.Deptno NULLS LAST, e.Empno;

-- 6. Show each department name and  total salary paid to its employees.
SELECT d.Dname, SUM(e.Salary)
FROM dept d
LEFT JOIN Emps e ON d.Deptno = e.Deptno
GROUP BY d.Dname;

-- 7. Find departments that have more than 3 employees.  Display dname and no. of employees.
SELECT e.Ename, e.EJob, e.Salary, d.Loc
FROM Emps e
JOIN Dept d
ON d.Deptno = e.Deptno
WHERE d.Loc IN ( SELECT Loc FROM Dept WHERE Dname = 'HR' );

-- 8. Display employees who work in the same location as the ACCOUNTING department.
SELECT d.Deptno, d.Dname, e.Empno, e.Ename, e.Salary
FROM Emps e
JOIN Dept d
ON d.Deptno = e.Deptno
WHERE e.Salary = ( SELECT MAX(Salary) FROM Emps WHERE Deptno = e.Deptno );

-- 9. For each department, display the employee who has the highest salary.
SELECT d.Dname, e.Empno, e.Ename, e.Salary
FROM Dept d
JOIN Emps e ON d.Deptno = e.Deptno
JOIN (
      SELECT Deptno, MAX(Salary) AS MaxSal
      FROM Emps
      GROUP BY Deptno
     ) m ON e.Deptno = m.Deptno AND e.Salary = m.MaxSal;
     
-- 10. List employees whose salary is greater than the average salary of their department.
SELECT e.Empno, e.Ename, e.Salary, e.Deptno
FROM Emps e
JOIN (
      SELECT Deptno, AVG(Salary) AvgSal
      FROM Emps
      GROUP BY Deptno
     ) a ON e.Deptno = a.Deptno WHERE e.Salary > a.AvgSal;
