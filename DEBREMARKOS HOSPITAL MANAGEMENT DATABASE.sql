CREATE DATABASE DebreMarkosHospitalManagment;

USE DebreMarkosHospitalManagment;

CREATE TABLE Patient (
    Patient_ID VARCHAR(7) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Phone_Number VARCHAR(20)
); --our patient table have our patient detail Name, Id ,Address , Phone number 

CREATE TABLE Doctor (
    Doctor_ID VARCHAR(7) PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(50)
); --our Doctor table keeps info about our doctors ID, Name, Specialization

CREATE TABLE Treatment (
    Treatment_ID VARCHAR(7) PRIMARY KEY,
    Name VARCHAR(50),
	Disease VARCHAR(50),
    Cost DECIMAL(10,2)
); --Contains our treatment name , with ID , and Cost

CREATE TABLE Room (
    Room_Number VARCHAR(7) PRIMARY KEY,
    Type VARCHAR(50)
); -- contains Unique room number and the rooms use 

CREATE TABLE Treatment_Record (
    Record_ID VARCHAR(7) PRIMARY KEY,
    Patient_ID VARCHAR(7),
    Doctor_ID VARCHAR(7),
    Treatment_ID VARCHAR(7),
    Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID)
); -- the treatment record links our patient , doctor, treatments with their unique record Id, Date , and status 

CREATE TABLE Admission (
    Admission_ID VARCHAR(7) PRIMARY KEY,
    Patient_ID VARCHAR(7),
    Room_Number VARCHAR(7),
    Admission_Date DATE,
    Discharge_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number)
); --Links our patients with their room with a unique Admission_ID, and contains information about the admission and discharge dates.

CREATE TABLE Employee (
    Employee_ID VARCHAR(7) PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(50),
	Doctor_ID VARCHAR(7),
	FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID),
);--The Employee entity has a unique Employee_ID and contains information about the employee's name and role. 


-- The Ward_Boy and Nurse entities link employees to their respective roles.
CREATE TABLE Ward_Boy (
    Ward_Boy_ID VARCHAR(7) PRIMARY KEY,
    Employee_ID VARCHAR(7),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

CREATE TABLE Nurse (
    Nurse_ID VARCHAR(7) PRIMARY KEY,
    Employee_ID VARCHAR(7),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);



CREATE TABLE Operation_Theater (
    Operation_Theater_ID VARCHAR(7) PRIMARY KEY,
    Room_Number VARCHAR(7),
    FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number)
); -- The Operation_Theater entity links rooms to their respective use.
create login login1 with password='123'
create login login2 with password='123'
create user user1 for login login1
create user user2 for login login2
create role adimin2
exec sp_addrolemember 'adimin2','user1'
exec sp_addrolemember 'adimin2','user2'


