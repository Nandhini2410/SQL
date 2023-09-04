

CREATE DATABASE Work

 USE work

 ---- Employee Table

 CREATE TABLE Employee
	 (
	   EmployeeID                  INT,
	   EmployeeName  Varchar(50)   NOT NULL,
	   DepartmentID                INT,
	   ManagerID                   INT
	 )

 INSERT INTO Employee Values (1,'Puneet',1,4)
                             ,(2,'Srinivas',2,3)
							 ,(3,'Dheeraj',1,4)
							 ,(4,'Jay',2,Null)
							 ,(4,'Raghu',Null,4)

			Select * from Employee
 
 --------------------------------------------------------------------------------------------------

 ----- Department Table

  CREATE TABLE Department
   (
	   DepartmentID                  INT,
	   DepartmentName  Varchar(50)   NOT NULL
	)

	INSERT INTO Department Values (1,'Data Management')
	                             ,(2,'Business')

		Select * from Department

-----------------------------------------------------------------------------------------------------

------Salary Table

  CREATE TABLE Salary
  (
     EmployeeID  INT,
	 Salary      INT
  )

  INSERT INTO Salary Values (1,50000)
                           ,(2,60000)
						   ,(3,55000)
						   ,(4,55000)
						   ,(5,75000)

	  Select * from Salary

---------------------------------------------------------------------------------------------------

--Retrieve the employee details along with their department names and salaries

 Select E.*,D.DepartmentName,S.Salary

  from Employee As E
  Join
  Salary As S
  On E.EmployeeID=S.EmployeeID
  Join
  Department As D
  On D.DepartmentID=E.DepartmentID

--------------------------------------------------------------------------------------------------------------------

--Find the average salary for each department

 Select E.EmployeeID,E.DepartmentID,
   Avg(Salary) As Avg_Salary
   from Employee As E
   Join
   Salary As S
  On E.EmployeeID=S.EmployeeID
  Join
  Department As D
  On D.DepartmentID=E.DepartmentID
  Group By E.EmployeeID,E.DepartmentID


-------------------------------------------------------------------------------------------------------------------------

--Retrieve the department names along with the maximum salary in each department

 Select D.DepartmentName,E.EmployeeID, 
  Max(Salary) As Max_Salary
 from Employee As E
   Join
   Salary As S
  On E.EmployeeID=S.EmployeeID
  Join
  Department As D
  On D.DepartmentID=E.DepartmentID
  Group By E.EmployeeID,D.DepartmentName


  

  SELECT D.DepartmentName, MAX(Salary) AS MaxSalary
  FROM Department As D
  Inner Join Salary As S
  On D.DepartmentID=S.EmployeeID
 GROUP BY D.DepartmentName

 -----------------------------------------------------------------------------------------------------------------------------

 --Retrieve all employee deatils along with their manager Names

   SELECT e.EmployeeID, e.EmployeeName, m.EmployeeName AS ManagerName
  FROM Employee E
  INNER JOIN Employee m ON e.ManagerID = m.EmployeeID;

  -------------------------------------------------------------------------------------------------------------------------------------
  
  -- Find Out an employee who not allocated to any valid Department
  
  SELECT E.EmployeeID, E.EmployeeName
   FROM Employee AS E
   LEFT JOIN Department D
   ON E.DepartmentID = D.DepartmentID
   WHERE d.DepartmentID IS NULL



















