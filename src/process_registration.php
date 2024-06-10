<?php
require_once 'koneksi.php';

$username = $_POST['reg_username'];
$password = $_POST['reg_password'];

try {
    $sql_check = "SELECT * FROM pengguna WHERE username = :username";
    $stmt_check = $pdo->prepare($sql_check);
    $stmt_check->bindParam(':username', $username);
    $stmt_check->execute();

    if ($stmt_check->rowCount() > 0) {
        $_SESSION['error_message'] = "Username sudah terdaftar!";
        header('Location: register.php');
        exit();
    } else {
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);

        $sql_insert = "INSERT INTO pengguna (username, password) VALUES (:username, :password)";
        $stmt_insert = $pdo->prepare($sql_insert);
        $stmt_insert->bindParam(':username', $username);
        $stmt_insert->bindParam(':password', $hashed_password);
        $stmt_insert->execute();

        header('Location: login.php');
        exit();
    }
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>
