USE sys;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS loc;
DROP TABLE IF EXISTS hardware;
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE employee(
rentID varchar(50),
employeeID varchar(50),
firstName varchar(50),
lastName varchar(50),
positionTitle varchar(50),
department varchar(50),
PRIMARY KEY(rentID)
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
checkOut date,
checkedInStatus varchar(50),
activeStatus varchar(10),
locID varchar(50),
rentID varchar(50),
PRIMARY KEY(hardwareID),
FOREIGN KEY (locID) REFERENCES loc(locID),
FOREIGN KEY (rentID) REFERENCES employee(rentID)
)
;

INSERT INTO employee(rentID,employeeID,firstName,lastName,positionTitle,department)
VALUES('R001','E001','Arturo','Altamirano','Loan Officer','Lending'),
('R002','E002','Clyde','Drexler','Accountant','Accounting'),
('R003','E003','Allen','Iverson','CEO','Executive'),
('R004','E003','Allen','Iverson','CEO','Executive');

INSERT INTO hardware(hardwareID,itemType,make,model,checkOut,checkedInStatus,activeStatus,locID,rentID)
VALUES('PC050','Personal Computer','Dell','GB1100','2021-05-12','Checked Out','Active','L001','R001'),
('M009','Monitor','Dell','DM-991','2021-05-12','Checked In','Inactive','L001','R002'),
('PC182','Personal Computer','Intel','RZ-200','2020-01-01','Checked Out','Active','L002','R003'),
('LT001','Laptop','Dell','Lattitude E550','2021-02-02','Checked Out','Active','L002','R004');

INSERT INTO loc(locID,officeTitle,city,State,officeType,employeeCount)
VALUES('L001','Corporate HeadQuarters','Baton Rouge','LA','Corporate Multi-Floor','200'),
('L002','Single Space','Mobile','AL','Single Floor','10'),
('L003','Auxiliary Corporate Office','Slidell','LA','Corporate Single-Floor','126'),
('L004','Auxiliary Corporate Office','New Orleans','LA','Corporate Single-Floor','189')
;

