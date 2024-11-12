<?php
// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Include database configuration
require_once 'config.php';

/**
 * Function to sanitize user input to prevent SQL injection and XSS attacks
 *
 * @param string $data
 * @return string
 */
function sanitizeInput($data) {
    global $conn;
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return mysqli_real_escape_string($conn, $data);
}

/**
 * Function to handle user login
 *
 * @param string $username
 * @param string $password
 * @return bool
 */
function loginUser($username, $password) {
    global $conn;
    $username = sanitizeInput($username);
    $password = sanitizeInput($password);

    // Query to check user credentials
    $query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $result = $conn->query($query);

    if ($result && $result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role']; // e.g., admin or driver
        return true;
    } else {
        return false;
    }
}

/**
 * Function to check if a user is logged in
 *
 * @return bool
 */
function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

/**
 * Function to check if the logged-in user is an admin
 *
 * @return bool
 */
function isAdmin() {
    return isset($_SESSION['role']) && $_SESSION['role'] === 'admin';
}

/**
 * Function to log out the user
 */
function logoutUser() {
    session_unset();
    session_destroy();
    header("Location: index.php");
    exit();
}

/**
 * Function to redirect users based on their role
 */
function redirectBasedOnRole() {
    if (isAdmin()) {
        header("Location: templates/admin_dashboard.php");
    } else {
        header("Location: templates/driver_dashboard.php");
    }
    exit();
}
