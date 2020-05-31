<?php
define('host', 'localhost');
define('user', 'root');
define('password', '123123q');
define('database', 'pizza');

// Establishing Connection with Server by passing server_name, user_id and password as a parameter
$connection = new mysqli(host, user, password, database);
