CREATE DATABASE PostGradOffice;
go
use PostGradOffice;
CREATE TABLE PostGradUser(
id int primary key identity(1,1),
email varchar(50) not null,
password varchar(30) not null
)
CREATE TABLE Admin(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade
)
CREATE TABLE GucianStudent(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2) default 0,
undergradID int
)
CREATE TABLE NonGucianStudent(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2) default 0,
)
CREATE TABLE GUCStudentPhoneNumber(
id int primary key foreign key references GucianStudent on delete cascade
on update cascade,
phone int
)
CREATE TABLE NonGUCStudentPhoneNumber(
id int primary key foreign key references NonGucianStudent on delete
cascade on update cascade,
phone int
)
CREATE TABLE Course(
id int primary key identity(1,1),
fees int,
creditHours int,
code varchar(10)
)
CREATE TABLE Supervisor(
id int primary key foreign key references PostGradUser,
name varchar(20),
faculty varchar(30)
);
CREATE TABLE Examiner(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
name varchar(20),
fieldOfWork varchar(100),
isNational BIT
)
CREATE TABLE Payment(
id int primary key identity(1,1),
amount decimal(7,2),
noOfInstallments int,
fundPercentage decimal(4,2)
)
CREATE TABLE Thesis(
serialNumber int primary key identity(1,1),
field varchar(20),
type varchar(20) not null,
title varchar(100) not null,
startDate date not null,
endDate date,
defenseDate date,
years as (year(endDate)-year(startDate)),
grade decimal(4,2),
payment_id int foreign key references payment on delete cascade on update
cascade,
noOfExtensions int
)
CREATE TABLE Publication(
id int primary key identity(1,1),
title varchar(100) not null,
dateOfPublication date,
place varchar(100),
accepted BIT,
host varchar(100)
);
Create table Defense (serialNumber int,
date datetime,
location varchar(15),
grade decimal(4,2),
primary key (serialNumber, date),
foreign key (serialNumber) references Thesis on delete cascade on update
cascade)
Create table GUCianProgressReport (
sid int foreign key references GUCianStudent on delete cascade on update
cascade
, no int 
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade
on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )
Create table NonGUCianProgressReport (sid int foreign key references
NonGUCianStudent on delete
cascade on update cascade,
no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade
on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )
Create table Installment (date datetime,
paymentId int foreign key references Payment on delete cascade on update
cascade
, amount decimal(8,2)
, done bit
, primary key (date, paymentId))
Create table NonGucianStudentPayForCourse(sid int foreign key references
NonGucianStudent on
delete cascade on update cascade,
paymentNo int foreign key references Payment on delete cascade on update
cascade,
cid int foreign key references Course on delete cascade on update cascade,
primary key (sid, paymentNo, cid))
Create table NonGucianStudentTakeCourse (sid int foreign key references
NonGUCianStudent on delete
cascade on update cascade
, cid int foreign key references Course on delete cascade on update
cascade
, grade decimal (4,2)
, primary key (sid, cid) )
Create table GUCianStudentRegisterThesis (sid int foreign key references
GUCianStudent on delete
cascade on update cascade,
supid int foreign key references Supervisor
, serial_no int foreign key references Thesis on delete cascade on update
cascade
, primary key(sid, supid, serial_no))
Create table NonGUCianStudentRegisterThesis (sid int foreign key
references NonGUCianStudent on
delete cascade on update cascade,
supid int foreign key references Supervisor,
serial_no int foreign key references Thesis on delete cascade on update
cascade ,
primary key (sid, supid, serial_no))
Create table ExaminerEvaluateDefense(date datetime,
serialNo int,
examinerId int foreign key references Examiner on delete cascade on update
cascade,
comment varchar(300),
primary key(date, serialNo, examinerId),
foreign key (serialNo, date) references Defense (serialNumber, date) on
delete cascade on update
cascade)
Create table ThesisHasPublication(serialNo int foreign key references
Thesis on delete cascade on
update cascade,
pubid int foreign key references Publication on delete cascade on update
cascade,
primary key(serialNo,pubid))
go

Set IDENTITY_INSERT PostGradUser ON
insert into PostGradUser (id,email,password) values (1,'anthony@gmail.com','u8nN}B');
insert into PostGradUser (id,email,password) values (2,'ashraf@gmail.com','n6B~/J');
insert into PostGradUser (id,email,password) values (3,'malak@gmail.com','\2Lz$?');
insert into PostGradUser (id,email,password) values (4,'lara@gmail.com','[8]wPV');
insert into PostGradUser (id,email,password) values (5,'Omar@gmail.com','X4,$e{');
	--NonGucianStudent
