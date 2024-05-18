<?php
$title = "Login";
include "includes/header.php";
include "includes/db.php"; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Checks if the user exists in the database
    $stmt = $pdo->prepare('SELECT * FROM users WHERE user_name = :username AND password = :password');
    $stmt->execute(['username' => $username, 'password' => $password]);
    $user = $stmt->fetch();

    if ($user) {
        // User found, start a session and redirect to the dashboard page
        session_start();
        $_SESSION['username'] = $username;
        $_SESSION['is_admin'] = $user['is_admin'];
        header('Location: dashboard.php');
    } else {
        echo "Invalid username or password";
    }
}
?>
<nav class="site-navigation"> 
            <ul>
                <li><a href="index.php">Home</a></li> 
            </ul>
        </nav>
<h2 class="h2-center">Login</h2>
<main class="main-content">
    <div class="login-container">
        <form action="login.php" method="post">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Between 8 and 12 characters">
            </div>
            <button type="submit" class="login-button">Login</button>
        </form>
    </div>
</main>
<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
