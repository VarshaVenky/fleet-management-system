<?php
// Database configuration
$host = 'localhost';        // Database host
$dbname = 'fleet_management'; // Database name
$username = 'your_username';  // Database username
$password = 'your_password';  // Database password

// Create a connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
