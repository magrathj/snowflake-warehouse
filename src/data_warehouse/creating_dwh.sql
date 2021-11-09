USE YELP;

DROP TABLE DWH.CLIMATE;
DROP TABLE DWH.USER;
DROP TABLE DWH.TIP;
DROP TABLE DWH.REVIEW;
DROP TABLE DWH.BUSINESS;
DROP TABLE DWH.CHECKIN;

CREATE TABLE DWH.CLIMATE (
    DATE DATE PRIMARY KEY,
    PRECIPITATION FLOAT, 
    PRECIPITATION_NORMAL FLOAT, 
    TEMPERATURE_MIN FLOAT, 
    TEMPERATURE_MAX FLOAT, 
    TEMPERATURE_NORMAL_MIN FLOAT, 
    TEMPERATURE_NORMAL_MAX FLOAT
);

CREATE TABLE DWH.BUSINESS (
    ADDRESS VARCHAR,
    BUSINESS_ID VARCHAR,
    CATEGORIES  VARCHAR,
    CITY VARCHAR,
    LATITUDE FLOAT,
    LONGITUDE FLOAT,
    NAME VARCHAR,
    POSTAL_CODE VARCHAR,
    REVIEW_COUNT INT,
    STARS INT,
    STATE VARCHAR,
    constraint pkey_business primary key (BUSINESS_ID) 
);

CREATE TABLE DWH.USER (
    USER_ID VARCHAR,
    NAME VARCHAR(100),
    REVIEW_COUNT INT,
    USEFUL INT,
    FUNNY INT,
    YELPING_SINCE DATE,
    constraint pkey_user primary key (USER_ID) 
);


CREATE TABLE DWH.TIP (
    TIP_ID VARCHAR PRIMARY KEY, 
    BUSINESS_ID VARCHAR,
    COMPLIMENT_COUNT INT,
    DATE DATE,
    TEXT VARCHAR, 
    USER_ID VARCHAR,
    constraint fkey_climate foreign key (DATE) references DWH.CLIMATE (DATE),
    constraint fkey_business foreign key (BUSINESS_ID) references DWH.BUSINESS (BUSINESS_ID), 
    constraint fkey_user foreign key (USER_ID) references DWH.USER (USER_ID) 
);

CREATE TABLE DWH.REVIEW (
    BUSINESS_ID VARCHAR,
    REVIEW_ID VARCHAR PRIMARY KEY,
    USER_ID VARCHAR,
    COOL INT,
    DATE DATE,
    FUNNY INT,
    STARS INT,
    TEXT VARCHAR,
    USEFUL INT,
    constraint fkey_climate foreign key (DATE) references DWH.CLIMATE (DATE),
    constraint fkey_business foreign key (BUSINESS_ID) references DWH.BUSINESS (BUSINESS_ID), 
    constraint fkey_user foreign key (USER_ID) references DWH.USER (USER_ID) 
);

CREATE TABLE DWH.CHECKIN (
    BUSINESS_ID VARCHAR,
    DATE DATE,
    TOTAL_CHECKINS INT,
    constraint fkey_climate foreign key (DATE) references DWH.CLIMATE (DATE), 
    constraint fkey_business foreign key (BUSINESS_ID) references DWH.BUSINESS (BUSINESS_ID), 
    constraint pkey_checkin primary key (BUSINESS_ID, DATE) 
);


