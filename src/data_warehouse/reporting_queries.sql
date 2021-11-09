USE YELP;

SELECT CLIMATE.PRECIPITATION, 
       CLIMATE.TEMPERATURE_MIN, 
       CLIMATE.TEMPERATURE_MAX, 
       BUSINESS.NAME, 
       BUSINESS.STARS
FROM DWH.CLIMATE
JOIN DWH.REVIEW ON DWH.CLIMATE.DATE = DWH.REVIEW.DATE
JOIN DWH.BUSINESS ON DWH.REVIEW.BUSINESS_ID = DWH.BUSINESS.BUSINESS_ID;