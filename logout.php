<?php
// Bắt đầu phiên làm việc
session_start();

// Xóa dữ liệu trong session
unset($_SESSION['user_id']);

header('Location: login.php');
exit;

?>