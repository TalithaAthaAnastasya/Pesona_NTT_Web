<?php
require_once 'koneksi.php';


session_start();

$username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
$password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);

if (empty($username) || empty($password)) {
    $_SESSION['error_message'] = "Username dan password harus diisi!";
    header("Location: login.php");
    exit();
}

try {
    $sql = "SELECT * FROM pengguna WHERE username = :username";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['role'] = $user['role'];
            if ($user['role'] == 1) {
                header("Location: admin_dashboard.php"); 
            } else {
                header("Location: akun.php"); 
            }
            exit(); 
        } else {
           
            $_SESSION['error_message'] = "password salah!";
            header("Location: login.php");
            exit();
        }
    } else {
      
        $_SESSION['error_message'] = "Username tidak ditemukan";
        header("Location: login.php");
        exit();
    }
} catch (PDOException $e) {

    die("Error: " . $e->getMessage());
}
?>