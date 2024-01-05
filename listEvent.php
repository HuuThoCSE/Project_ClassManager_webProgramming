<?php
    include 'config/db.php';

    // Thực hiện truy vấn
    $sql = "SELECT * FROM Events";
    $result = $conn->query($sql);

    // Xử lý kết quả
    while ($row = $result->fetch_assoc()) {
        echo $row['event_id'] 
        . " - " . $row['event_code'] 
        . " - " . $row['event_name'] 
        . " - " . $row['descriptionEvent'] 
        . " - " . $row['event_date'] 
        . " - " . $row['event_type'] . "<br>";
    }

    // Đóng kết nối
    $conn = null;
?>