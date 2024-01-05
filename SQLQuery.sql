DROP DATABASE ClassManager;

CREATE DATABASE ClassManager;

USE ClassManager;

create table Classes(
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_code varchar(20),
    class_name varchar(50)
);

CREATE TABLE Accounts(
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(16) NOT NULL,
    `password` VARCHAR(16) NOT NULL
);

CREATE TABLE Terms (
    term_id INT AUTO_INCREMENT PRIMARY KEY,
    term_name VARCHAR(2),
    start_year INT NOT NULL,
    end_year INT NOT NULL
);

CREATE TABLE Departments(
    department_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    department_code VARCHAR(10),
    department_name VARCHAR(100)
);

-- Bảng "Students"
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_code VARCHAR(8) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    birthday DATE,
    gender VARCHAR(10) NOT NULL DEFAULT 'unknown',
    class_id INT NOT NULL,
    term_id INT NOT NULL DEFAULT 1,
    department_id INT DEFAULT 1,
    account_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
    FOREIGN KEY (term_id) REFERENCES Terms(term_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

ALTER TABLE Students
  ADD CONSTRAINT gender_check CHECK (gender IN ('male', 'female', 'other', 'unknown'));

CREATE TABLE Positions (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255) NOT NULL
);


CREATE TABLE ClassPositions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    student_id INT NOT NULL,
    position_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id)
);


CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_code VARCHAR(8) NOT NULL,
    event_name VARCHAR(50) NOT NULL,
    descriptionEvent VARCHAR(100),
    event_date DATE,
    event_type VARCHAR(10)
);

create table EventAttendances(
    idEventAttendance int AUTO_INCREMENT PRIMARY KEY,
    event_id int,
    student_id int,
    statusEventAttendance bit,
	dateEventAttendance date,
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
	UNIQUE (event_id, student_id) -- Thiết lập ràng buộc
);

CREATE TABLE Semesters(
    semester_id int AUTO_INCREMENT PRIMARY KEY,
    semester_code VARCHAR(3),
    semester_name VARCHAR(100)
);

CREATE TABLE StudentErollSemster(
    id int AUTO_INCREMENT PRIMARY KEY,
    semester_id int,
    student_id int,
    status bool NOT NULL DEFAULT 1
);

-- Insert value for table "Term"
INSERT INTO Terms (term_name, start_year, end_year) 
VALUES ('46', 2021, 2025);

-- Tạo bản ghi cho bảng "Classes"
INSERT INTO Classes (class_code, class_name)
VALUES ('1KMT21A', N'ĐH. KHMT 2021'), 
        ('1CTT21A1', N'ĐH CNTT 2021 LỚP 1');

-- Tạo bản ghi cho bảng "Classes"
INSERT INTO Departments (department_code, department_name)
VALUES ('CNTT', 'Công nghệ thông tin');

-- Tạo bản ghi cho bảng "Students"
INSERT INTO Students (student_code, full_name, birthday, gender, class_id, term_id)
VALUES
    ('21022001', N'Châu Mai Tuấn Lâm', '2003-01-01', 'male', 1, 1),
    ('21022002', N'Âu Thị Anh Thư', '2003-01-01', 'female', 1, 1),
    ('21022003', N'Nguyễn Võ Nhật Tân', '2003-01-01', 'male', 1, 1),
    ('21022004', N'Phan Nguyễn Đình Trí', '2003-01-01', 'male', 1, 1),
    ('21022006', N'Tăng Huỳnh Thanh Phú', '2003-01-01', 'male', 1 , 1), 
    ('21022007', N'Nguyễn Văn Huyên', '2003-01-01', 'male', 1, 1),
    ('21022008', N'Nguyễn Hữu Thọ', '2003-05-26', 'male', 1, 1),
    ('21022009', N'Trương Phát Thành', '2003-01-01','male', 1, 1),
    ('21022010', N'Lê Nguyễn Quang Bình', '2003-01-01', 'male', 1, 1),
    ('21022011', N'Nguyễn Văn Hoàng', '2003-01-01', 'male', 1, 1),
    ('21022012', N'Trần Khánh Duy', '2003-01-01', 'male', 1, 1),
    ('21022013', N'Phan An Hưng', '2003-01-01', 'male', 1, 1),
    ('21022015', N'Huỳnh Phước Đức', '2003-01-01', 'male', 1, 1),
    ('21022016', N'Lê Hoàng Tâm', '2003-01-01', 'male', 1, 1),
    ('21022017', N'Nguyễn Trọng Huy', '2003-01-01', 'male', 1, 1),
    ('21022018', N'Trần Diễm Quỳnh', '2003-01-01', 'female', 1, 1),
    ('21022019', N'Huỳnh Bảo Thắng', '2003-01-01', 'male', 1, 1),
    ('21022021', N'Nguyễn Thị Bích Ngọc', '2003-01-01', 'female', 1, 1),
    ('21022022', N'Phan Hải Quân', '2003-01-01', 'male', 1, 1),
    ('21022023', N'Lê Anh Khoa', '2003-01-01', 'male', 1, 1),
    ('21022024', N'Lê Võ Khánh Duy', '2003-01-01', 'male', 1, 1),
    ('21022026', N'Trần Huy Hoàng', '2003-01-01', 'male', 1, 1),
    ('21022027', N'Hồ Minh Trí', '2003-01-01', 'male', 1, 1);

INSERT INTO Accounts (username, password)
VALUES 
    ('huuthocse', '123456');

-- UPDATE 
UPDATE Students
SET account_id = 1
WHERE
    student_code = '21022008';

INSERT INTO Positions (position_name)
VALUES 
    ('Lớp trưởng'),
    ('Lớp phó'),
    ('Bí thư'),
    ('Phó bí thư');

INSERT INTO ClassPositions (class_id, student_id, position_id)
VALUES (1, 6, 1);

-- Thêm danh sách sự kiện vào bảng "Events"
INSERT INTO Events (event_code, event_date, event_name, event_type)
VALUES
    ('CCT9', '2023-09-04', N'Chào cờ tháng 9', 'school'),
    ('CCT10', '2023-10-02', N'Chào cờ tháng 10', 'school'),
    ('CCT11', '2023-11-06', N'Chào cờ tháng 11', 'school'),
    ('CCT12', '2023-12-04', N'Chào cờ tháng 12', 'school');

INSERT INTO Semesters(semester_code, semester_name)
    VALUES ('231', 'Học kỳ 1 - 2023, 2024');

DELIMITER //

CREATE PROCEDURE while_loop()
BEGIN

  SET @i = 1;

  WHILE @i <= 23 DO 
    INSERT INTO StudentErollSemster(semester_id, student_id) 
    VALUES (1, @i);

    SET @i = @i + 1;
  END WHILE;

END //

DELIMITER ;

CALL while_loop();

-- Sinh viên không có học trong học kỳ
UPDATE StudentErollSemster
SET status = 0
WHERE semester_id = 1 AND student_id = 7;