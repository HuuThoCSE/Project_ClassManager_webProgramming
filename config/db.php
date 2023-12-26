<?php 
    $host = "localhost";
    $username = "root";
    $password = "";
    $dbname = "ClassManager";

    $conn = mysqli_connect($host, $username, $password, $dbname);

    // Tạo kết nối MySQL
    $conn = new mysqli($host, $username, $password, $dbname);

    // Kiểm tra kết nối
    if ($conn->connect_error) {
        die("Kết nối MySQL thất bại: " . $conn->connect_error);
    } else {
        // echo "Connect success. </br>";
    }

?>