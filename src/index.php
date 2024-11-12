<?php
// Start the session
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fleet Management System</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>

    <!-- Header -->
    <?php include 'includes/header.php'; ?>

    <!-- Main Content -->
    <div class="container">
        <h1>Welcome to the Fleet Management System</h1>
        <p>This system helps manage bus routes, drivers, and schedules efficiently.</p>

        <!-- Navigation Links -->
        <div class="login-options">
            <a href="templates/admin_dashboard.php" class="btn">Admin Login</a>
            <a href="templates/driver_dashboard.php" class="btn">Driver Login</a>
        </div>
    </div>

    <!-- Footer -->
    <?php include 'includes/footer.php'; ?>

</body>
</html>
