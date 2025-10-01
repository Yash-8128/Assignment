CREATE DATABASE COMPANY;
USE COMPANY;
/* Q1) STATEMENT TO CREATE CONTACT TABLE*/

CREATE TABLE CONTACT(
             CONTACT_ID INT AUTO_INCREMENT PRIMARY KEY,
             COMPANY_ID INT NOT NULL,
             FIRST_NAME VARCHAR(100),
             LAST_NAME VARCHAR(100),
             STREET VARCHAR(100),
             CITY VARCHAR(100),
             STATE VARCHAR(100),
             PINCODE INT,
             ISMAIN BOOLEAN,
             EMAIL VARCHAR(100),
             PHONE_NO VARCHAR(12)
			
             );
             
INSERT INTO CONTACT(COMPANY_ID,FIRST_NAME,LAST_NAME,STREET,CITY,STATE,PINCODE,ISMAIN,EMAIL,PHONE_NO)
VALUES(01,"YASH","PANDEY","PANDESARA","SURAT","GUJARAT",394221,FALSE,"YASH@123","1213345645"),
      (01,"MITTUL","KHAPRA","SIVDI","SURAT","GUJARAT",394220,FALSE,"MITTUL@123","2334566778");
      
  SELECT * FROM CONTACT;    
/* Q2) Statement to create the Employee table*/

DROP TABLE EMPLOYEE;
CREATE TABLE EMPLOYEE(
             EMP_ID INT AUTO_INCREMENT PRIMARY KEY,
             FIRST_NAME VARCHAR(100),
             LAST_NAME VARCHAR(100),
             SALARY DECIMAL(10,2),
             HIRE_DATE DATE,
             JOB_TITLE VARCHAR(20),
             EMAIL VARCHAR(45),
             PHONE_NO VARCHAR(12)
             );
 INSERT INTO EMPLOYEE(FIRST_NAME,LAST_NAME,SALARY,HIRE_DATE,JOB_TITLE,EMAIL,PHONE_NO)
 VALUES("AMIT","PRAJAPATI",40000,"2005-03-01","DATA ANALYST","AMIT@123","2334253562"),
	   ("RAHIN","MANSURI",50000,"2007-03-02","GRAPHIC DESIGNER","RAHIN@123","1345366753");
 SELECT * FROM EMPLOYEE;      
       
 
 /*Q3) Statement to create the ContactEmployee table*/

CREATE TABLE CONTACT_EMPLOYEE(
             CONTACTEMPLOYEE_ID INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
             CONTACT_ID INT,
             EMP_ID INT,
             CONTACT_DATE DATE,
             DESCRIPTION_ VARCHAR(100)
             );
INSERT INTO CONTACT_EMPLOYEE(CONTACT_ID,EMP_ID,CONTACT_DATE,DESCRIPTION_)
VALUES(01,01,"2025-09-30","HI"),
      (02,02,"2025-09-30","BYE");
      
SELECT * FROM CONTACT_EMPLOYEE;


/* CREATE COMPANY TABLE */
CREATE TABLE COM_PANY(
             COMPANY_ID INT NOT NULL PRIMARY KEY,
             COMPANY_NAME VARCHAR(100),
             STREET VARCHAR(50),
             CITY VARCHAR(30),
             STATE VARCHAR(30),
			 PIN_CODE int
             );
INSERT INTO COM_PANY
VALUES(01,"TOPS","RINGROAD","SURAT","GUJARAT",394220),
      (02,"TOPS2","MOTAVARACHA","SURAT","GUJARAT",394256);	

SELECT * FROM COM_PANY;
/* Q4) In the Employee table, the statement that changes YASH PANDEY'S phone number
to 215-555-8800 */

UPDATE  EMPLOYEE
SET PHONE_NO = "215-555-8800"
WHERE FIRST_NAME = "YASH";
 
 
 
/* Q5) In the company table ,the statement that changes the name of "TOPS"
 to "TOPS TECHNOLOGIES".*/
 
 
 UPDATE COM_PANY
 SET COMPANY_NAME = "TOPS TECHNOLOGIES"
 WHERE COMPANY_NAME = "TOPS";
 
 /* Q6) In ContactEmployee table, the statement that removes YASH PANDEY'S contact
event with AMIT PRAJAPATI (one statement).*/

DELETE FROM CONTACT_EMPLOYEE
WHERE CONTACTEMPLOYEE_ID = 1;

