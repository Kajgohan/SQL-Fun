set serveroutput on;

DROP VIEW CriticalCases;
DROP VIEW DoctorsLoad;
DROP TABLE haveAccessTo;
DROP TABLE Employee;
DROP TABLE RoomVisit;
DROP TABLE has;
DROP TABLE roomType;
DROP TABLE Room;
DROP TABLE EquiptmentUnit;
DROP TABLE EquiptmentType;
DROP TABLE seePatientsWhoAre;
DROP TABLE Admission;
DROP TABLE Patient;
DROP TABLE Doctor;

CREATE TABLE Employee(
    eID number,
    mID number NULL,
    fName CHAR(30),
    lName CHAR (30),
    eType CHAR(20) Default 'regular',
    officeNumber number,
    title CHAR(20),
    salary number,
    employeeRank number,
    primary key(eID),
    constraint fk_mID Foreign key(mID) References Employee(eID)
    );

    CREATE TABLE Doctor(
    dID number,
    FName CHAR(30),
    LName CHAR(30),
    Specialty CHAR(30),
    Gender CHAR(30),
    primary key(dID)
    );
 
 CREATE TABLE Patient(
    SSN VARCHAR(15),
    fName CHAR(30) Default 'jon',
    lName CHAR (30) Default 'doe',
    address VARCHAR(30),
    phoneNumber number,
    primary key(SSN)
    );

CREATE TABLE Room(
    roomNumber number,
    rType CHAR(30),
    occupationFlag CHAR(1) Default 'V',
    Primary Key (roomNumber)
    );

CREATE TABLE haveAccessTo(
    eID number,
    roomNumber number,
    primary key (eID, roomNumber),
    constraint fk_reID Foreign key(eID) References Employee(eID),
    constraint fk_fRoomNum Foreign key(roomNumber) References Room(roomNumber)
    );
 

CREATE TABLE EquiptmentType(
    TID number,
    Model Varchar(30),
    Description VarCHAR2(30),
    NumOfUnits number,
    Instructions CHAR(30),
    primary key(TID)
    );
 
CREATE TABLE EquiptmentUnit(
    serialNumber VARCHAR(30),
    YearOfPurchase number,
    LatestInspection DATE,
    RoomNumber number,
    TID number,
    primary key(serialNumber),
    constraint fk_TID Foreign key(TID) References EquiptmentType(TID)
    );

CREATE TABLE has(
    roomNumber number,
    serialNumber VARCHAR(30),
    primary key(roomNumber, serialNumber),
    constraint fk_roomNum Foreign key(roomNumber) references room(roomNumber),
    constraint fk_serialNumber Foreign key(serialNumber) references EquiptmentUnit(serialNumber)
    );
 

 

 
 
CREATE TABLE Admission(
    admissionID number,
    totalInsurance number,
    startTime TIMESTAMP,
    leaveTime TIMESTAMP,
    futureVisitDate DATE,
    totalPayment number,
    SSN VARCHAR(15),
    primary key(admissionID),
    constraint fk_SSN Foreign key(SSN) references Patient(SSN)
    );

CREATE TABLE RoomVisit(
    roomNumber number,
    enterTime TIMESTAMP,
    leaveTime TIMESTAMP,
    admissionID number,
    primary key(roomNumber, enterTime, admissionID),
    constraint fk_roomNumber Foreign key(roomNumber) references Room(roomNumber),
    constraint fk_admission Foreign key(admissionID) references Admission(admissionID)  
    );
 
 
CREATE TABLE seePatientsWhoAre(
    dID number,
    admissionID number,
    DoctorComments CHAR(30),
    primary key(dID,admissionID),
    constraint fk_dID Foreign key(dID) references Doctor(dID),
    constraint fk_admissionID Foreign key(admissionID) references Admission(admissionID)
    );

CREATE TABLE roomType(
    roomNumber number,
    use CHAR(30),
    primary key(roomNumber, use),
    constraint fk_thisRoomNumber Foreign key(roomNumber) references Room(roomNumber)
    );
 





INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('111111111', 'Aqua', 'Apple', '18 love', 1111);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('222222222', 'Bob', 'Berd',' 4 lancaster',1112);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('333333333', 'Carla', 'Cathy', '7 institute',1113);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('444444444', 'Dick', 'Direck', '9 elm', 1114);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('555555555', 'Eric', 'Emily', '0 park', 1115);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('666666666', 'Fred', 'Fed', '34 common', 1116);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('777777777', 'Gai', 'Green', '57 goathead', 1117);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('888888888', 'Harry', 'Hether', '234 fuller', 1118);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('111-22-3333', 'Iran', 'Iggy', '745 AK', 1119);

