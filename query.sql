select * from dbo.game_reviews
select * from dbo.game_sales

select round(avg(Critic_Score),2) as average_critic_score,  round(avg(User_Score),2) as average_critic_score from dbo.game_reviews

--Create table year_critic (year date, avg_critic_score numeric(4,2))
--alter table year_critic
--alter column year varchar(10)
--TRUNCATE TABLE year_critic 
--Go

--the year that critic scores the game
insert into year_critic (year, avg_critic_score) Select year, round(avg(Critic_Score),2) as average_critic_score from dbo.game_sales as s
inner join dbo.game_reviews as r
on s.name=r.name
group by year
having count(s.name) >4
ORDER BY average_critic_score DESC
offset 0 rows
fetch next 10 rows only;

select * from year_critic

Create table user_critic (year varchar, avg_critic_score numeric(4,2))
alter table user_critic
alter column year varchar(10)
TRUNCATE TABLE user_critic 
Go

-- the year that the users loved
insert into user_critic (year, avg_critic_score) Select year, round(avg(User_Score),2) as average_user_score  
from dbo.game_sales as s
inner join dbo.game_reviews as r
on s.name=r.name
group by year
having count(s.name) >4
ORDER BY average_user_score DESC
offset 0 rows
fetch next 10 rows only;

select * from user_critic

-- The year that both user and critics loved
select year from year_critic 
intersect
select year from user_critic

-- The year has the best video games
select year, sum(Total_Shipped) from dbo.game_sales as c
where year in ( select year from year_critic 
intersect
select year from user_critic)
group by year
order by sum(Total_Shipped) DESC;