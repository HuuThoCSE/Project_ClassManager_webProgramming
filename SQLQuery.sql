DROP DATABASE ClassManager;

CREATE DATABASE ClassManager;

USE ClassManager;

create table Classes(
    idClass INT AUTO_INCREMENT PRIMARY KEY,
    codeClass varchar(20),
    nameClass varchar(50)
);


CREATE TABLE Accounts(
    idAccount INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(16) NOT NULL,
    `password` VARCHAR(16) NOT NULL
);

-- Bảng "Students"
CREATE TABLE Students (
    idStudent INT AUTO_INCREMENT PRIMARY KEY,
    codeStudent VARCHAR(8) NOT NULL,
    fullnameStudent VARCHAR(50) NOT NULL,
    idClass INT NOT NULL,
    idAccount INT,
    FOREIGN KEY (idClass) REFERENCES Classes(idClass),
    FOREIGN KEY (idAccount) REFERENCES Accounts(idAccount)
);

CREATE TABLE Events (
    idEvent INT AUTO_INCREMENT PRIMARY KEY,
    codeEvent VARCHAR(8) NOT NULL,
    nameEvent VARCHAR(50) NOT NULL,
    descriptionEvent VARCHAR(100),
    dateEvent DATE,
    typeEvent VARCHAR(10)
);

create table EventAttendances(
    idEventAttendance int AUTO_INCREMENT PRIMARY KEY,
    idEvent int,
    idStudent int,
    statusEventAttendance bit,
	dateEventAttendance date,
    FOREIGN KEY (idEvent) REFERENCES Events(idEvent),
    FOREIGN KEY (idStudent) REFERENCES Students(idStudent),
	UNIQUE (idEvent, idStudent) -- Thiết lập ràng buộc
);

-- Tạo bản ghi cho bảng "Classes"
INSERT INTO Classes (codeClass, nameClass)
VALUES ('1KMT21A', N'ĐH KHMT 2021'), 
        ('1CTT21A1', N'ĐH CNTT 2021 LỚP 1');


-- Tạo bản ghi cho bảng "Students"
INSERT INTO Students (codeStudent, fullnameStudent, idClass)
VALUES
    ('21022002', N'Âu Thị Anh Thư', 1),
    ('21022003', N'Nguyễn Võ Nhật Tân', 1),
    ('21022004', N'Phan Nguyễn Đình Trí', 1),
    ('21022006', N'Tăng Huỳnh Thanh Phú', 1),
    ('21022007', N'Nguyễn Văn Huyên', 1),
    ('21022008', N'Nguyễn Hữu Thọ', 1),
    ('21022009', N'Trương Phát Thành', 1),
    ('21022010', N'Lê Nguyễn Quang Bình', 1),
    ('21022011', N'Nguyễn Văn Hoàng', 1),
    ('21022012', N'Trần Khánh Duy', 1),
    ('21022013', N'Phan An Hưng', 1),
    ('21022015', N'Huỳnh Phước Đức', 1),
    ('21022016', N'Lê Hoàng Tâm', 1),
    ('21022017', N'Nguyễn Trọng Huy', 1),
    ('21022018', N'Trần Diễm Quỳnh', 1),
    ('21022019', N'Huỳnh Bảo Thắng', 1),
    ('21022021', N'Nguyễn Thị Bích Ngọc', 1),
    ('21022022', N'Phan Hải Quân', 1),
    ('21022023', N'Lê Anh Khoa', 1),
    ('21022024', N'Lê Võ Khánh Duy', 1),
    ('21022026', N'Trần Huy Hoàng', 1),
    ('21022027', N'Hồ Minh Trí', 1);

INSERT INTO Accounts (username, password)
VALUES 
    ('huuthocse', '123456');

-- UPDATE 
UPDATE Students
SET idAccount = 1
WHERE
    codeStudent = '21022008';

-- Thêm danh sách sự kiện vào bảng "Events"
INSERT INTO Events (codeEvent, dateEvent, nameEvent, typeEvent)
VALUES
    ('CCT9', '2023-09-04', N'Chào cờ tháng 9', 'school'),
    ('CCT10', '2023-10-02', N'Chào cờ tháng 10', 'school'),
    ('CCT11', '2023-11-06', N'Chào cờ tháng 11', 'school'),
    ('CCT12', '2023-12-04', N'Chào cờ tháng 12', 'school')
