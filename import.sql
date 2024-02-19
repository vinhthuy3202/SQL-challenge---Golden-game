TRUNCATE TABLE dbo.game_reviews
Go
BULK INSERT dbo.game_reviews
from 'D:\data\sql\GOLDEN AGE OF VIDEO GAME\datasets\game_reviews.csv'
WITH (		   FIRSTROW=2,
               FIELDTERMINATOR = ',', 
               ROWTERMINATOR = '0x0a',
			   FIELDQUOTE = '"'
            ) ;
Select * from dbo.game_reviews


CREATE TABLE dbo.game_sales( name varchar(max), platform varchar(1000), publisher varchar (1000), developer varchar(255), total_shipped float, year date)
TRUNCATE TABLE dbo.game_sales
Go

BULK INSERT dbo.game_sales
from 'D:\data\sql\GOLDEN AGE OF VIDEO GAME\datasets\game_sales.csv'
WITH (		   FIRSTROW=2,
               FIELDTERMINATOR = ',', 
               ROWTERMINATOR = '0x0a',
			   FIELDQUOTE = '"',
			   FORMAT = 'CSV'
            ) ;
Select * from dbo.game_sales

CREATE TABLE dbo.game_sales_data( rank int not null, name varchar(max), platform varchar(1000), publisher varchar (1000), developer varchar(255), critic_score float, user_score float, total_shipped float, year date)
TRUNCATE TABLE dbo.game_sales_data
Go
BULK INSERT dbo.game_sales_data
from 'D:\data\sql\GOLDEN AGE OF VIDEO GAME\datasets\game_sales_data.csv'
WITH (		   FIRSTROW=2,
               FIELDTERMINATOR = ',', 
               ROWTERMINATOR = '0x0a',
			   FIELDQUOTE = '"',
			   FORMAT = 'CSV'
            ) ;
Select * from dbo.game_sales_data


