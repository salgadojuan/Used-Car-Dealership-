<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

$title = "Add User";
include "includes/header.php";
include "includes/db.php"; // Include the database connection

$successMessage = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];

    // Insert the new user into the database
    $stmt = $pdo->prepare('INSERT INTO users (user_name, password, first_name, last_name, email, is_admin) VALUES (:username, :password, :first_name, :last_name, :email, 0)');
    $stmt->execute([
        'username' => $username,
        'password' => $password,
        'first_name' => $first_name,
        'last_name' => $last_name,
        'email' => $email
    ]);

    $successMessage = "User registered successfully!";
}
?>

<nav class="side-navigation">
    <ul>
        <li><a href="index.php">Logout</a></li>
        <li><a href="manageUsers.php">Manage Users</a></li>
        <li><a href="dashboard.php">Dashboard</a></li>
    </ul>
</nav>

<h2 class="h2-center">Add User</h2>
<main class="main-content">
    <p class="logged-in-user">You are currently logged in as: <?php echo $_SESSION['username']; ?></p>
    <?php if (!empty($successMessage)) : ?>
        <p class="success-message"><?php echo $successMessage; ?></p>
    <?php endif; ?>
    <div class="register-container">
        <form action="addUser.php" method="post">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" name="first_name" required>
            </div>
            <div class="form-group">
                <label for="last_name">Last Name:</label>
                <input type="text" id="last_name" name="last_name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit" class="register-button">Register</button>
        </form>
    </div>
</main>
<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
