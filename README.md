# AWS-DataMigrationSportstickets

## Steps
- [Introduction](##Introduction)
- [Setup](##Setup)
- [Architecture-Diagram](##Architecture-Diagram)

## Introduction
In this lab is a data pipeline how to migrate data from PostGreSQL using AWS Data Migration Service with destionation S3, then we'll apply AWS Glue and AWS Athena
to check the data migrated.

- Google Colab: Use the script (Script_Postgresql.ipynb) to create and configure PostgreSQL.
- AWS DMS: Utilized for migrating data from PostgreSQL to S3.
- AWS S3 bucket: This bucket will be used to store data.
- AWS Glue: Employed to create a table using the Crawler.
- AWS Athena: Used for performance queries and data verification.
  
## Setup

### Data Migration Service

#### Replication instances
    - name -> dms-replication-instance
    - Engine version -> 3.5.1
    - Instance class -> dms.t3.medium
    - Multi AZ -> No
    - Alocated storage -> 50
    - VPC -> Default
    - Replication subnet group -> Default
    - VPC security groups -> Default

#### Endpoints Source

    - name -> rds-source-endpoint
    - Endpoint engine -> Postgresql
    - Endpoint type -> Source
    - User name -> adminuser
    - SSL mode -> None
    - Server name -> Depents of ngrok
    - Port -> Depents of ngrok
    - Database name -> sportstickets

#### Endpoints Target

    - name -> s3-target-endpoint
    - Endpoint engine -> Amazon s3
    - Endpoint type -> Target
    - Bucket name -> YOUR BUCKET
    - Bucket folder -> tickets
    - SSL mode -> None

#### Database migration tasks

    - name -> dms-full-dump-task
    - Type -> Full load
    - Source -> rds-source-endpoint
    - Target -> s3-target-endpoint
    - Replication instance -> dms-replication-instance
    - Mapping rules -> where schema name is like 'dms_sample' and Source table name is like 'name_data', include
		   where schema name is like 'dms_sample' and Source table name is like 'mlb_data', include
		   You cant add other tables

#### AWS S3
#### CREATE AND SELECT YOUR BUCKET

### AWS GLUE

#### Databases 
    - name -> migrationsportstickerdatabase

#### Crawlers

    - name -> Crawler-Migration-SportSticker
    - IAM Role -> YOUR IAM ROLE
    - Table prefix -> csv_
    - Database -> migrationsportstickerdatabase
    - Frequency -> On demand
    - Data type -> S3
    - Data Source -> s3://data-engineer-dmslab-student/Tickets/dms_sample/
    - Parameters -> Recrawl all

### AWS ATHENA

    - Data Source -> AwsDataCatalog
    - Database -> migrationsportstickerdatabase
    -Tables -> All

## Architecture-Diagram
![Architecture Diagram](AWS-Migration-SportStickets.jpg)
