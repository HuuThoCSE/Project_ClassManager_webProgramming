<?php
    // Bắt đầu phiên làm việc
    session_start();

    require 'config.php';
    if(!isset($_SESSION['user_id'])){
        header('Location: login.php');
        exit;
    } else {
        echo $_SESSION['user_id'];
    }
?>

<h1 align="center">QUẢN LÝ LỚP HỌC</h1>
<a href="/listStudent.php">DANH SÁCH LỚP</a> </br>
<a href="/listEvent.php">Sự kiện</a> </br>
<a href="/phieudiemrenluyen.php">PHIẾU ĐIỂM RÈN LUYỆN</a>