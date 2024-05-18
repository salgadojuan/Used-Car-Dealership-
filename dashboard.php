

    <?php
    session_start();
    if (!isset($_SESSION['username'])) {
        header('Location: login.php');
        exit();
    }

    $title = "Dashboard";
    include "includes/header.php";
    ?>



<nav class="side-navigation">
    <ul>
        <li><a href="index.php">Logout</a></li>
        <li><a href="manageUsers.php">Manage Users</a></li> <!-- Added register link -->
        <li><a href="manageVehicles.php">Manage Vehicles</a></li>
        <li><a href="manageInventory.php">Manage Inventory</a></li> <!-- Added register link -->
    </ul>
</nav>



<h2 class="h2-center">Welcome</h2>
<main class="main-content">
    <p>You are currently logged in as: <?php echo $_SESSION['username']; ?></p>
</main>

<main class="main-content">
    <img src="images/dashboard.png" alt="Car Inventory" class="centered-image"> 
</main>



<hr class="footer-divider">
<?php require "includes/footer.php"; ?>
