# World Cup Database Project
This project aims to create a relational database using PostgreSQL to store information about the World Cup matches from the 2014 edition to the most recent one. Through three main stages, students are required to design the database structure, efficiently insert the data, and perform queries to obtain meaningful insights from the matches.

## Description of the Stages:

### 1. Database Creation:
In this phase, students must create a database called `worldcup` and design two tables: `teams` and `games`. The `teams` table stores the teams, while the `games` table stores the results of each match, with foreign keys linking the winning and opposing teams. All columns must have integrity constraints like `NOT NULL` and `UNIQUE` to ensure data consistency.

### 2. Data Insertion:
In this stage, students must complete a script (`insert_data.sh`) to insert match data from a CSV file into the database. Students should ensure that teams are inserted uniquely into the `teams` table and that each game in the `games` table is correctly linked to the teams using their identifiers. The efficiency of the insertion is key, as queries must run within a specific time limit.

### 3. Database Queries:
Finally, students complete a query file (`queries.sh`) to retrieve specific data from the database, such as winning teams, goals scored, and other statistics. Queries must be precise and return results in the exact format specified in an expected output file. Students need to optimize queries to ensure they perform well under execution time constraints.

## Technical Challenges:

### 1. Data Integrity:
The main challenge lies in inserting the data such that duplication of teams is avoided, and consistency is maintained between the `teams` and `games` tables. Students must ensure that foreign keys are correctly assigned.

### 2. Query Optimization:
Given the time limit for running the tests, students must ensure that queries are efficient enough to execute quickly, minimizing unnecessary database accesses.

## Skills Assessed:

This project evaluates the following competencies:

- **Relational Database Design**: Creating efficient and normalized database structures.
- **Process Automation**: Using scripts to automate data insertion and query execution.
- **SQL Query Optimization**: Ability to write efficient SQL queries that return accurate results within a limited time.
- **CSV Data Handling**: Reading and processing data from CSV files for database insertion.

This exercise provides a comprehensive assessment of key skills in database management, scripting, and SQL query optimization.


A project done in psql and Bash for freecodecamp.org


