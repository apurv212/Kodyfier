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
select a.AppointmentID, p.Name as PatientName, a.AppointmentDate
from Appointment a
join Doctor d on a.DoctorID = d.DoctorID
join Patient p on a.PatientID = p.PatientID
where  d.Name='dr.yukit';

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

-- Q12 Count the total number of appointments.
select count(*) as total_appointment from Appointment;


--Q13 Calculate the total revenue generated from all appointment fees.

alter table Appointment add Fee DECIMAL(10, 2);

update Appointment set Fee = 500 WHERE AppointmentID = 1;
update  Appointment set Fee = 700 WHERE AppointmentID = 2;
update  Appointment set Fee = 600 WHERE AppointmentID = 3;
update  Appointment set Fee = 600 WHERE AppointmentID = 4;


select sum(Fee) as totatl_revenue from Appointment;



-- Q14 Find the average fee per appointment.

select avg(Fee) as avergae_fee from Appointment;


-- Q15 Show the number of appointments handled by each doctor.
select d.Name as Doctor_Name , count(*) as total_appointment
from Appointment a
join Doctor d on a.DoctorID = d.doctorID
group by d.DoctorID;


-- Q16 List all doctors who have more than 1 appointment.
select Name , count(*) as appoint_count
from Appointment a
join Doctor d on a.DoctorID = d.doctorID
group by d.DoctorID
having count(*)>1;