<?php
include "includes/db.php"; // database connection this page tests the connection and will echo "Database connection is successful!"

try {
    $stmt = $pdo->query('SELECT 1');
    if ($stmt) {
        echo "Database connection is successful!";
    }
} catch (\PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
