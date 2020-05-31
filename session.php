<?php
include_once 'db_connection.php';

session_start();// Starting Session
// Storing Session
$user_check = $_SESSION['login_user'];

// SQL Query To Fetch Complete Information Of User
if ($result = $connection -> query("select * from users where name='$user_check'")) {
    $row = $result->fetch_assoc();
    $login_session =$row['name'];
    $result -> free_result();
}

if(!isset($login_session)){
    $connection->close(); // Closing Connection
    header('Location: index.php'); // Redirecting To Home Page
}
