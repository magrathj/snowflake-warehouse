INSERT INTO "YELP"."ODS"."TEMPERATURE"
SELECT to_date(concat(substr(DATE, 1, 4), '-', substr(DATE, 5, 2), '-', substr(DATE, 7, 2))) as DATE,
       TEMPERATURE.MIN,
       TEMPERATURE.MAX,
       TEMPERATURE.NORMAL_MIN,
       TEMPERATURE.NORMAL_MAX
FROM "YELP"."STAGING"."TEMPERATURE"
WHERE TEMPERATURE.MIN IS NOT NULL 
ORDER BY DATE DESC;

----------------------------
INSERT INTO "YELP"."ODS"."PRECIPITATION"
SELECT to_date(concat(substr(DATE, 1, 4), '-', substr(DATE, 5, 2), '-', substr(DATE, 7, 2))) as DATE,
       to_double(PRECIPITATION.PRECIPITATION) as PRECIPITATION,
       to_double(PRECIPITATION.PRECIPITATION_NORMAL) as PRECIPITATION_NORMAL
FROM "YELP"."STAGING"."PRECIPITATION"
WHERE PRECIPITATION.PRECIPITATION IS NOT NULL 
AND PRECIPITATION.PRECIPITATION != 'T'
ORDER BY DATE DESC;

----------------------------
INSERT INTO "YELP"."ODS"."BUSINESS"
SELECT trim(data:address, '"') as address, 
       trim(data:business_id, '"') as business_id, 
       trim(data:categories, '"') as categories, 
       trim(data:city, '"') as city, 
       data:latitude as latitude, 
       data:longitude as longitude, 
       trim(data:name, '"') as name, 
       trim(data:postal_code, '"') as postal_code, 
       data:review_count as review_count, 
       data:stars as stars, 
       trim(data:state, '"') as state
FROM "YELP"."STAGING"."BUSINESS";

----------------------------
INSERT INTO "YELP"."ODS"."CHECKIN"
SELECT business_id, c.value::string as date
FROM (
  SELECT trim(data:business_id, '"') as business_id,  
         trim(data:date, '"') as date
  FROM "YELP"."STAGING"."CHECKIN"
), lateral flatten(input=>split(date, ',')) c;

----------------------------
INSERT INTO "YELP"."ODS"."REVIEW"
SELECT trim(data:business_id, '"') as business_id, 
       trim(data:review_id, '"') as review_id,
       trim(data:user_id, '"') as user_id,
       trim(data:cool, '"') as cool, 
       trim(data:date, '"') as date,
       trim(data:funny, '"') as funny,
       trim(data:stars, '"') as stars,
       trim(data:text, '"') as text,
       trim(data:useful, '"') as useful
FROM "YELP"."STAGING"."REVIEW";

----------------------------
INSERT INTO "YELP"."ODS"."TIP"
SELECT  trim(data:business_id, '"') as business_id, 
        trim(data:compliment_count, '"') as compliment_count, 
        trim(data:date, '"') as date, 
        trim(data:text, '"') as text, 
        trim(data:user_id, '"') as user_id
FROM "YELP"."STAGING"."TIP";

----------------------------
INSERT INTO "YELP"."ODS"."USER"
SELECT trim(data:user_id, '"') as user_id,
       trim(data:name, '"') as name,  
       trim(data:review_count, '"') as review_count,  
       trim(data:useful, '"') as useful,    
       trim(data:funny, '"') as funny,
       trim(data:yelping_since, '"') as yelping_since
FROM "YELP"."STAGING"."USER";
