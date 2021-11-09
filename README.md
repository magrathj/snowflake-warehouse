# Snowflake Warehouse
Snowflake warehouse which takes in raw weather and restaurants (YELP) data into a **Staging** location. Then we transform those raw datasets into a refined **Operational Data Store** area. Lastly, the weather data and restaurant datasets are joined to provide a final reporting layer, **Data Warehouse**, to answer the question around how the effects of weather have on restaurant reviews. 
 

## Architecture Diagram

![Architecture Diagram](./images/ArchitectureDiagram.png)

## Downloading the dataset

### Datasets
[Climate dataset](https://crt-climate-explorer.nemac.org/)

[Yelp dataset](https://www.yelp.com/dataset/download)

### How to unzip tar files
[UnzipTar](https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/)

## ERM 

![ERM](./images/ERM.png)

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



## Star Schema 

![ERM](./images/StarSchema.png)

## Creating DWH tables

![yelp](./images/DWH.PNG)


## Query to find climate and business name and rating

```sql
    USE YELP;

    SELECT CLIMATE.PRECIPITATION, 
        CLIMATE.TEMPERATURE_MIN, 
        CLIMATE.TEMPERATURE_MAX, 
        BUSINESS.NAME, 
        BUSINESS.STARS
    FROM DWH.CLIMATE
    JOIN DWH.REVIEW ON DWH.CLIMATE.DATE = DWH.REVIEW.DATE
    JOIN DWH.BUSINESS ON DWH.REVIEW.BUSINESS_ID = DWH.BUSINESS.BUSINESS_ID;
```