INSERT INTO Patient (SSN, fName, lName, address, phoneNumber)
VALUES ('101010101', 'Jack', 'Jackie',  '74 daka', 1120);








INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(111, 'Kevin', 'kit', 'arm', 'Male');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(222, 'Lyu', 'Lucy', 'hand', 'Male');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(333, 'Meek', 'Mike', 'hand', 'Male');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(444, 'Neal', 'Nick', 'eye', 'Male');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(555, 'Oral', 'Ovo', 'eye', 'Male');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(666, 'Peter', 'Pitch', 'eye', 'Female');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(777, 'Qui', 'Qun', 'mouse', 'Female');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(888, 'Rice', 'Rick', 'eye', 'Female');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(999, 'Sis', 'Serena', 'eye', 'Female');

INSERT INTO Doctor( dID, FName, LName, Specialty, Gender)
VALUES(101, 'Tay', 'Pitch', 'Talyor', 'Female');









INSERT INTO Room( roomNumber, occupationFlag)
VALUES(1111, 'O');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(2222, 'V');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(3333, 'O');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(4444, 'V');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(5555, 'O');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(6666, 'V');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(7777, 'O');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(8888, 'V');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(9999, 'O');

INSERT INTO Room( roomNumber, occupationFlag)
VALUES(1010, 'V');

INSERT INTO roomType( roomNumber, use)
VALUES(1111, 'ICU');

INSERT INTO roomType( roomNumber, use)
VALUES(1111, 'pool');

INSERT INTO roomType( roomNumber, use)
VALUES(1111, 'therapy');

INSERT INTO roomType( roomNumber, use)
VALUES(2222, 'cafateria');

INSERT INTO roomType( roomNumber, use)
VALUES(2222, 'gym');

INSERT INTO roomType( roomNumber, use)
VALUES(2222, 'auditorium');

INSERT INTO roomType( roomNumber, use)
VALUES(4444, 'ER');

INSERT INTO roomType( roomNumber, use)
VALUES(4444, 'recovery');

INSERT INTO roomType( roomNumber, use)
VALUES(4444, 'ICU');







INSERT INTO EquiptmentType(TID, Model, NumOfUnits, Instructions)
VALUES(11111, 'M1', 3, 'no');

INSERT INTO EquiptmentType(TID, Model, NumOfUnits, Instructions)
VALUES(22222, 'M2', 3, 'yey');

INSERT INTO EquiptmentType(TID, Model, NumOfUnits, Instructions)
VALUES(33333, 'M1', 4, 'safe');






INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('111111', 2000, TO_DATE('012211', 'MMDDYY'), 1111, 11111);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('222222',  2001, TO_DATE('012212', 'MMDDYY'), 2222, 11111);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('333333', 2003, TO_DATE('012213', 'MMDDYY'), 3333, 11111);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('444444', 2004, TO_DATE('012214', 'MMDDYY'), 4444, 22222);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('555555', 2005, TO_DATE('012215', 'MMDDYY'), 5555, 22222);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('666666', 2006, TO_DATE('012216', 'MMDDYY'), 6666, 22222);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('777777', 2007, TO_DATE('012217', 'MMDDYY'), 7777, 33333);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('A01-02X', 2011, TO_DATE('012218', 'MMDDYY'), 8888, 33333);

INSERT INTO EquiptmentUnit(serialNumber, YearOfPurchase, LatestInspection, RoomNumber, TID)
VALUES('999999', 2010, TO_DATE('012219', 'MMDDYY'), 9999, 33333);








INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(1, 2234, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 18543, '111111111');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(3, 23452, to_timestamp('21/02/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/02/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('082717', 'MMDDYY'), 18543, '111-22-3333');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(2, 3432, to_timestamp('21/04/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/04/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('092417', 'MMDDYY'), 37452, '111-22-3333');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(5, 3455, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112317', 'MMDDYY'), 94586, '222222222');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(4, 3455, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '222222222');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(6,3454, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112717', 'MMDDYY'), 94586, '333333333');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(7,3555, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112817', 'MMDDYY'), 94586, '333333333');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(8,3453, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '333333333');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(9,4509, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '444444444');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(10,3410, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '444444444');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(11,4511, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112817', 'MMDDYY'), 94586, '444444444');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(12,3512, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(13,3413, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112717', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(14,5514, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112217', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(15,3414, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112917', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(16,3414, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112917', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(17,4514, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112917', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(18,4514, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112917', 'MMDDYY'), 94586, '555555555');

INSERT INTO Admission(admissionID, totalInsurance, startTime, leaveTime, futureVisitDate, totalPayment, SSN)
VALUES(19,3414, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), TO_DATE('112917', 'MMDDYY'), 94586, '555555555');









INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(10, NULL, 'Jack', 'Hogan', 'general manager', 1, 'overLord', 99999,2);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary,employeeRank)
VALUES(2, NULL, 'Harry', 'Potter', 'general manager', 2, 'overLord', 99999,2);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(3, 10, 'Roger', 'Rabbit', 'manager', 3, 'underLord', 1,1);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(4, 10, 'Ranger', 'Rick' , 'manager', 4, 'underLord', 1,1);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(5, 2, 'Spottie', 'Ottie', 'manager', 3, 'underLord', 1,1);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(6, 2, 'Dopa', 'Licious' , 'manager', 3, 'underLord', 1,1);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(7, 3, 'Ida', 'Brunnin','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(8, 3, 'Uma', 'Ther','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(9, 4, 'Howya', 'Doin','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(100, 4, 'Wacha', 'Back','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(11, 5, 'Ima', 'Sleep','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(12, 5, 'Hearta', 'Tack','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(13, 6, 'Mike', 'Hunt','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(14, 6, 'Chrisp', 'Ybacon','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(15, 3, 'Roger', 'Rabbit','regular', 3, 'pleb', 1,0);

INSERT INTO Employee(eID, mID, fName, lName, eType, officeNumber, title, salary, employeeRank)
VALUES(16, 4, 'Roger', 'Rabbit','regular', 3, 'pleb', 1,0);





INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (10, 1111);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (10, 2222);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (10, 3333);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (10, 4444);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (2, 1111);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (2, 2222);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (3, 5555);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (3, 6666);
INSERT INTO haveAccessTo (eID, roomNumber)
VALUES (4, 4444);





INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 12);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 13);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 14);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 15);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 16);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 17);

INSERT INTO RoomVisit(roomNumber, enterTime, leaveTime, admissionID)
VALUES(4444, to_timestamp('21/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'),  to_timestamp('22/01/2017 12:34:56.78','DD/MM/YYYY HH24:MI:SS.FF'), 18);




INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 1, 'comment-1.1');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 2, 'comment-1.2');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 3, 'comment-1.3');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 4, 'comment-1.4');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 5, 'comment-1.5');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 6, 'comment-1.6');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 7, 'comment-1.7');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 8, 'comment-1.8');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 9, 'comment-1.9');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 10, 'comment-1.10');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(111, 11, 'comment-1.11');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 1, 'comment-2.1');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 2, 'comment-2.2');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 3, 'comment-2.3');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 4, 'comment-2.4');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 5, 'comment-2.5');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 6, 'comment-2.6');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 7, 'comment-2.7');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 8, 'comment-2.8');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 9, 'comment-2.7');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 10, 'comment-2.8');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 11, 'comment-2.7');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(777, 12, 'comment-2.8');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 1, 'comment-2.1');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 2, 'comment-2.2');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 3, 'comment-2.3');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 4, 'comment-2.4');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 5, 'comment-2.5');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 6, 'comment-2.6');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 7, 'comment-2.7');
INSERT INTO seePatientsWhoAre(dID, admissionID, DoctorComments)
VALUES(666, 13, 'This guy aint doing good');



CREATE VIEW CriticalCases AS
SELECT B.SSN, B.fName, B.lName, A.ICUVisits
FROM(SELECT SSN, COUNT(roomNumber) AS ICUVisits
    FROM(SELECT D.SSN, C.roomNumber
        FROM roomType A, Admission B, RoomVisit C, Patient D, Room E
        WHERE A.use = 'ICU'
        AND A.roomNumber = C.roomNumber
        AND C.admissionID = B.admissionID
        AND B.SSN = D.SSN)
    GROUP BY SSN) A, 
    Patient B
WHERE A.SSN = B.SSN
AND ICUVisits > 1
;

CREATE VIEW DoctorsLoad AS
SELECT A.dID, B.Gender, 'Overloaded' AS load
FROM(
    SELECT dID, count(admissionID) AS load
    FROM seePatientsWhoAre
    GROUP BY dID) A,
    Doctor B
WHERE load > 10
AND A.dID = B.dID
UNION
SELECT A.dID, B.Gender, 'UnderLoaded' AS load
FROM(
    SELECT dID, count(admissionID) AS load
    FROM seePatientsWhoAre
    GROUP BY dID) A,
    Doctor B
WHERE load <= 10
AND A.dID = B.dID
;

SELECT SSN, fName, lName
FROM CriticalCases
WHERE ICUVisits > 4
;

SELECT Doctor.dID, fName, lName
FROM DoctorsLoad
LEFT JOIN Doctor
ON Doctor.dID = DoctorsLoad.dID
WHERE DoctorsLoad.Gender = 'Female'
AND DoctorsLoad.load = 'Overloaded'
;

