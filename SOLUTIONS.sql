Duplicate Emails(table called Person):
SELECT Person.Email
FROM Person
GROUP By Person.Email
Having Count(*) > 1;

Employees Earning More Than Their Managers:
SELECT Name AS Employee
From Employee emp
Where emp.ManagerId IS NOT NULL
AND emp.Salary > (SELECT Salary From Employee Where emp.ManagerId = Id);
