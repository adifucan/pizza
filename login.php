<?php
include_once 'db_connection.php';

session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
    if (empty($_POST['username']) || empty($_POST['password'])) {
        $error = "Username or Password is invalid";
    }
    else
    {
        // Define $username and $password
        $username = trim($_POST['username']);
        $password = trim($_POST['password']);

        // Check connection
        if ($connection->connect_errno) {
            echo "Failed to connect to MySQL: " . $connection->connect_error;
            exit();
        }
        // To protect MySQL injection for Security purpose
        $username = filter_var($username);
        $password = filter_var($password);
        // SQL query to fetch information of registered users and finds user match.
        if ($result = $connection -> query("select * from users where pass='$password' AND name='$username'")) {
            if ($result -> num_rows === 1) {
                $_SESSION['login_user']=$username; // Initializing Session
                header("location: profile.php"); // Redirecting To Other Page
            } else {
                $error = "Username or Password is invalid";
            }
            // Free result set
            $result -> free_result();
        }
        $connection -> close();
    }
}