SELECT A.dID, D.SSN, C.DoctorComments
FROM DoctorsLoad A, CriticalCases B, seePatientsWhoAre C, Admission D
WHERE A.load = 'UnderLoaded'
AND A.dID = C.dID
AND C.admissionID = D.admissionID
AND D.SSN = B.SSN
;



CREATE OR REPLACE Trigger CheckComment
    BEFORE INSERT ON seePatientsWhoAre
    FOR EACH ROW
    DECLARE
        CNT varchar2(20);
    BEGIN
        SELECT count(*) INTO CNT
        FROM roomType,RoomVisit
        WHERE admissionID = :new.admissionID AND roomType.roomNumber = RoomVisit.roomNumber AND roomType.use = 'ICU';
            IF CNT !=0 then
                IF :new.DoctorComments IS NULL then
                RAISE_APPLICATION_ERROR(-20004, 'Doctor must leave a comment');
                END IF;
            END IF;
    END;
/
Show errors;

                                                                                                                                                                                                                                                                                                                            


CREATE OR REPLACE Trigger CalculateInsurance
    BEFORE INSERT or UPDATE ON Admission
    FOR EACH ROW
    BEGIN
        :new.totalInsurance := :new.totalPayment*0.65;
    END;
/

CREATE OR REPLACE Trigger CheckFutureDate
    AFTER UPDATE ON RoomVisit
    FOR EACH ROW
    DECLARE
    CURSOR C IS SELECT admissionID
                FROM RoomVisit
                WHERE roomNumber
                IN (SELECT roomNumber
                    FROM roomType
                    WHERE use = 'ER');
    VistDate TIMESTAMP;
    BEGIN
        SELECT enterTime INTO VistDate FROM RoomVisit WHERE admissionID = :new.admissionID;
        For rec in C Loop
        UPDATE Admission set futureVisitDate = add_months(futureVisitDate, 2);
        End loop;
    END;
/


CREATE OR REPLACE Trigger CheckManager
    BEFORE INSERT or UPDATE on Employee
    FOR EACH ROW
    WHEN (new.employeeRank =0)
    DECLARE managerRank number;
    BEGIN
    SELECT employeeRank INTO managerRank FROM Employee WHERE eID =:new.mID;
        IF(managerRank != 1)then
            RAISE_APPLICATION_ERROR(-20004, 'Employee rank 0 must have a supervisor who is rank 1');
        END IF;
    END;

/
Show errors;


CREATE OR REPLACE Trigger CheckManager2
    BEFORE INSERT or UPDATE on Employee
    FOR EACH ROW
    WHEN (new.employeeRank =1)
    DECLARE managerRank number;
    BEGIN
    SELECT employeeRank INTO managerRank FROM Employee WHERE eID =:new.mID;
        IF(managerRank != 2)then
            RAISE_APPLICATION_ERROR(-20004, 'Employee rank 1 must have a supervisor who is rank 2');
        END IF;
    END;

/
Show errors;

CREATE OR REPLACE Trigger CheckManager3
    BEFORE INSERT or UPDATE on Employee
    FOR EACH ROW
    WHEN (new.employeeRank =2)
    DECLARE managerRank number;
    BEGIN
    SELECT employeeRank INTO managerRank FROM Employee WHERE eID =:new.mID;
        IF(managerRank is not NULL)then
            RAISE_APPLICATION_ERROR(-20004, 'Employee rank 2 must not have a manager');
        END IF;
    END;

/
Show errors;



CREATE OR REPLACE Trigger PrintInfo
    AFTER UPDATE OF leaveTime ON Admission
    FOR EACH ROW
    DECLARE
        CURSOR C1 IS SELECT dID, DoctorComments FROM seePatientsWhoAre WHERE seePatientsWhoAre.admissionID =:new.admissionID;
        PFName VARCHAR2(15 CHAR);
        PLname VARCHAR2(15 CHAR);
        Paddress VarCHAR(60 CHAR);
        DFName VARCHAR2(15 CHAR);
        DLName VARCHAR2(15 CHAR);
        docComments VARCHAR2(40 CHAR);
    BEGIN
    IF :new.leaveTime is not NULL then
        SELECT fName, lName, address 
        INTO PFName, PLname, Paddress
        FROM Patient, Admission
        WHERE Patient.SSN = Admission.SSN;
        dbms_output.put_line("Patient Name: "||PFName ||PLname);
        dbms_output.put_line("Patient address: "||Paddress);
        FOR REC IN C1 Loop
            SELECT FName, LName
            INTO DFName, DLName
            FROM Doctor
            WHERE Doctor.dID = REC.dID;
            dbms_output.put_line("Doctor Name: "||DFName ||DLName);
            dbms_output.put_line("Doctor Comments: "||rec.DoctorComments);
        END Loop;
    END IF;
END;
/




