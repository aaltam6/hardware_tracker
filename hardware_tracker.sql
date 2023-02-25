USE sys;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS loc;
DROP TABLE IF EXISTS hardware;
DROP TABLE IF EXISTS rent;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE employee(
employeeID varchar(50),
firstName varchar(50),
lastName varchar(50),
positionTitle varchar(50),
department varchar(50),
PRIMARY KEY(employeeID)
)
;
CREATE TABLE rent(
rentID varchar(50),
checkOut varchar(50),
checkIn varchar(50),
employeeID varchar(50),
hardwareID varchar(50),
locID varchar(50),
PRIMARY KEY(rentID),
FOREIGN KEY(employeeID) REFERENCES employee(employeeID),
FOREIGN KEY(hardwareID) REFERENCES hardware(hardwareID),
FOREIGN KEY(locID) REFERENCES loc(locID)
)
;
CREATE TABLE loc(
locID varchar(50),
officeTitle varchar(50),
city varchar(50),
State varchar(50),
officeType varchar(50),
employeeCount varchar(10),
PRIMARY KEY(locID)
)
;
CREATE TABLE hardware(
hardwareID varchar(50),
itemType varchar(50),
make varchar(50),
model varchar(50),
locID varchar(50),
rentID varchar(50),
PRIMARY KEY(hardwareID),
FOREIGN KEY (locID) REFERENCES loc(locID),
FOREIGN KEY (rentID) REFERENCES rent(rentID)
)
;

INSERT INTO employee(employeeID,firstName,lastName,positionTitle,department)
VALUES('E001','Arturo','Altamirano','IT Intern','Network Team'),
('E002','Clyde','Drexler','Junior Accountant','Accounting')
;

INSERT INTO rent(rentID,checkOut,checkIn,employeeID,hardwareID,locID)
VALUES('R001','2021-01-01','NULL','E001','PC050','L001'),
('R002','2019-09-28','2022-01-01','E002','M009','L002')
;

INSERT INTO hardware(hardwareID,itemType,make,model,locID,rentID)
VALUES('PC050','Personal Computer','Dell','GB1100','L001','R001'),
('M009','Monitor','Dell','DM-991','L002','R002')
;

INSERT INTO loc(locID,officeTitle,city,State,officeType,employeeCount)
VALUES('L001','Corporate HeadQuarters','Baton Rouge','LA','Corporate Multi-Floor','200'),
('L002','Single Space','Mobile','AL','Single Floor','10')
;