insert into PostGradUser (id,email,password) values (6,'Mohamed@gmail.com','Y~dU4j');
insert into PostGradUser (id,email,password) values (7,'Fred@gmail.com','q#8XkF');
insert into PostGradUser (id,email,password) values (8,'Nour@gmail.com','kA8+Yc');
insert into PostGradUser (id,email,password) values (9,'Toby@gmail.com','3:XMzP');
insert into PostGradUser (id,email,password) values (10,'Jared@gmail.com',']aE7-,');
	--Admin
insert into PostGradUser (id,email,password) values (11,'Hossam@gmail.com','H5Zb:H');
insert into PostGradUser (id,email,password) values (12,'Slim@gmail.com','rSC4>>');
	--Supervisor
insert into PostGradUser (id,email,password) values (13,'Yara@gmail.com','$7S%y^');
insert into PostGradUser (id,email,password) values (14,'Lobna@gmail.com','}fL37*');
	--Examiner
insert into PostGradUser (id,email,password) values (15,'Mervat@gmail.com','$X8aJc');
insert into PostGradUser (id,email,password) values (16,'Omneya@gmail.com','aY;3S');
Set IDENTITY_INSERT PostGradUser OFF

--GucianStudent insertion
insert into GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)values 
(1,'Anthony','Ibrahim',1,'Business informatics','Heliopolis',1.96,10849);
insert into GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)values 
(2,'Ashraf','Ibrahim',1,'Management','Tagamo3',1.86,10578);
insert into GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)values 
(3,'Malak','Ahmad',1,'Business informatics','Dokki',1.0,10308);
insert into GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)values 
(4,'Lara','Guirguis',1,'Applied arts','Tagamo3',1.1,10608);
insert into GucianStudent (id,firstName,lastName,type,faculty,address,GPA,undergradID)values 
(5,'Omar','Ehab',1,'Business informatics','6th October',2.0,11905);
--GUCStudentPhoneNumber insertion
insert into GUCStudentPhoneNumber values (2,1090433634);
insert into GUCStudentPhoneNumber values (3,1528838134);
insert into GUCStudentPhoneNumber values (4,1158313347);
insert into GUCStudentPhoneNumber values (5,1534169418);
--GUCStudentPhoneNumber display
select * from GUCStudentPhoneNumber;
--NonGucianStudent insertion
insert into NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)values 
(6,'Mohamed','Gamal',0,'Business informatics','6th October',1.4);
insert into NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)values 
(7,'Fred','Thomson',0,'Business informatics','Nasr City',0.98);
insert into NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)values 
(8,'Nour','Ahmad',0,'Business informatics','Tagamo3',3.1);
insert into NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)values 
(9,'Toby','Toby',0,'Business informatics','Tagamo3',2.1);
insert into NonGucianStudent (id,firstName,lastName,type,faculty,address,GPA)values 
(10,'Jared','Rafael',0,'Architecture','Tagamo3',2.6);
-- NonGUCStudentPhoneNumber insertion
insert into NonGUCStudentPhoneNumber values (6,1288418874);
insert into NonGUCStudentPhoneNumber values (7,1212969708);
insert into NonGUCStudentPhoneNumber values (8,1255623096);
insert into NonGUCStudentPhoneNumber values (9,1237767062);
insert into NonGUCStudentPhoneNumber values (10,1033484137);
--NonGUCStudentPhoneNumber display
select * from NonGUCStudentPhoneNumber;

--Admin insertion
insert into Admin (id) values (11);
insert into Admin (id) values (12);

--Supervisor insertion
insert into Supervisor (id,name,faculty) values (13,'Yara','Business informatics');
insert into Supervisor (id,name,faculty) values (14,'Lobna','Architecture');

