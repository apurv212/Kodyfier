create database Doctor;
use Doctor;

create table Doctor(
DoctorID int auto_increment primary key, 
Name varchar(50), 
Specialization varchar(50), 
Experience int
)
select *from Doctor;
create table Patient( 
PatientID int auto_increment primary key, 
Name varchar(50), 
Gender varchar(50), 
Age int
)

select *from Patient;

create table Appointment (
  AppointmentID int AUTO_INCREMENT PRIMARY KEY,
  PatientID int,
  DoctorID int,
  AppointmentDate date,
  foreign key (PatientID) references  Patient(PatientID),
  foreign key (DoctorID) references Doctor(DoctorID)
);
select *from Appointment;

INSERT into Doctor (Name, Specialization,Experience) VALUES
('dr.apurv', 'cardiologist', 3),
('dr.yukit', 'Dermatologist', 6),
('dr.vinod', 'oncologist', 11),
('dr.harshit', 'gyanologist', 1);


insert into Patient (Name, Gender, Age) VALUES
('mrinal', 'male', 30),
('mayank', 'male', 45),
('janvi', 'female', 22),
('prishi', 'female', 23),
('neha', 'female', 24);



insert into Appointment (PatientID, DoctorID, AppointmentDate) VALUES
(1, 1, '2025-06-01'),
(2, 3, '2025-06-02'),
(3, 2, '2025-06-03'),
(4, 2, '2025-06-04');

-------------------------3.CRUD--------------------------------------------------------

-- Show all patients' names and their ages.
select Name,Age from Patient;

-- Q8 Find all appointments with 'Dr. Sharma'.


-- Update the age of patient 'Neha' to 61.
update Patient set Age = 61 where Name = 'neha';
select *from Patient;


-- Delete the appointment with `AppointmentID = 2`.
delete from Appointment where AppointmentID = 2;
select *from Appointment;

-- Add a new patient named 'Aman', Male, Age 28.
insert into Patient (Name, Gender, Age) VALUES ('Aman', 'Male', 28);
select *from Patient;




---------------------------4.Aggregate--------------------------------------------------