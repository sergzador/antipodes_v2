EXEC sp_configure 'show advanced', 1
GO
RECONFIGURE
GO
EXEC sp_configure 'contained database authentication', 1
GO
RECONFIGURE
GO

CREATE DATABASE [INVDB];
GO
ALTER DATABASE [INVDB] SET CONTAINMENT = PARTIAL WITH NO_WAIT;
GO
USE INVDB;
GO

CREATE SCHEMA [WEB_DAILY];
GO

CREATE TABLE WEB_DAILY.INTRADAY_STATS (
ID INT IDENTITY PRIMARY KEY,
TICKER VARCHAR(10),
LAST_TRADE NUMERIC(10,4),
CURRENT_IIV NUMERIC(10,4),
CHANGE NUMERIC(10,4),
CHANGE_PCT NUMERIC(8,3),
NAV_AT_MKT_CLOSE NUMERIC(10,4)
CURRENCY_CODE VARCHAR(3),
CREATED_TSTP DATETIME,
UPDATED_TSTP DATETIME,
LATEST_FLAG VARCHAR(1)
);
GO

CREATE TABLE WEB_DAILY.YIELD (

ID INT IDENTITY PRIMARY KEY,
TICKER VARCHAR(10),
SEC_30DAY_YIELD NUMERIC(8,3),
DISTRIBUTION_RATE NUMERIC(8,3),
DISTRIBUTION_RATE_12MNTH NUMERIC(8,3),
SEC_30DAY_UNSUB_YIELD NUMERIC(8,3),
CURRENCY_CODE VARCHAR(3),
CREATED_TSTP DATETIME,
UPDATED_TSTP DATETIME,
LATEST_FLAG VARCHAR(1)
);
GO


CREATE TABLE WEB_DAILY.PRIOR_CLOSE (

ID INT IDENTITY PRIMARY KEY,
TICKER VARCHAR(10),
CLOSING_PRICE NUMERIC(10,4),
BID_ASK_MIDPOINT NUMERIC(10,4),
BID_ASK_PREM_DISC NUMERIC(10,4),
BID_ASK_PREM_DISC_PCT NUMERIC(8,3),
MEDIAN_BID_ASK_SPREAD NUMERIC(8,3),
CURRENCY_CODE VARCHAR(3),
CREATED_TSTP DATETIME,
UPDATED_TSTP DATETIME,
LATEST_FLAG VARCHAR(1)
);
GO


CREATE USER RUSER WITH PASSWORD = 'Welcome@toSQL2022';
GO
GRANT INSERT,UPDATE, DELETE, SELECT, ALTER ON DATABASE :: [INVDB] TO RUSER;
GO
GRANT INSERT,UPDATE, DELETE, SELECT, ALTER ON SCHEMA :: [WEB_DAILY] TO RUSER;
GO

