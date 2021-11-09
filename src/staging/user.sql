USE YELP;

list @large_data_stage;

DROP TABLE STAGING.USER;

CREATE TABLE STAGING.USER (
    data variant
);

copy into STAGING.USER 
  from @large_data_stage/yelp_academic_dataset_user.json.gz
  file_format = (format_name = STAGING.MYJSONFORMAT)
  on_error = 'skip_file'; 
  
 SELECT * FROM STAGING.USER LIMIT 10;
 