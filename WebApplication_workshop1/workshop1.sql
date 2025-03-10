CREATE DATABASE prj301_1820_workshop1
GO

USE prj301_1820_workshop1
GO

CREATE TABLE tblUsers (
    Username varchar(50) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Password varchar(255) NOT NULL,
    Role varchar(20) NOT NULL CHECK (Role IN ('Founder', 'Team Member'))
);
GO

INSERT INTO tblUsers (Username, Name, Password, Role) VALUES
('AnNV', 'Nguyen Van An', '123', 'Founder'),
('HanhPT', 'Pham Thi Hanh', '123', 'Founder'),
('HuyLQ', 'Le Quang Huy', '123', 'Founder'),
('LanVT', 'Vo Thi Lan', '123', 'Team Member'),
('MaiTT', 'Tran Thi Mai', '123', 'Team Member'),
('NamDH', 'Do Hai Nam', '123', 'Team Member'),
('PhongPT', 'Phan Thanh Phong', '123', 'Team Member'),
('ThanhBV', 'Bui Van Thanh', '123', 'Team Member'),
('TrangDT', 'Dang Thu Trang', '123', 'Team Member'),
('TuanHM', 'Hoang Minh Tuan', '123', 'Team Member'
);
GO

CREATE TABLE tblStartupProjects (
    project_id int PRIMARY KEY,
    project_name varchar(100) NOT NULL,
    Description text,
    Status varchar(20) NOT NULL CHECK (Status IN ('Ideation', 'Development', 'Launch', 'Scaling')),
	estimated_launch date NOT NULL
);
GO

INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimated_launch) VALUES
(1, 'Project A', '', 'Ideation', '2025-06-15'),
(2, 'Project B', '', 'Development', '2025-07-20'),
(3, 'Project C', '', 'Launch', '2025-08-30'),
(4, 'Project D', '', 'Scaling', '2025-10-10');
GO