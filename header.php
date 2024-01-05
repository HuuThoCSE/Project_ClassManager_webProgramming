<?php

// Bắt đầu phiên làm việc
session_start();

echo $_SESSION['user_id'] . "</br>" . $_SESSION['codeStudent'] . "</br>" . $_SESSION['fullname'];

?>