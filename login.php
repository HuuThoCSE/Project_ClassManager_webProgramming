<?php
    // Bắt đầu phiên làm việc
    session_start();
    
    if(isset($_POST['smLogin'])){
        include 'config/db.php';
        
        // Lấy ID user từ người dùng
        $username = $_POST['username'];
        $password = $_POST['password'];

        // Truy vấn CSDL để lấy ID user
        $sql = "SELECT account_id FROM Accounts WHERE username='$username' AND password='$password'";
        $result = $conn->query($sql);

        // Kiểm tra kết quả truy vấn
        if($result->num_rows > 0){
            // Người dũng đã đăng nhập
            $user_id = $result->fetch_assoc()['account_id'];
            $_SESSION['user_id'] = $user_id;

            $sql = "SELECT * FROM Students WHERE account_id='$user_id'";
            $result = $conn->query($sql);

            if($result->num_rows > 0){
                $_SESSION['codeStudent'] = $result->fetch_assoc()['codeStudent'];
                $_SESSION['fullname'] = $result->fetch_assoc()['fullnameStudent'];
            }

            header('Location: index.php');
            exit;
        } else {
            // Người dùng chưa đăng nhập
            echo 'Người dùng chưa đăng nhập.';
        }
    }
?>

<form action="" method="post">
    <label for="">Username:</label>
    <input type="text" name="username"> </br> </br>
    <label for="">Password:</label>
    <input type="password" name="password"> </br> </br>
    <input type="submit" value="Login" name="smLogin">
</form>