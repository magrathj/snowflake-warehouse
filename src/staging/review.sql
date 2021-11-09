USE YELP;

list @large_data_stage;

DROP TABLE STAGING.REVIEW;

CREATE TABLE STAGING.REVIEW (
    data variant
);

copy into STAGING.REVIEW 
  from @large_data_stage/yelp_academic_dataset_review.json.gz
  file_format = (format_name = STAGING.MYJSONFORMAT)
  on_error = 'skip_file'; 
  
SELECT * FROM STAGING.REVIEW LIMIT 10;