--Examiner insertion
insert into Examiner (id,name,fieldOfWork,isNational) values (15,'Mervat','Proffessor',1);
insert into Examiner (id,name,fieldOfWork,isNational) values (16,'Omneya','Teacher',0);
--display tables
select * from PostGradUser;
select * from GucianStudent;
select * from NonGucianStudent;
select * from Admin;
select * from Supervisor;
select * from Examiner;
-------------------------------------------------------------------------------------
--Payment and installments insertion
--Thesis Payments and installments
insert into Payment values (500,3,0.4);
insert into Payment values (800,4,0.3);
insert into Payment values (400,2,0.7);
insert into Payment values (1000,3,0.5);
insert into Payment values (300,2,0.2);
insert into Payment values (300,1,0.1);
insert into Payment values (600,3,0.4);
insert into Payment values (1100,4,0.3);
insert into Payment values (3000,4,0.2);
--installments
--P_1
insert into Installment values ('8/11/2019',1,166.66,0);
insert into Installment values ('2020-02-11',1,166.66,0);
insert into Installment values ('2020-08-11',1,166.66,0);
--P_2
insert into Installment values ('8/6/2020',2,200,0);
insert into Installment values ('2021-02-06',2,200,0);
insert into Installment values ('2021-08-06',2,200,0);
insert into Installment values ('2022-02-06',2,200,0);
--P_3
insert into Installment values ('4/12/2021',3,200,1);
insert into Installment values ('2021-10-12',3,200,1);
--P_4
insert into Installment values ('4/4/2018',4,333.33,0);
insert into Installment values ('2018-10-04',4,333.33,0);
insert into Installment values ('2019-04-04',4,333.33,0);
--P_5
insert into Installment values ('8/11/2020',5,150,0);
insert into Installment values ('2021-02-11',5,150,0);
--P_6
insert into Installment values ('5/11/2019',6,300,0);
--P_7
insert into Installment values ('8/4/2015',7,200,1);
insert into Installment values ('2016-02-04',7,200,1);
insert into Installment values ('2016-08-04',7,200,1);
--P_8
insert into Installment values ('11/11/2019',8,275,0);
insert into Installment values ('2020-05-11',8,275,0);
insert into Installment values ('2020-11-11',8,275,0);
insert into Installment values ('2021-05-11',8,275,0);
-- Course payments
insert into Payment values (3000,0,0);
insert into Payment values (2000,0,0.2);
insert into Payment values (5000,0,0.4);
insert into Payment values (2000,0,0.2);
insert into Payment values (2500,0,0.5);
insert into Payment values (5000,2,0.4);
insert into Payment values (6000,4,0.2);
--(delete) DBCC CHECKIDENT ('Payment',Reseed,0); (to reset identity counter);
--display payment & installments
select * from Payment;
select * from Installment;
-------------------------------------------------------------------------------------
--	Thesis (8 Master & 8 PhD)
--	Masters
insert into Thesis (field,type,title,startDate,grade)values ('Biology','Master','Climate change','8/11/2019',1.8);
insert into Thesis (field,type,title,startDate,defenseDate,grade,payment_id) values ('Economics','Master','Equality','7/9/2015','2/9/2016',2.1,1);
insert into Thesis (field,type,title,startDate,endDate,grade,payment_id,noOfExtensions)values('Business','Master','Stocks','8/1/2017','8/2/2020',1.0,2,2);
insert into Thesis (field,type,title,startDate,grade,payment_id) values ('Law','Master','Courts','4/10/2017',2.0,3);
insert into Thesis (field,type,title,startDate,defenseDate,grade,payment_id) values ('Economics','Master','Equilibrium point','7/9/2015','7/3/2015',1.8,4);
insert into Thesis (field,type,title,startDate,defenseDate,grade,payment_id) values ('Technology','Master','Internet of things','10/9/2016','12/12/2017',3.1,5);
insert into Thesis (field,type,title,startDate,grade)values ('Biology','Master','Astrobiology','8/5/2021',1.3);
insert into Thesis (field,type,title,startDate,defenseDate,grade)values ('Biology','Master','CRISPR and Genetic Engineering','9/7/2021','7/8/2021',1.0);
insert into Thesis (field,type,title,startDate,grade)values ('Biology','Master','Fona and Fora','9/7/2021',1.0);
-- Phd
insert into Thesis (field,type,title,startDate,defenseDate,grade,payment_id) values ('Business','PhD','Challenges of Small Enterprises','8/1/2011','9/22/2012',3.0,6);
insert into Thesis (field,type,title,startDate,grade,payment_id) values ('Business','PhD','Regulation of Workplace Diversity','3/1/2013',1.4,7);
insert into Thesis (field,type,title,startDate,grade,payment_id) values ('Business','PhD','Business Leadership','2/1/2017',1.1,8);
insert into Thesis (field,type,title,startDate,grade)values ('Architecture','PhD','Heritage museums','9/7/2020',1.6);
insert into Thesis (field,type,title,startDate,grade)values ('Architecture','PhD','Cinema and theatre architecture','10/4/2018',2.5);
insert into Thesis (field,type,title,startDate,grade)values ('Architecture','PhD','Skyscraper design','10/5/2011',2.3);
insert into Thesis (field,type,title,startDate,grade)values ('Architecture','PhD','Suburban homes for multifamily','1/6/2017',2.1);
insert into Thesis (field,type,title,startDate,grade)values ('Law','PhD','Criminal psychology','11/9/2013',1.9);
--Display thesis table
select * from Thesis;
-- GucianStudent Register Thesis tables
insert into GUCianStudentRegisterThesis values (1,13,1);
insert into GUCianStudentRegisterThesis values (1,13,17);
insert into GUCianStudentRegisterThesis values (2,13,2);
insert into GUCianStudentRegisterThesis values (3,14,3);
insert into GUCianStudentRegisterThesis values (4,14,4);
insert into GUCianStudentRegisterThesis values (5,13,5);
select * from GUCianStudentRegisterThesis;
-- NonGucianStudent Register Thesis tables	
insert into NonGUCianStudentRegisterThesis values (6,14,6);
insert into NonGUCianStudentRegisterThesis values (7,14,7);
insert into NonGUCianStudentRegisterThesis values (8,13,8);
insert into NonGUCianStudentRegisterThesis values (9,14,9);
insert into NonGUCianStudentRegisterThesis values (10,13,10);
select * from NonGUCianStudentRegisterThesis;
--Test(delete)select s.id,th.endDate,th.startDate,t.Sup_id,t.serial_no,th.grade from NonGucianStudent s inner join NonGUCianStudentRegisterThesis t 
--on s.id=t.sid inner join Thesis th on t.serial_no=th.serialNumber;
------------------------------------------------------------------------------------- 
--GUCianProgressReport insertion
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (1,1,'11/11/2019',2,2,1,13);
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (2,1,'12/11/2019',0,2,1,13);
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (3,2,'1/8/2016',1,7,2,13);
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (4,3,'4/6/2019',3,2,3,14);
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (5,4,'6/7/2017',1,6,4,14);
insert into GUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (6,5,'5/2/2015',2,1,5,13);
select * from GUCianProgressReport;
--NonGUCianProgressReport insertion
insert into NonGUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (1,6,'11/11/2017',0,2,6,14);
insert into NonGUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (2,7,'1/8/2021',0,7,7,14);
insert into NonGUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (3,8,'4/6/2021',2,2,8,13);
insert into NonGUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (4,9,'9/12/2021',1,6,9,14);
insert into NonGUCianProgressReport (no,sid,date,eval,state,thesisSerialNumber,supid)values (5,10,'5/2/2012',3,1,10,13);
select * from NonGUCianProgressReport;
------------------------------------------------------------------------------------- 
-- Courses insertion
insert into Course values (3000,6,'CSEN-501');
insert into Course values (2000,4,'CSEN-507');
insert into Course values (5000,8,'CSEN-401');
insert into Course values (2000,4,'BINF-506');
insert into Course values (2500,4,'HROB-203');
--display course table 
select * from Course;
--NonGucianStudentTakeCourse insertion
insert into NonGucianStudentTakeCourse values (6,1,75);
insert into NonGucianStudentTakeCourse (sid,cid)values (7,1);
insert into NonGucianStudentTakeCourse values (8,2,70);
insert into NonGucianStudentTakeCourse values (9,3,75);
insert into NonGucianStudentTakeCourse values (9,4,45);
insert into NonGucianStudentTakeCourse values (9,1,45);
insert into NonGucianStudentTakeCourse values (10,1,90);
insert into NonGucianStudentTakeCourse values (10,3,51);
insert into NonGucianStudentTakeCourse values (10,2,80);
--display NonGucianStudentTakeCourse table
select * from NonGucianStudentTakeCourse;
--NonGucianStudentPayForCourse insertion
insert into NonGucianStudentPayForCourse values(6,9,1);
insert into NonGucianStudentPayForCourse values(8,10,2);
insert into NonGucianStudentPayForCourse values(9,11,3);
insert into NonGucianStudentPayForCourse values(9,12,4);
insert into NonGucianStudentPayForCourse values(10,13,1);
insert into NonGucianStudentPayForCourse values(10,14,3);
insert into NonGucianStudentPayForCourse values(10,15,2);
-- display NonGucianStudentPayForCourse table
select * from NonGucianStudentPayForCourse;
-- Test (delete): select s.first_name,c.code from NonGucianStudent s inner join NonGucianStudentTakeCourse t on 
--s.id=t.sid inner join Course c on t.cid=c.id;
-------------------------------------------------------------------------------------
-- Defenses and examiners insertion
insert into Defense (serialNumber,date,location) values (2,'2/9/2016','H15');
insert into Defense (serialNumber,date,location) values (5,'7/3/2015','H14');
insert into Defense (serialNumber,date,location) values (6,'12/12/2017','H1');
insert into Defense (serialNumber,date,location) values (8,'7/8/2021','H4');
insert into Defense (serialNumber,date,location) values (10,'9/22/2012','H18');
select * from Defense;
-- Examiners attending
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('2/9/2016',2,16);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('7/3/2015',5,15);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('7/3/2015',5,16);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('12/12/2017',6,15);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('12/12/2017',6,16);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('7/8/2021',8,15);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('7/8/2021',8,16);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('9/22/2012',10,15);
insert into ExaminerEvaluateDefense (date,serialNo,examinerId)values('9/22/2012',10,16);
select * from ExaminerEvaluateDefense;
-------------------------------------------------------------------------------------
--Publication insertion
INSERT INTO Publication (title, dateOfPublication, place, accepted, host)
values('Adoption of Data Mining', '2018-5-8','Hilton Hotel', 1,'Cairo International Confrence')
INSERT INTO Publication (title, dateOfPublication, place, accepted, host)
values('Biology and Space', '2016-8-8','Radison Blue Hotel', 0,'Berlin International Confrence')
INSERT INTO Publication (title, dateOfPublication, place, accepted, host)
values('Modern Courts', '2017-6-12','Ritz Hotel', 1,'Riyadh International Confrence')
INSERT INTO Publication (title, dateOfPublication, place, accepted, host)
values('The Path to Equilibrium', '2020-2-4','Hayatt Hotel', 0,'Dubai International Confrence')
INSERT INTO Publication (title, dateOfPublication, place, accepted, host)
values('Portfolio Management','2017-2-12', 'Hilton Hotel', 1,'Cairo International Confrence')
--ThesisHasPublication insertion
INSERT INTO ThesisHasPublication (serialNo, pubid)values(6,1)
INSERT INTO ThesisHasPublication (serialNo, pubid)values(7,2)
INSERT INTO ThesisHasPublication (serialNo, pubid)values(4,3)
INSERT INTO ThesisHasPublication (serialNo, pubid)values(5,4)
INSERT INTO ThesisHasPublication (serialNo, pubid)values(3,5)
select * from ThesisHasPublication
go
create proc getID
@email varchar (20),
@id int output
as
set @id =(select id from PostGradUser where email=@email)
go
create proc studentRegister 
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50), 
@address varchar(50)
as
declare @Post_index int
declare @undergrad_id numeric
set @undergrad_id= CONVERT(NUMERIC(12,0),RAND() * 9999) + 10000 
insert into PostGradUser values (@email,@password)
set @Post_index= Scope_identity();
if @Gucian=1 insert into GucianStudent (id,firstName,lastName,type,faculty,address,undergradID) 
    values (@Post_index,@first_name,@last_name,@Gucian,@faculty,@address,@undergrad_id)