/* Q7) Write the SQL SELECT query that displays the names of the employees that
have contacted MITTUL KHAPRA  (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. */

SELECT 
       EMPLOYEE.FIRST_NAME,
       EMPLOYEE.LAST_NAME
FROM EMPLOYEE
LEFT JOIN CONTACT_EMPLOYEE
ON EMPLOYEE.EMP_ID=CONTACT_EMPLOYEE.EMP_ID
LEFT JOIN CONTACT
ON CONTACT_EMPLOYEE.CONTACT_ID=CONTACT.CONTACT_ID
WHERE CONTACT.FIRST_NAME="MITTUL"AND CONTACT.LAST_NAME="KHAPRA";


/*Q8) What is the significance of “%” and “_” operators in the LIKE statement?

In SQL, the LIKE operator is used for pattern matching in string data. It allows us to search
 for values that match a specific pattern instead of exact matches.
 To define these patterns, special characters are used:

        1..  % (Percent Sign)

Represents zero, one, or multiple characters in a string.

It is useful when we do not know the exact length of the string or want to find partial matches.

Example:

LIKE 'A%' → finds all values starting with "A" (e.g., Amit, Anil, Ananya).

LIKE '%ndey' → finds all values ending with "ndey" (e.g., Pandey, Mandey).

		2..  _ (Underscore)

Represents exactly one single character in a string.

It is useful when we know the position of characters but one character may vary.

Example:

LIKE 'A_it' → matches "Amit", "Anit", etc.

LIKE 'P_ndey' → matches "Pandey", "Pindey", etc.    */
             

/* Q9) 9) Explain normalization in the context of databases. 
             
Normalization is a process of organizing data in a database to reduce redundancy 
(duplicate data) and improve data integrity. The main goal of normalization is to
 divide large, complex tables into smaller, related tables and link them through
 relationships. This ensures that data is stored efficiently and consistently.
*/


/* 10) What does a join in MySQL mean?

In MySQL, a JOIN is used to combine data from two or more tables based on a related 
column between them. Since relational databases often store data in separate tables 
to avoid redundancy, JOIN operations allow us to bring this related information 
together in a single query.*/

/* 11) What do you understand about DDL, DCL, and DML in MySQL?

      1. DDL (Data Definition Language)

          DDL statements are used to define and manage the structure of database
          objects such as tables, schemas, indexes, and views.
          They deal with how the data is stored, not with the data itself.

			Common DDL commands:

              CREATE → Create a new table or database.
              ALTER → Modify an existing table (add, delete, or change columns).
              DROP → Delete a table or database permanently.
              TRUNCATE → Remove all records from a table (structure remains).

      2. DML (Data Manipulation Language)
      
		  DML statements are used to manipulate and work with the actual data 
		  stored in the database.
          They allow inserting, updating, deleting, and retrieving records.

            Common DML commands:

              INSERT → Add new records into a table.
              UPDATE → Modify existing records.
              DELETE → Remove records from a table.
			  SELECT → Retrieve data from one or more tables.

	  3. DCL (Data Control Language)

          DCL statements are used to control access and permissions on the database.
          They help manage security and user privileges.

            Common DCL commands:

              GRANT → Give specific privileges to a user (e.g., SELECT, INSERT).
              REVOKE → Remove previously granted privileges.*/
  
/*  Q12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins? 
 
       Role of JOINs:
            They connect tables using primary key and foreign key relationships.
	        They help avoid data duplication by allowing normalized table design.
            They make queries more powerful by enabling retrieval of related data in one result set.

	   Common Types of Joins in MySQL

        1)  INNER JOIN
             Returns only rows where there is a match in both tables.
             Example: Employees who have made contact with a client.

        2) LEFT JOIN (LEFT OUTER JOIN)
             Returns all rows from the left table, and the matching rows from the right table.
             If no match is found, NULL values are returned from the right side.

        3) RIGHT JOIN (RIGHT OUTER JOIN)
             Returns all rows from the right table, and the matching rows from the left table.
             If no match is found, NULL values are returned from the left side.

		4) FULL JOIN (FULL OUTER JOIN) (not directly supported in MySQL, but can be simulated using UNION)
			 Returns all rows from both tables, with NULLs where there is no match.

		5) CROSS JOIN
             Returns the Cartesian product of the two tables (all possible row combinations).
 

 
