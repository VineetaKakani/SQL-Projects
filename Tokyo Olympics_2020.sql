USE TOKYO_OLYMPICS

/* Q1. Write a query to find the total no of teams particicpated in Tokyo 2020 Summmer Olympics */
SELECT DISTINCT COUNT(TEAM) AS NO_TEAMS FROM TEAMS
-- Total 743 teams participated in Tokyo Olympics 2020

/* Q2. Write a query to find the total no of athletes particicpated in Tokyo 2020 Summmer Olympics */
SELECT DISTINCT COUNT(NAME) AS NO_ATHLETES FROM ATHLETES
-- Total 11085 Athletes participated in Tokyo Olympics 2020

/* Q3. Write a query to find the total no of athletes particicpated from each country Tokyo 2020 Summmer Olympics */
SELECT DISTINCT COUNT(NAME) AS NO_ATHLETES, TEAM AS COUNTRY FROM ATHLETES
GROUP BY TEAM 
ORDER BY NO_ATHLETES DESC
-- Highest no of atheletes participated from United States of America were 615 followed by Japan 586

/* Q4. Write a query to find the total no of athletes particicpated from India Tokyo 2020 Summmer Olympics */
SELECT DISTINCT COUNT(NAME) AS NO_ATHLETES, TEAM AS COUNTRY FROM ATHLETES
WHERE TEAM = 'INDIA'
GROUP BY TEAM
-- 117 athletes participated from India

/* Q5. Write a query to find top 10 countries with total no of discipline particicpated in Tokyo 2020 Summmer Olympics */
SELECT * FROM TEAMDISCIPLINE
-- Japan participated in all 46 discipline

/* Q6. Write a query to find the total no of athletes for each discipline */
SELECT DISCIPLINE, TOTAL AS NO_PARTICIPANTS FROM ENTRIESGENDER
ORDER BY NO_PARTICIPANTS DESC
-- Highest participant were from athletics and lowest from cycling road

/* Q7. Write a query to find the total no of coaches */
SELECT DISTINCT COUNT(NAME) AS NO_COACHES FROM COACHES
-- Total 394 coaches

/* Q8. Write a query to find the total no of coaches for each discipline */
SELECT DISTINCT DISCIPLINE, COUNT(NAME) AS NO_COACHES FROM COACHES
GROUP BY DISCIPLINE
ORDER BY NO_COACHES DESC
-- Basket Ball had highest no of coaches 74

/* Q8. Write a query to find the total no of coaches from each country */
SELECT DISTINCT TEAM AS COUNTRY, COUNT(NAME) AS NO_COACHES FROM COACHES
GROUP BY TEAM 
ORDER BY NO_COACHES DESC
-- Japan has highest no of coaches 35

/* Q9. Write a query to find the total no of coaches from India */
SELECT DISTINCT TEAM AS COUNTRY, COUNT(NAME) AS NO_COACHES FROM COACHES
WHERE TEAM = 'INDIA'
GROUP BY TEAM 
-- Total no of coaches from India were 5

/* Q10. Write a query to find the total no of Male and Female participated in all discipline */
SELECT SUM(MALE) AS NO_MALES, SUM(FEMALE) AS NO_FEMALES  FROM ENTRIESGENDER
-- Total no of male participatants were 5884 and female participants were 5432

/* Q12. Write a query to find the total no of medals */
SELECT SUM(TOTAL) AS NO_MEDALS FROM MEDALS
-- Total 1080 medals

/* Q12. Write a query to find the total no of gold, silver and bronze medals */
SELECT SUM(GOLD) AS N0_GOLDMEDALS, SUM(SILVER) AS N0_SILVERMEDALS, SUM(BRONZE) AS N0_BRONZEMEDALS FROM MEDALS
-- Total gold medals-340, silver-338, bronze-402

/* Q13. Write a query to find top 5 teams with most medals */
SELECT TEAM, TOTAL AS NO_MEDALS FROM MEDALS
GROUP BY NO_MEDALS
ORDER BY NO_MEDALS DESC
LIMIT 5
-- United States of America won 113 medals followed by China 88  

/* Q13. Write a query to find top 5 teams with highest gold medals */
SELECT TEAM, GOLD AS NO_GOLDMEDALS FROM MEDALS
GROUP BY TEAM
ORDER BY NO_GOLDMEDALS DESC
LIMIT 5

/* Q14. Write a query to find total medals won by India */
SELECT TEAM, TOTAL AS NO_MEDALS FROM MEDALS
WHERE TEAM = 'INDIA'
-- 7 Medals were won by India

/* Q15. Write a query to find gold, silver and bronze medals won by India */
SELECT TEAM, GOLD, SILVER, BRONZE FROM MEDALS
WHERE TEAM = 'INDIA'
-- India won 1-Gold, 2-Silver, 3-Bronze

/* Q16. Write a query to find ratio of male and female athletes participated */
SELECT distinct
(SELECT SUM(MALE) FROM ENTRIESGENDER)/(SELECT SUM(FEMALE) FROM ENTRIESGENDER) AS RATIO
FROM ENTRIESGENDER

/* Q17. Write a query to find male and female athletes participated from Hockey*/
SELECT DISCIPLINE, FEMALE, MALE FROM ENTRIESGENDER
WHERE DISCIPLINE = 'HOCKEY'
-- 192 Female and 192 male athletes participated in hockey

/* Q18. Write a query to find which countries have not won gold but silver and bronze medal */
SELECT TEAM FROM MEDALS
WHERE GOLD=0 
-- 20 Coutries have not won gold medals in tokyo 2020 olympics

/* Q19. Write a query to find which countries have not won gold and silver but bronze medal */
SELECT TEAM FROM MEDALS
WHERE GOLD=0 AND SILVER=0
-- 11 countries have not won gold and silver medals
