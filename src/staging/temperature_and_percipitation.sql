USE YELP;

DROP TABLE STAGING.TEMPERATURE;
DROP TABLE STAGING.PRECIPITATION;


CREATE TABLE STAGING.PRECIPITATION (
    date INT,
    precipitation STRING,
    precipitation_normal STRING

);

CREATE TABLE STAGING.TEMPERATURE (
    date INT,
    min FLOAT, 
    max FLOAT,
    normal_min FLOAT,
    normal_max FLOAT
);

