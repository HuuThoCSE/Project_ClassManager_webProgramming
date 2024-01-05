<?php
include 'header.php';

require 'config.php';
if(!isset($_SESSION['user_id'])){
    header('Location: login.php');
    exit;
};

?>

<h1 align="center">QUẢN LÝ LỚP HỌC</h1>
<a href="/listStudent.php">DANH SÁCH LỚP</a> </br>
<a href="/listEvent.php">Sự kiện</a> </br>

<!-- Training Score Form -->
<a href="/trainingScoreForm.php">PHIẾU ĐIỂM RÈN LUYỆN</a> 
