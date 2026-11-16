Crownfield Eye Hospital Database

1. Project Overview

This project was completed as part of the CPU4:103 Introduction to Database module.

Our group designed and developed a relational database for a fictional hospital called Crownfield Eye Hospital.

The purpose of the database is to organise information about patients, clinicians, appointments, diagnoses, prescriptions, medicines and follow-up plans.

We used MySQL to create and test the database.

All patient information used in this project is fictional.

2. Software Used

* MySQL
* MySQL Workbench
* Microsoft Excel for normalisation
* GitHub for storing project files

3. Database Design

Our database contains 11 related tables:

1. Patient
2. Specialty
3. Clinician
4. Clinic
5. Appointment
6. Diagnosis
7. AppointmentDiagnosis
8. Prescription
9. FollowUpPlan
10. Medicine
11. PrescriptionItem

We used primary keys to identify records and foreign keys to connect related tables.

The database was designed using an Entity Relationship (ER) diagram.

We also used normalisation from UNF to 3NF to reduce repeated information and organise the data.

4. My Individual Contribution – Student 1

My main contribution was identifying the entities, attributes and relationships needed for the database.

I worked on selecting primary keys and foreign keys and showing how the tables connect in the ER diagram.

I also helped organise the design evidence for the project.

The database implementation, SQL testing and security demonstrations were part of our group project.

5. SQL Implementation and Testing

Our project includes SQL scripts for creating the database, inserting fictional records and testing different database functions.

The SQL demonstrations cover:

* INNER JOIN
* LEFT JOIN
* GROUP BY and HAVING
* Subquery
* Stored procedure
* Trigger

These queries demonstrate how information can be retrieved from related tables and how database rules can be checked.

6. Security and Transactions

Our group designed four database access roles:

* Administrator
* Doctor
* Receptionist
* Patient

The roles have different permissions depending on their responsibilities.

We also tested database transactions using COMMIT and ROLLBACK.

COMMIT saves completed changes, while ROLLBACK cancels changes that have not been committed.

7. Project Files

The repository contains SQL files and supporting evidence for the database project.

The SQL scripts are organised using numbered filenames.

The project also includes supporting documents showing the database design, normalisation and testing.

8. How to Run the Database

1. Install MySQL and MySQL Workbench.
2. Download the SQL files from this repository.
3. Open MySQL Workbench and connect to a local MySQL server.
4. Run the database creation script first.
5. Run the remaining scripts in their numbered order, checking any instructions and dependencies.
6. Use SELECT queries to check the inserted records.
7. Run the SQL demonstrations to view the results.

Some security tests may require an account with permission to create users and roles.

9. Data Protection

This database was created for educational purposes only.

All patient names and other personal details are fictional.

No real NHS patient information was used.

10. Conclusion

This project helped me understand how relational databases are designed and how different tables connect.

I learned more about entities, attributes, primary keys, foreign keys and relationships.

Working on the ER diagram helped me understand the importance of planning a database before implementing it.

The project also helped our group develop our knowledge of SQL, database security and testing.
