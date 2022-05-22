/*

For this challenge you need to create a simple query to display each unique clan with their total points and ranked by their total points.

### people table schema
- name
- points
- clan  

You should then return a table that resembles below
### select on
- rank
- clan
- total_points
- total_people

The query must rank each clan by their total_points, you must return each unqiue clan and if there is no clan name (i.e. it's an empty string) you must replace it with `[no clan specified]`, you must sum the total_points for each clan and the total_people within that clan.

##Note
The data is loaded from the live leaderboard, this means values will change but also could cause the kata to time out retreiving the information.

> NOTE: You're solution should use pure SQL. Ruby is used within the test cases to do the actual testing.

*/

SELECT row_number() over() rank, tmp.*
FROM
  ( SELECT 
       COALESCE(NULLIF(TRIM(p.clan),''),  -- <- CHECK IF 'CLAN' IS EMPTY
                '[no clan specified]')
       clan
       , sum(p.points) total_points
       , count(*) total_people 
    FROM people p
    GROUP BY p.clan
    ORDER BY total_points desc
  ) tmp
