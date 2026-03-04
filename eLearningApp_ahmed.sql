create database ELearningApp;
use ELearningApp;

create table Role(
roleid int primary key identity,
rolename varchar(100)
)

create table [User](
uid int primary key identity,
uname varchar(100),
email varchar(100) unique,
password varchar(100),
ufieldid int,
IsInstructor Bit not null default 0,
uroleid int,
createdat varchar(100),
    foreign key(uroleid) references Role(roleid),
    foreign key(ufieldid) references Fields(fieldid)
)

create table Fields(
fieldid int primary key identity,
fieldname varchar(200)
)

create table Courses(
courseid int primary key identity,
coursename varchar(100),
description varchar(max),
fieldid int,
uid int,
status varchar(100),
createdat datetime default getdate()
foreign key (fieldid) references Fields(fieldid),
foreign key (uid) references [User](uid)
)


INSERT INTO Role (rolename) VALUES
('Admin'),
('Instructor'),
('Student');

INSERT INTO Fields (fieldname) VALUES
('Computer Science'),
('Information Technology'),
('Mechanical Engineering'),
('Civil Engineering'),
('Electronics'),
('Business Management'),
('Finance'),
('Marketing'),
('Graphic Design'),
('Data Science');


INSERT INTO [User]
(uname, email, password, ufieldid, IsInstructor, uroleid, createdat)
VALUES
('Amit Sharma', 'amit@gmail.com', '123', 1, 1, 3, '2026-03-01'),  -- Instructor
('Riya Khan', 'riya@gmail.com', '123', 2, 0, 2, '2026-03-01'),   -- User
('John Thomas', 'john@gmail.com', '123', 3, 1, 3, '2026-03-01'), -- Instructor
('Sara Ali', 'sara@gmail.com', '123', 4, 0, 2, '2026-03-01'),    -- User
('David Roy', 'david@gmail.com', '123', 5, 1, 3, '2026-03-01'),  -- Instructor
('Neha Patel', 'neha@gmail.com', '123', 6, 0, 2, '2026-03-01'),  -- User
('Imran Shaikh', 'imran@gmail.com', '123', 7, 1, 3, '2026-03-01'), -- Instructor
('Priya Singh', 'priya@gmail.com', '123', 8, 0, 2, '2026-03-01'), -- User
('Rahul Verma', 'rahul@gmail.com', '123', 9, 1, 3, '2026-03-01'), -- Instructor
('Anjali Mehta', 'anjali@gmail.com', '123', 10, 0, 2, '2026-03-01'); -- User


INSERT INTO Courses (coursename, description, fieldid, uid, status)
VALUES

-- 1 Computer Science
('C Programming', 'Basics of C language', 1, 5, 'Approved'),
('ASP.NET WebForms', 'Web development using ASP.NET', 1, 6, 'Pending'),

-- 2 Information Technology
('Networking Fundamentals', 'Computer networks and protocols', 2, 10, 'Approved'),
('Cloud Computing', 'Introduction to AWS and Azure', 2, 9, 'Rejected'),

-- 3 Mechanical Engineering
('Thermodynamics', 'Heat and energy systems', 3, 6, 'Pending'),
('AutoCAD Design', 'Mechanical drawing using AutoCAD', 3, 5, 'Approved'),

-- 4 Civil Engineering
('Structural Analysis', 'Building structure concepts', 4, 14, 'Rejected'),
('Construction Management', 'Project planning and execution', 4, 9, 'Approved'),

-- 5 Electronics
('Digital Electronics', 'Logic gates and circuits', 5, 8, 'Pending'),
('Embedded Systems', 'Microcontroller programming', 5, 5, 'Approved'),

-- 6 Business Management
('Business Strategy', 'Corporate planning methods', 6, 7, 'Approved'),
('Operations Management', 'Managing business operations', 6, 9, 'Rejected'),

-- 7 Finance
('Financial Accounting', 'Accounting principles', 7, 11, 'Approved'),
('Investment Analysis', 'Stock market basics', 7, 11, 'Pending'),

-- 8 Marketing
('Digital Marketing', 'SEO and Social Media', 8, 7, 'Approved'),
('Brand Management', 'Brand building techniques', 8, 9, 'Rejected'),

-- 9 Graphic Design
('Photoshop Basics', 'Image editing fundamentals', 9, 12, 'Pending'),
('UI/UX Design', 'Design principles and tools', 9, 5, 'Approved'),

-- 10 Data Science
('Python for Data Science', 'Python programming for analytics', 10, 13, 'Approved'),
('Machine Learning', 'ML algorithms and projects', 10, 11, 'Pending');


drop TABLE Role;
drop TABLE Courses;
drop TABLE Fields;
drop TABLE [User];

-- Approve Reject Pending by Admin
select c.courseid, c.coursename, c.status,
u.uname, f.fieldname from Courses c
join [User] u on c.uid = u.uid
join Fields f on c.fieldid = f.fieldid
where c.status = 'Approved';


create proc sp_ApproveRejectPedndingCourse
as begin
   select c.courseid, c.coursename, c.status,
u.uname, f.fieldname from Courses c
join [User] u on c.uid = u.uid
join Fields f on c.fieldid = f.fieldid
end

create proc sp_UpdateCourseStatus
    @id int,
    @status varchar(50)
as begin
    update Courses
    set status = @status
    where courseid = @id
end
-- Approve Reject Pending by Admin

-- Manage Users
create proc sp_ManageUsers
as begin
select u.uid, u.uname, u.email, u.IsInstructor,
r.rolename, f.fieldname FROM [User] u
join Role r ON u.uroleid = r.roleid
join Fields f ON u.ufieldid = f.fieldid
end

alter proc sp_DeleteUser
@id int
as 
begin
    delete from Courses where uid = @id
    delete from [User] where uid=@id
     
end

-- Manage Users

--Manage Category
create proc sp_saveFields
@fieldname varchar(200)
as
begin
    insert into Fields(fieldname) values(@fieldname);
end


create proc sp_UpdateFields
@Fid int,
@fieldname varchar(200)
as
begin
    update Fields set fieldname=@fieldname
    where fieldid=@Fid;
end

alter proc sp_deleteFields
@Fid int
as
begin
    delete from Fields where fieldid=@Fid
    delete from Courses where fieldid=@Fid 
end

--Manage Category

select * from [user];
select * from Fields;
select * from Courses;
select * from Role;
    

ALTER TABLE Courses
ADD CONSTRAINT DF_CourseStatus DEFAULT 'Pending' FOR status;

