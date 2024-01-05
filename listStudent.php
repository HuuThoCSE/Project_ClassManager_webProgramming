<?php
    include 'config/db.php';

    // Thực hiện truy vấn
    $sql = "SELECT * FROM Students";
    $result = $conn->query($sql);

    // Xử lý kết quả
    while ($row = $result->fetch_assoc()) {
        echo "<a href='infoStudent.php?studentCode=".$row["student_code"]."' >".$row["full_name"]."</a> </br>";
    }

    // Đóng kết nối
    $conn = null;
?>

