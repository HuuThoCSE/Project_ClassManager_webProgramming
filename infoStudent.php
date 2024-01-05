<?php

// Bắt đầu phiên làm việc
session_start();

$studentCode = $_GET['studentCode'];

include 'config/db.php';

// Thực hiện truy vấn
$sql = "SELECT * FROM Students WHERE student_code='$studentCode'";
$result = $conn->query($sql);

// Xử lý kết quả
while ($row = $result->fetch_assoc()) {
    echo "<label><b>Student ID:</b> ". $row['student_id'] ."</label> <br>";
    echo "<label><b>Student Code:</b> ".$studentCode."</label> <br>";
    echo "<label><b>Full name:</b> ".$row['full_name']."</label> <br>";
    echo "<label><b>Birthday:</b> ".$row['birthday']."</label><br>";

    switch ($row['gender']) {
        case 'male':
            $student_gender = "Nam";
            break;
        case 'female':
                $student_gender = "Nữ";
                break;
        case 'other':
            $student_gender = "Khác";
            break;
        default:
            $student_gender = "Không tồn tại";
            break;
    }
    echo "<label><b>Gender:</b> ".$student_gender."</label> <br>";

    // Handle "Class name"
    $class_id = $row['class_id'];
    // Thực hiện truy vấn
    $sql1 = "SELECT * FROM Classes WHERE class_id=$class_id";
    $result1 = $conn->query($sql1);
    $row1 = $result1->fetch_assoc();
    echo "<label><b>Class:</b> ".$row1['class_name']."</label><br>";


    // Handle "Term name"
    $term_id = $row['term_id'];
    $sql1 = "SELECT * FROM Terms WHERE term_id=$term_id";
    $result1 = $conn->query($sql1);
    $row1 = $result1->fetch_assoc();
    echo "<label><b>Term:</b> ".$row1['term_name']."</label> <br>";
}

// Đóng kết nối
$conn = null;

?>
