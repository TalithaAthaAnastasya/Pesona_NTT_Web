<?php
session_start();

include('koneksi.php');

try {
    $pdo = new PDO("mysql:host=localhost;dbname=web_katalog", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}

if (isset($_POST['id']) && ctype_alnum($_POST['id'])) {
    $id_oleh_oleh = $_POST['id'];
    $stmt = $pdo->prepare("DELETE FROM oleh_oleh WHERE id_oleh_oleh = :id_oleh_oleh");
    $stmt->bindParam(':id_oleh_oleh', $id_oleh_oleh, PDO::PARAM_STR);

    if ($stmt->execute()) {
        header("Location: admin_dashboard.php");
        exit();
    } else {
        echo "Error: Gagal menghapus data.";
    }

    unset($stmt);
} else {
    echo "Error: ID tidak valid.";
}
?>
