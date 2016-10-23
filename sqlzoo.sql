SQLZOO.NET:
    SELECT basics:
          Question 1:

          The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';
          Modify it to show the population of Germany

          SELECT population FROM world
          WHERE name = 'Germany'

          Question 2:

          Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Luxembourg', 'Mauritius' and 'Samoa'.
          Show the name and the population for 'Ireland', 'Iceland' and 'Denmark'.

          SELECT name, population FROM world
          WHERE name IN ('Ireland', 'Iceland', 'Denmark');

          Question 3:

          Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

          SELECT name, area FROM world
          WHERE area BETWEEN 200000 AND 250000


    SELECT from WORLD:

          Question 1:

          Observe the result of running a simple SQL command.

          SELECT name, continent, population FROM world

          Question 2:

          How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

          SELECT name FROM world
          WHERE population>200000000

          Question 3:

          Give the name and the per capita GDP for those countries with a population of at least 200 million.
          HELP:How to calculate per capita GDP

          SELECT name, gdp/population AS a
          FROM world
          WHERE population > 200000000

          Question 4:

          Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

          SELECT name, population/1000000
          FROM world
          WHERE continent = 'South America';

          Question 5:

          Show the name and population for France, Germany, Italy

          SELECT name, population
          FROM world
          WHERE name = 'France' OR name = 'Germany' OR name = 'Italy';

          Question 6:

          Show the countries which have a name that includes the word 'United'

          SELECT name
          FROM world
          WHERE  name LIKE '%United%';

          Question 7:

          Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
          Show the countries that are big by area or big by population. Show name, population and area.

          SELECT name, population, area
          FROM world
          WHERE area > 3000000 OR population > 250000000;

          Question 8:

          Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
          Australia has a big area but a small population, it should be included.
          Indonesia has a big population but a small area, it should be included.
          China has a big population and big area, it should be excluded.
          United Kingdom has a small population and a small area, it should be excluded.

          SELECT name, population, area
          FROM world
          WHERE area > 3000000 XOR population > 250000000;

          Question 9:

          Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
          For South America show population in millions and GDP in billions both to 2 decimal places.
          Millions and billions

          SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
          FROM world
          WHERE continent = 'South America';

          Question 10:

          Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
          Show per-capita GDP for the trillion dollar countries to the nearest $1000.

          SELECT name, ROUND(gdp/population,-3)
          FROM world
          WHERE gdp >= 1000000000000;

          Question 11:

          The CASE statement shown is used to substitute North America for Caribbean in the third column.
          Show the name - but substitute Australasia for Oceania - for countries beginning with N.

          SELECT name,
                 CASE WHEN continent='Oceania' THEN 'Australasia'
                      ELSE continent END
            FROM world
           WHERE name LIKE 'N%'

          Question 12:

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
          List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
          SELECT id, title, yr
            FROM movie
            WHERE title LIKE 'Star Trek%'
            ORDER BY yr

          Question 4:
          What are the titles of the films with id 11768, 11955, 21191
          SELECT title
            FROM movie
            WHERE id IN(11768, 11955, 21191);

          Question 5:
          What id number does the actress 'Glenn Close' have?
          SELECT id
            FROM actor
            WHERE name = 'Glenn Close';

          Question 6:
          What is the id of the film 'Casablanca'
          SELECT id
            FROM movie
            WHERE title = 'Casablanca';

          Question 7:
          Obtain the cast list for 'Casablanca'.
          what is a cast list?
          Use movieid=11768, this is the value that you obtained in the previous question.
          SELECT name
            FROM casting JOIN actor ON id = actorid
            WHERE movieid= 11768;

          Question 8:
          Obtain the cast list for the film 'Alien'
            SELECT name
            FROM casting JOIN actor ON id = actorid
            WHERE movieid= 10522;

  NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN:
          Question 1:
          List the teachers who have NULL for their department.
          Why we cannot use =
          SELECT name
          FROM teacher
          WHERE dept IS NULL;

          Question 2:
          Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
          SELECT teacher.name, dept.name
          FROM teacher INNER JOIN dept
                   ON (teacher.dept=dept.id)

          Question 3:
          Use a different JOIN so that all teachers are listed.
          SELECT teacher.name, dept.name
            FROM teacher LEFT JOIN dept
                   ON (teacher.dept=dept.id)

          Question 4:
          Use a different JOIN so that all departments are listed.
          SELECT teacher.name, dept.name
            FROM teacher RIGHT JOIN dept
                   ON (teacher.dept=dept.id)

          Question 5:
          Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
          SELECT name, COALESCE(mobile, '07986 444 2266') AS here
            FROM teacher

          Question 6:
          Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
          SELECT teacher.name, COALESCE(dept.name, 'None')
            FROM  teacher LEFT JOIN dept ON dept = dept.id

          Question 7:
          Use COUNT to show the number of teachers and the number of mobile phones.
          SELECT COUNT(teacher.name) AS name, COUNT(teacher.mobile) AS mobile
            FROM teacher

          Question 8:
          Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
          SELECT dept.name, COUNT(teacher.name)
            FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept
              GROUP BY dept.name;
