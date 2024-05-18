<?php
include "includes/db.php"; // Include the database connection

try {
    $stmt = $pdo->query('SELECT 1');
    if ($stmt) {
        echo "Database connection is successful!";
    }
} catch (\PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
