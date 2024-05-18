<?php
session_start();
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

$title = "Edit User";
include "includes/header.php";
include "includes/db.php";

$userUpdated = false;

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    $stmt = $pdo->prepare("SELECT * FROM Users WHERE user_id = ?");
    $stmt->execute([$user_id]);
    $user = $stmt->fetch();

    if (!$user) {
        echo "User not found!";
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $username = $_POST['username'];
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $email = $_POST['email'];
        $is_admin = isset($_POST['is_admin']) ? 1 : 0;

        if (!empty($_POST['password'])) {
            $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("UPDATE Users SET user_name = ?, first_name = ?, last_name = ?, email = ?, password = ?, is_admin = ? WHERE user_id = ?");
            $stmt->execute([$username, $first_name, $last_name, $email, $password, $is_admin, $user_id]);
        } else {
            $stmt = $pdo->prepare("UPDATE Users SET user_name = ?, first_name = ?, last_name = ?, email = ?, is_admin = ? WHERE user_id = ?");
            $stmt->execute([$username, $first_name, $last_name, $email, $is_admin, $user_id]);
        }
        $userUpdated = true;
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

<h2 class="h2-center">Edit User</h2>
<main class="main-content">
    <p>You are currently logged in as: <?php echo $_SESSION['username']; ?></p>
    <?php if ($userUpdated): ?>
        <p class="success-message">Changes successfully made!</p>
    <?php endif; ?>

    <div class="register-container">
        <form action="editUser.php?id=<?php echo $user_id; ?>" method="post">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" id="username" name="username" value="<?php echo htmlspecialchars($user['user_name']); ?>" required>
            </div>
            <div class="form-group">
                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" name="first_name" value="<?php echo htmlspecialchars($user['first_name']); ?>" required>
            </div>
            <div class="form-group">
                <label for="last_name">Last Name:</label>
                <input type="text" id="last_name" name="last_name" value="<?php echo htmlspecialchars($user['last_name']); ?>" required>
            </div>
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($user['email']); ?>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Leave blank to keep current password">
            </div>
            <div class="form-group">
                <label for="is_admin">Is Admin:</label>
                <input type="checkbox" id="is_admin" name="is_admin" <?php if ($user['is_admin']) echo 'checked'; ?>>
            </div>
            <button type="submit" class="register-button">Submit</button>
        </form>
    </div>
</main>

<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
