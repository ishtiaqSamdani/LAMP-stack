<?php
$servername = "db"; // service name from docker-compose.yml
$username = "root";
$password = "password";
$dbname = "db";

// Wait for the MySQL service to become available
for ($i = 0; $i < 30; $i++) {
    $conn = new mysqli($servername, $username, $password, $dbname);
    if (!$conn->connect_error) {
        break;
    }
    sleep(1);
}

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else{
    echo "Connected successfully";
}
// Rest of your code
$conn->close();
?>
