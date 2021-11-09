USE YELP;

list @large_data_stage;


DROP TABLE STAGING.CHECKIN;

CREATE TABLE STAGING.CHECKIN (
    data variant
);

copy into STAGING.CHECKIN 
  from @large_data_stage/yelp_academic_dataset_checkin.json.gz
  file_format = (format_name = STAGING.MYJSONFORMAT)
  on_error = 'skip_file'; 
  
 SELECT * FROM STAGING.CHECKIN;
