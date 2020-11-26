# Brooke Cooper - SQL Homework - Employee Database: A Mystery in Two Parts - 11/26/2020

## Explanation of Contents of Folder

1. Data Engineering

I performed the database and table creation task two ways, in large part because I didn't really understand the second method until Tuesday's class (11/24/2020).

  a. First Method
    * Examined each csv file, profiled the data types, determined primary and foreign key relationships
    * 'Mapped' these relationships in an Excel file, basically creating a crude ERD.
        * ERD_metadata.xlsx
    * Output images to 
        * ERD_metadata.jpg 
        * ERD_metadata.pdf.
    * Created the database named EmployeeSQL in Postgres using right-click (create database) and drop-down menus.
    * Created and formatted the database tables in Postgres again using right-click (create table, table properties) and drop-down menus.
    * Experimented with an alternate path to designate foreign keys with SQL scripts after table creation (ALTER TABLE, ADD CONSTRAINT, FOREIGN KEY, REFERENCES)
        * constraint_fk.sql
    * Imported the corresponding cvs files into each of the 6 empty EmployeeSQL database tables using the drop-down menus
    * This method successfully generated, configured and populated the EmployeeSQL tables
  
  b. Second Method
    * Used quickdatabasediagrams.com to sketch out an ERD of the EmployeeSQL database tables yet to be created from the csv
    * Output an image of the ERD file
        * QuickDBD-EmployeeSQL_ERD.png
    * Exported table schemata SQL code (specific to Postgres) to generate and properly configure all of the tables in the EmployeeSQL database
        * QuickDBD-EmployeeSQL_ERD.sql
    * Imported the corresponding cvs files into each of the 6 empty EmployeeSQL database tables using the drop-down menus
        * I elected not to code this in SQL because that seems not what was indicated for in the instructions in creating the table schemata SQL file
    * This method also worked to generate and configure the same EmployeeSQL tables as in the first method (faster, with less effort, and as accurately)

2. Data Analysis - Regular Questions

My answers to Questions 1 through 8 are available as individual SQL code files:
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-1 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-2 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-3 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-4 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-5 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-6 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-7 - 2020-11-25.sql
    * Brooke Cooper - EmployeeSQL-CaseHomework-Query-8 - 2020-11-25.sql

3. Data Analysis - Bonus Question

All (practically all) of the work effort to answer the bonus question/task is found in the following Jupyter Notebook file:
    * Brooke Cooper employee_sql 2020-11-26.ipynb

The effort was divided into the following tasks:

  a. Import the EmployeeSQL database into python pandas dataframes/tables
    * This involved pip installing and importing not only SQLalchemy but also psycopg2
  
  b. Inspect the dataframes to see that the dataframes reproduced the information content of the PostgreSQL tables
  
  d. Generate two plots, one a histogram and the other a bar chart
    * In one case, prepping the data involved merging 3 dataframes (like doing table joins) and calculating means on a groupby object
    * The graphs can be found toward the bottom of the Jupyter Notebook
  
  e. I performed some additional calculations to verify the analysis

  f. I layed forth my simple conclusion and supporting points from my analysis at the head end of the Jupyter Notebook in Markdown.

4. There are a few additional files:
    * pip_install_psycopg2.ipynb - python library installation file -- self-explanatory
    * pip_install_SQLAlchemy.ipynb - python library installation file -- self-explanatory
    * psycopg2_example.ipynb - this was critical to understanding how to import the EmployeeSQL database (employeesql.sql)
    * Brooke Cooper employee_sql - Backup (1).ipynb -- self-explanatory

5. I then put together this README file (README_BrookeCooper_EmployeeSQL.md) which I hope adequately maps out the contents of the Employee SQL folder.
