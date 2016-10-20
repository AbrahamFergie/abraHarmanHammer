LEETCODE.COM:
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

SQLTEACHING.COM:
  Multiple joins sql teacher
    SELECT character.name, tv_show.name
    FROM character
    INNER JOIN character_tv_show
    ON character.id = character_tv_show.character_id
    INNER JOIN tv_show
    ON character_tv_show.tv_show_id = tv_show.id WHERE character.name != 'Willow Rosenberg' AND tv_show.name != 'How I Met Your Mother';

  Table Aliases
    SELECT c.name, a.name
    FROM character AS c
    LEFT JOIN character_actor AS ca
    ON c.id = ca.character_id
    LEFT JOIN actor AS a
    ON ca.actor_id = a.id;

  Column Aliases
    SELECT character.name AS character, actor.name AS actor
    FROM character
    LEFT JOIN character_actor
    ON character.id = character_actor.character_id
    LEFT JOIN actor
    ON character_actor.actor_id = actor.id;

  SELF JOINS
    SELECT r1.name AS employee_name, r2.name AS boss_name
    FROM employees as r1
    INNER JOIN employees AS r2
    ON r1.boss_id = r2.id;

  SUBSTR
    SELECT *
    FROM robots
    WHERE SUBSTR(location, -2)
    LIKE 'NY';

  COALESCE
    SELECT name,
    COALESCE(tank, gun, sword)
    as weapon FROM fighters;

SQLZOO.NET:
  Number 12:
  Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B

  SELECT name,
    CASE
      WHEN continent='Europe' OR continent='Asia' THEN 'Eurasia'
      WHEN continent = 'North America' OR continent = 'South America' OR continent = 'Caribbean' THEN 'America'
      ELSE continent END
  FROM world
  WHERE name LIKE 'A%' OR name LIKE 'B%';

  Question 13:
  SELECT name, continent,
   CASE
     WHEN continent = 'Oceania' THEN 'Australasia'
     WHEN continent = 'Eurasia' OR name = 'Turkey' THEN 'Europe/Asia'
     WHEN continent = 'America' THEN continent = 'North America'
     WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
     WHEN continent = 'Caribbean' THEN 'South America'
     ELSE continent END
  FROM world
  WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk') ORDER BY name;

  Question 14 on Select from nobel:
  SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;
