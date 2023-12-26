<?php
    include 'config/db.php';

    // Thực hiện truy vấn
    $sql = "SELECT * FROM Students";
    $result = $conn->query($sql);

    // Xử lý kết quả
    while ($row = $result->fetch_assoc()) {
        echo $row['idStudent'] . " - " . $row['codeStudent'] . " - " . $row['fullnameStudent'] . "<br>";
    }

    // Đóng kết nối
    $conn = null;
?>