else insert into NonGucianStudent (id,firstName,lastName,type,faculty,address) 
    values (@Post_index,@first_name,@last_name,@Gucian,@faculty,@address)
go
create proc examinerRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@fieldOfWork varchar(100),
@Email varchar(50),
@isNational bit
as
declare @id int
declare @name varchar(50)
insert into PostGradUser(email,password)values(@email,@password)
set @id=SCOPE_IDENTITY()
set @name = CONCAT(@first_name,@last_name)
insert into Examiner(id,name,fieldOfWork,isNational) values
(@id,@name,@fieldOfWork,@isNational)
select * from PostGradUser
go
create proc supervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50)
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
declare @name varchar(50)
set @name = CONCAT(@first_name,@last_name)
insert into Supervisor(id,name,faculty) values(@id,@name,@faculty)
end
go
Create proc userLogin
@email varchar(20),
@password varchar(20),
@success bit output,
@type int output,
@Gucian bit output
as
declare @id int
begin
if exists(
select email,password from PostGradUser where email=@email and password=@password)
begin
set @id=(select id from PostGradUser where email=@email)
set @success =1
if(exists(select id from GucianStudent where id=@id))
set @
-- check user type 0-->Student,1-->Admin,2-->Supervisor ,3-->Examiner
if exists(select id from GucianStudent where id=@id union select id from
NonGucianStudent where id=@id )
set @type=0
if exists(select id from Admin where id=@id)
set @type=1
if exists(select id from Supervisor where id=@id)
set @type=2
if exists(select id from Examiner where id=@id)
set @type=3
end
else
set @success=0
end
go
create proc addMobile
@ID varchar(20),
@mobile_number varchar(20),
@found bit output
as
if(exists(select * from GUCStudentPhoneNumber where id=@id union
(select * from NonGUCStudentPhoneNumber where id=@id))) set @found=1
else set @found=0
begin
if @ID is not null and @mobile_number is not null
begin
--check Gucian student or not
if(exists(select * from GucianStudent where id=@ID))
insert into GUCStudentPhoneNumber values(@ID,@mobile_number)
if(exists(select * from NonGucianStudent where id=@ID))
insert into NonGUCStudentPhoneNumber values(@ID,@mobile_number)
end
end
go
CREATE Proc AdminListSup
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
go
CREATE Proc AdminViewSupervisorProfile
@supId int
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
WHERE @supId = s.id
go
CREATE Proc AdminViewAllTheses
As
Select
serialNumber,field,type,title,startDate,endDate,defenseDate,years,grade,payment_id,noOfExtensions
From Thesis
go
create proc ViewStudentThesis
@sid int
as
if(exists(select * from GUCianStudentRegisterThesis where sid=@sid))
select t.serialNumber,t.field,t.type,t.title,t.startDate,t.endDate,t.defenseDate,
t.grade,t.noOfExtensions from Thesis t inner join GUCianStudentRegisterThesis gt
on t.serialNumber=gt.serial_no where sid=@sid
else
select serialNumber,field,type,title,startDate,endDate,defenseDate,years,
grade,payment_id,noOfExtensions from Thesis inner join NonGUCianStudentRegisterThesis gt
on serialNumber=gt.serial_no where sid=@sid
go
CREATE Proc AdminViewOnGoingTheses
@thesesCount int output
As
Select @thesesCount=Count(*)
From Thesis
where endDate > Convert(Date,CURRENT_TIMESTAMP)
go
CREATE Proc AdminViewStudentThesisBySupervisor
As
Select s.name,t.title,gs.firstName
From Thesis t inner join GUCianStudentRegisterThesis sr on
t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join GucianStudent gs on
sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
union
Select s.name,t.title,gs.firstName
From Thesis t inner join NonGUCianStudentRegisterThesis sr on
t.serialNumber=sr.serial_no
inner join Supervisors on s.id=sr.supid inner join NonGucianStudent gs on
sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
go
go
CREATE Proc AdminListNonGucianCourse
@courseID int
As
if(exists(select * from Course where id=@courseID))
Select ng.firstName,ng.lastName,c.code,n.grade
From NonGucianStudentTakeCourse n inner join Course c on n.cid=c.id inner
join NonGucianStudent ng
on ng.id=n.sid
where n.cid=@courseID
go
CREATE Proc AdminUpdateExtension
@ThesisSerialNo int
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
declare @noOfExtensions int
select @noOfExtensions=noOfExtensions from Thesis where
serialNumber=@ThesisSerialNo
update Thesis
set noOfExtensions=@noOfExtensions+1
where serialNumber=@ThesisSerialNo
end
go
CREATE Proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
insert into Payment(amount,noOfInstallments,fundPercentage)
values(@amount,@noOfInstallments,@fundPercentage)
declare @id int
SELECT @id=SCOPE_IDENTITY()
update Thesis
set payment_id=@id
where serialNumber=@ThesisSerialNo
end
go
CREATE Proc AdminViewStudentProfile
@sid int
As
if(exists(select * from GucianStudent where id=@sid))
Select
u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,
s.address,s.GPA
from PostGradUser u inner join GucianStudent s on u.id=s.id
WHERE @sid = s.id
else if(exists(select * from NonGucianStudent where id=@sid))
Select
u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,
s.address,s.GPA
from PostGradUser u inner join NonGucianStudent s on u.id=s.id
WHERE @sid = s.id
go
CREATE Proc AdminIssueInstallPayment
@paymentID int,
@InstallStartDate date
As
if(exists(select * from Payment where id=@paymentID))
begin
declare @numOfInst int
select @numOfInst=noOfInstallments
from Payment
where id=@paymentID
declare @payAmount int
select @payAmount=amount
from Payment
where id=@paymentID
DECLARE @Counter INT
SET @Counter=1
WHILE (@counter<=@numOfInst)
BEGIN
declare @instdate date
set @instdate=@InstallStartDate
declare @instAmount int
set @instAmount=@payAmount/@numOfInst
if(@counter=1)
insert into
Installment(date,paymentId,amount,done)values(@InstallStartDate,@paymentID
,@instAmount,0)
else
begin
set @instdate=DATEADD(MM, 6, @instdate);
insert into
Installment(date,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
end
SET @counter=@counter+1
END
end
go
CREATE Proc AdminListAcceptPublication
As
select t.serialNumber,p.title
from ThesisHasPublication tp inner join Thesis t on
tp.serialNo=t.serialNumber
inner join Publication p on p.id=tp.pubid
where p.accepted=1
go
CREATE Proc AddCourse
@courseCode varchar(10),
@creditHrs int,
@fees decimal
As
insert into Course values(@fees,@creditHrs,@courseCode)
go
CREATE Proc linkCourseStudent
@courseID int,
@studentID int
As
if(exists(select * from Course ) and exists(select * from NonGucianStudent
where id=@studentID))
insert into
NonGucianStudentTakeCourse(sid,cid,grade)values(@studentID,@courseID,null)
go
CREATE Proc addStudentCourseGrade
@courseID int,
@studentID int,
@grade decimal
As
if(exists(select * from NonGucianStudentTakeCourse where sid=@studentID
and cid=@courseID))
update NonGucianStudentTakeCourse
set grade =@grade
where cid=@courseID and sid=@studentID
go
CREATE Proc ViewExamSupDefense
@defenseDate datetime
As
select s.serial_no,ee.date,e.name,sup.name
from ExaminerEvaluateDefense ee inner join examiner e on
ee.examinerId=e.id
inner join GUCianStudentRegisterThesis s on ee.serialNo=s.serial_no
inner join Supervisor sup on sup.id=s.supid
go
CREATE Proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int
As
if(exists(select * from Thesis where serialNumber=@thesisSerialNo ) and
@evaluation in(0,1,2,3) )
begin
if(exists(select * from GUCianStudentRegisterThesis where
serial_no=@thesisSerialNo and
supid=@supervisorID))
begin
declare @gucSid int
select @gucSid=sid
from GUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update GUCianProgressReport
set eval=@evaluation
where sid=@gucSid and thesisSerialNumber=@thesisSerialNo and
no=@progressReportNo
end
else if(exists(select * from NonGUCianStudentRegisterThesis where
serial_no=@thesisSerialNo and
supid=@supervisorID))
begin
declare @nonGucSid int
select @nonGucSid=sid
from NonGUCianStudentRegisterThesis
where serial_no=@thesisSerialNo
update NonGUCianProgressReport
set eval=@evaluation
where sid=@nonGucSid and thesisSerialNumber=@thesisSerialNo and
no=@progressReportNo
end
end
go
CREATE Proc ViewSupStudentsYears
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select s.firstName,s.lastName,t.years
from GUCianStudentRegisterThesis sr inner join GucianStudent s on
sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
union
select s.firstName,s.lastName,t.years
from NonGUCianStudentRegisterThesis sr inner join NonGucianStudent s on
sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
end
go
CREATE Proc SupViewProfile
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.password,s.name,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
end
go
---------------------------------------
create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
as
update Supervisor
set name = @name, faculty = @faculty
where id = @supervisorID
go
create proc ViewAStudentPublications
@StudentID int
as
select P.*
from GUCianStudentRegisterThesis GUC
inner join Thesis T
on GUC.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where GUC.sid = @StudentID
union all
select P.*
from NonGUCianStudentRegisterThesis NON
inner join Thesis T
on NON.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where NON.sid = @StudentID
go
create proc AddDefenseGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
insert into Defense
values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
go
create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
declare @idOfStudent int
select @idOfStudent = sid
from NonGUCianStudentRegisterThesis
where serial_no = @ThesisSerialNo
if(not exists(select grade
from NonGucianStudentTakeCourse
where sid = @idOfStudent and grade < 50))
begin
insert into Defense
values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
end
go
create proc AddExaminer
@ThesisSerialNo int , @DefenseDate Datetime , @ExaminerName
varchar(20),@Password varchar(30),
@National bit, @fieldOfWork varchar(20)
as
insert into PostGradUser values(@ExaminerName,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
insert into ExaminerEvaluateDefense
values(@DefenseDate,@ThesisSerialNo,@id,null)
go
create proc CancelThesis
@ThesisSerialNo int
as
if(exists(
select *
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
))
begin
declare @gucianEval int
set @gucianEval = (
select top 1 eval
from GUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc
)
if(@gucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
end
end
else
begin
declare @nonGucianEval int
set @nonGucianEval = (
select top 1 eval
from NonGUCianProgressReport
where thesisSerialNumber = @ThesisSerialNo
order by no desc
)
if(@nonGucianEval = 0)
begin
delete from Thesis where serialNumber = @ThesisSerialNo
end
end
go
create proc AddGrade
@ThesisSerialNo int
as
declare @grade decimal(4,2)
select @grade = grade
from Defense
where serialNumber = @ThesisSerialNo
update Thesis
set grade = @grade
where serialNumber = @ThesisSerialNo
go
create proc AddDefenseGrade
@ThesisSerialNo int , @DefenseDate Datetime , @grade decimal(4,2)
as
update Defense
set grade = @grade
where serialNumber = @ThesisSerialNo and date = @DefenseDate
go
create proc AddCommentsGrade
@ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300)
as
update ExaminerEvaluateDefense
set comment = @comments
where serialNo = @ThesisSerialNo and date = @DefenseDate
go
create proc checkType
@id int,
@type int output
as
if(exists(select * from GucianStudent where id=@id)) set @type=1
else set @type=0;
go
create proc viewMyProfile
@studentId int
as
if(exists(select * from GucianStudent where id = @studentId))
begin
select G.firstName,G.lastName,G.type,G.faculty,G.address,G.GPA,G.undergradID
,P.email
from GucianStudent G
inner join PostGradUser P
on G.id = P.id
where G.id = @studentId
end
else
begin
select n.firstName,n.lastName,n.type,n.faculty,n.address,n.GPA,P.email
from NonGucianStudent n
inner join PostGradUser P
on n.id = P.id
where n.id = @studentId
end
go
create proc editMyProfile
@studentID int, @firstName varchar(20), @lastName varchar(20), @password
varchar(30), @email
varchar(50)
, @address varchar(50), @type varchar(3)
as
update GucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type
= @type
where id = @studentID
update NonGucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type
= @type
where id = @studentID
update PostGradUser
set email = @email, password = @password
where id = @studentID
go
create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GucianStudent
set undergradID = @undergradID
where id = @studentID
go
create proc ViewCoursesGrades
@studentID int
as
select c.code as'Course Code',nt.grade as 'Grade',c.creditHours 'Credit Hours' from Course c inner join 
NonGucianStudentTakeCourse nt on c.id=nt.cid where nt.sid=@studentID
go
create proc ViewCoursePaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of
Payment',P.fundPercentage as 'Percentage of
fund for payment', P.noOfInstallments as 'Number of installments',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as
'Installment done or not'
from NonGucianStudentPayForCourse NPC
inner join Payment P
on NPC.paymentNo = P.id and NPC.sid = @studentID
inner join Installment I
on I.paymentId = P.id
go
create proc ViewThesisPaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment',
P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as
'Installment done or not'
from GUCianStudentRegisterThesis G
inner join Thesis T
on G.serial_no = T.serialNumber and G.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
union
select P.id as 'Payment Number',P.amount as 'Amount of Payment',
P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as
'Installment done or not'
from NonGUCianStudentRegisterThesis NG
inner join Thesis T
on NG.serial_no = T.serialNumber and NG.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
go
create proc ViewUpcomingInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date >
CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
go
create proc ViewMissedInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date <
CURRENT_TIMESTAMP and
I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
go
create proc AddProgressReport
@thesisSerialNo int, @progressReportDate date, @studentID
int,@progressReportNo int
as
declare @gucian int
if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
insert into GUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
else
begin
insert into NonGUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
go
create proc FillProgressReport
@thesisSerialNo int, @progressReportNo int, @state int, @description
varchar(200),@studentID int
as
declare @gucian bit
if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
update GUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no =
@progressReportNo
end
else
begin
update NonGUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no =
@progressReportNo
end
go
create proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int,@studentID int
as
select eval
from GUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no =
@progressReportNo
union
select eval
from NonGUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no =
@progressReportNo
go
create proc addPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place
varchar(50), @accepted bit
as
insert into Publication values(@title,@pubDate,@place,@accepted,@host)
go
create proc linkPubThesis
@PubID int, @thesisSerialNo int
as
insert into ThesisHasPublication values(@thesisSerialNo,@PubID)
go
create trigger deleteSupervisor
on Supervisor
instead of delete
as
delete from GUCianProgressReport where supid in (select id from deleted)
delete from NonGUCianProgressReport where supid in (select id from
deleted)
delete from GUCianStudentRegisterThesis where supid in (select id from
deleted)
delete from NonGUCianStudentRegisterThesis where supid in (select id from
deleted)
delete from Supervisor where id in (select id from deleted)
delete from PostGradUser where id in (select id from deleted)