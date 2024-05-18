<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

$title = "Manage Users";
include "includes/header.php";
include "includes/db.php";

// Fetch all users from the database
$stmt = $pdo->query("SELECT * FROM Users");
$users = $stmt->fetchAll();
?>

<nav class="side-navigation">
    <ul>
        <li><a href="index.php">Logout</a></li>
        <li><a href="addUser.php">Add User</a></li>
        <li><a href="dashboard.php">Dashboard</a></li>
    </ul>
</nav>

<h2 class="h2-center">Manage Registered Users</h2>
<p class="user-message centered-user-message">You are currently logged in as: <?php echo $_SESSION['username']; ?></p>

<main class="main-content">
    <table class="users-table">
        <tr>
            <th>Edit</th>
            <th>Delete</th>
            <th>Name</th>
            <th>User Name</th>
            <th>Email</th>
            <th>Date Registered</th>
        </tr>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><a href="editUser.php?id=<?php echo $user['user_id']; ?>">Edit</a></td>
                <td><a href="deleteUsers.php?id=<?php echo $user['user_id']; ?>">Delete</a></td>
                <td><?php echo htmlspecialchars($user['first_name'] . " " . $user['last_name']); ?></td>
                <td><?php echo htmlspecialchars($user['user_name']); ?></td>
                <td><?php echo htmlspecialchars($user['email']); ?></td>
                <td><?php echo htmlspecialchars($user['registration_date']); ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</main>

<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
