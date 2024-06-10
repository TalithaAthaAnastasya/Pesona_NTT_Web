<?php
session_start();

$host = 'localhost';
$dbname = 'web_katalog';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}


if (!isset($_SESSION['username'])) {
    echo json_encode(['success' => false, 'message' => 'User is not logged in.']);
    exit;
}


$username = $_SESSION['username'];
$stmt = $pdo->prepare("SELECT id_pengguna FROM pengguna WHERE username = :username");
$stmt->bindParam(':username', $username);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo json_encode(['success' => false, 'message' => 'User not found.']);
    exit;
}

$id_pengguna = $user['id_pengguna'];


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_cart = $_POST['id_cart'];

    $stmt = $pdo->prepare("DELETE FROM cart WHERE id_cart = :id_cart AND id_pengguna = :id_pengguna");
    $stmt->bindParam(':id_cart', $id_cart);
    $stmt->bindParam(':id_pengguna', $id_pengguna);

    try {
        $stmt->execute();

        echo json_encode(['success' => true]);
        header("Location: akun.php");
        exit();
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Failed to delete data from the database: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
}
?>
