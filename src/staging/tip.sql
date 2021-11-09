USE YELP;

list @large_data_stage;


DROP TABLE STAGING.TIP;

CREATE TABLE STAGING.TIP (
    data variant
);

copy into STAGING.TIP 
  from @large_data_stage/yelp_academic_dataset_tip.json.gz
  file_format = (format_name = STAGING.MYJSONFORMAT)
  on_error = 'skip_file'; 
  
 SELECT * FROM STAGING.TIP;
