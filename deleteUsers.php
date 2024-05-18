<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

$title = "Delete Users";
include "includes/header.php";
include "includes/db.php";

$userDeleted = false; 
$usernameToDelete = '';

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];

    // Retrieves the username of the user to be deleted
    $stmt = $pdo->prepare("SELECT user_name FROM Users WHERE user_id = ?");
    $stmt->execute([$user_id]);
    $user = $stmt->fetch();
    if ($user) {
        $usernameToDelete = $user['user_name'];
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        if (isset($_POST['confirm']) && $_POST['confirm'] == 'yes') {
            $stmt = $pdo->prepare("DELETE FROM Users WHERE user_id = ?");
            $stmt->execute([$user_id]);
            $userDeleted = true;
        } else {
            header('Location: manageUsers.php');
            exit();
        }
    }
}
?>

<nav class="side-navigation">
    <ul>
        <li><a href="index.php">Logout</a></li>
        <li><a href="manageUsers.php">Manage Users</a></li>
        <li><a href="dashboard.php">Dashboard</a></li>
    </ul>
</nav>

<h2 class="h2-center">Delete User</h2>
<main class="main-content">
    <p>You are currently logged in as: <?php echo $_SESSION['username']; ?></p>
    
    <?php if ($userDeleted): ?>
        <p class="success-message">User deleted successfully!</p>
    <?php else: ?>
        <p>Are you sure you want to permanently delete the user: <?php echo htmlspecialchars($usernameToDelete); ?>?</p>
    
        <form method="post" class="delete-form">
            <button type="submit" name="confirm" value="yes">Yes</button>
            <button type="submit" name="confirm" value="no">No</button>
        </form>
    <?php endif; ?>
</main>

<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
