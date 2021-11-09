# Snowflake Warehouse
Snowflake warehouse which takes in raw weather and restaurants (YELP) data into a **Staging** location. Then we transform those raw datasets into a refined **Operational Data Store** area. Lastly, the weather data and restaurant datasets are joined to provide a final reporting layer, **Data Warehouse**, to answer the question around how the effects of weather have on restaurant reviews. 
 
## Architecture Diagram

![Architecture Diagram](./images/ArchitectureDiagram.png)

## ERM 

![ERM](./images/Schemas.PNG)

## Schema

![Schemas](./images/Schemas.PNG)

## Uploading data to Stage areas

Uploading using web portal
![uploading_using_web](./images/upload_temp_data.PNG)

Uploading using snowflake client to stage area
![uploading_using_snowflake_client](./images/snow_flake_client_to_stage_area.PNG)

## Creating Staging tables

![temp_and_perc](./images/Temp_Perceipitation_tables.PNG)

![yelp](./images/yelp_raw.PNG)


## Creating ODS tables

![yelp](./images/ods_tables.PNG)


## Creating DWH tables

![yelp](./images/dwh_tables.PNG)