<?php
session_start();

session_set_cookie_params(0);

function isUserLoggedIn() {
    return isset($_SESSION['user_id']);
}

function redirectToLogin() {
    header("Location: login.php");
    exit();
}
?>
