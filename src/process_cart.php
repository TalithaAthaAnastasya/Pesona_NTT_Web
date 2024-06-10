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
    $input = json_decode(file_get_contents('php://input'), true);

    $id_oleh_oleh = $input['id_oleh_oleh'];

    $stmt = $pdo->prepare("INSERT INTO cart (id_pengguna, id_oleh_oleh) VALUES (:id_pengguna, :id_oleh_oleh)");
    $stmt->bindParam(':id_pengguna', $id_pengguna);
    $stmt->bindParam(':id_oleh_oleh', $id_oleh_oleh);

    try {
        $stmt->execute();
        echo json_encode(['success' => true]);
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Failed to save data to the database: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
}
?>
