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
SELECT from WORLD:
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

SELECT from nobel:
  Question 1:
  Change the query shown so that it displays Nobel prizes for 1950.
  SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 Question 2:
 Show who won the 1962 prize for Literature.
 SELECT winner
  FROM nobel
  WHERE yr = 1962
   AND subject = 'Literature'

  Question 3:
  Show the year and subject that won 'Albert Einstein' his prize.
  SELECT yr, subject
    FROM nobel
    WHERE winner = 'Albert Einstein';

  Question 4:
  Give the name of the 'Peace' winners since the year 2000, including 2000.
  SELECT winner
    FROM nobel
    WHERE subject = 'Peace' AND yr >= 2000;
  Question 5:
  Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
  SELECT yr, subject, winner
    FROM nobel
    WHERE subject = 'Literature' AND yr>=1980 AND yr<=1989;

  Question 6:
  Show all details of the presidential winners:

    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    SELECT *
      FROM nobel
      WHERE winner = 'Theodore Roosevelt' OR winner = 'Woodrow Wilson' OR winner ='Jimmy Carter'
      AND subject = 'peace'
  Question 7:
  Show the winners with first name John
  SELECT winner
    FROM nobel
    WHERE winner LIKE 'John%'
  Question 8:
  Show the Physics winners for 1980 together with the Chemistry winners for 1984.
  SELECT *
    FROM nobel
    WHERE yr =1980 AND subject = 'Physics 'OR yr = 1984 AND subject = 'Chemistry'
  Question 9:
  Show the winners for 1980 excluding the Chemistry and Medicine
  SELECT *
    FROM nobel
    WHERE yr = 1980 AND NOT subject = 'Chemistry' AND NOT subject = 'Medicine'
  Question 10:
  Show who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
  SELECT *
    FROM nobel
    WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;
  Question 11:
  Find all details of the prize won by PETER GRÜNBERG
  SELECT *
    FROM nobel
    WHERE winner = 'Peter'

  Question 12:
  Find all details of the prize won by EUGENE O'NEILL'
  SELECT *
    FROM nobel
    WHERE winner = 'Eugene O''neill'

  Question 13:
  Knights in order
  List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
  SELECT winner, yr, subject
    FROM nobel
    WHERE winner LIKE 'Sir%'

    ORDER BY yr DESC
    ;

  Question 14 on Select from nobel:
  SELECT winner, subject
  FROM nobel
  WHERE yr=1984
  ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;

JOIN:
  Question 1:
  The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

  Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
  SELECT matchid, player FROM goal
  WHERE teamid = 'GER'

  Question 2:
  From the previous query you can see that Lars Benders scored a goal in game 1012. Now we want to know what teams were playing in that match.
  Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
  Show id, stadium, team1, team2 for just game 1012
  SELECT id,stadium,team1,team2
    FROM game
   WHERE id = 1012

  Question 3:
