USE YELP;

list @large_data_stage;


DROP TABLE STAGING.BUSINESS;

CREATE TABLE STAGING.BUSINESS (
    data variant
);

copy into STAGING.BUSINESS 
  from @large_data_stage/yelp_academic_dataset_business.json.gz
  file_format = (format_name = STAGING.MYJSONFORMAT)
  on_error = 'skip_file'; 
  
 SELECT * FROM STAGING.BUSINESS;
