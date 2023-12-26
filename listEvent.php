<?php
    include 'config/db.php';

    // Thực hiện truy vấn
    $sql = "SELECT * FROM Events";
    $result = $conn->query($sql);

    // Xử lý kết quả
    while ($row = $result->fetch_assoc()) {
        echo $row['idEvent'] 
        . " - " . $row['codeEvent'] 
        . " - " . $row['nameEvent'] 
        . " - " . $row['descriptionEvent'] 
        . " - " . $row['dateEvent'] 
        . " - " . $row['typeEvent'] . "<br>";
    }

    // Đóng kết nối
    $conn = null;
?>