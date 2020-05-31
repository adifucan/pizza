<?php
include_once 'db_connection.php';
include 'session.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title>Order Pizza</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <h2>Welcome <span class="badge badge-secondary"><?= $login_session ?></span></h2>
        </div>
        <div class="col-sm-4">
            <a class="btn btn-warning" href="logout.php" role="button">Log Out</a>
            <a class="btn btn-success" href="profile.php" role="button">Profile</a>
        </div>
    </div>
    <hr>
    <div class="row">
        <?php
            if (isset($_POST['submit'])) {
                if (empty($_POST['pizza']) || empty($_POST['location'])) {
                    echo 'You did not choice any pizza option or missed location address';
                } else {
                    // Define $username and $password
                    $pizza = $_POST['pizza'];
                    $location = trim($_POST['location']);

                    // Check connection
                    if ($connection->connect_errno) {
                        echo "Failed to connect to MySQL: " . $connection->connect_error;
                        exit();
                    }
                    // To protect MySQL injection for Security purpose
                    $location = filter_var($location);
                    // Insert new order
                    $query = "INSERT INTO orders (location, id_order_product, username) values ";
                    $query_parts = [];
                    foreach ($pizza as $pizza_id) {
                        $query_parts[] = "('" . $location . "', '" . $pizza_id . "', '" . $login_session . "')";
                    }
                    $query .= implode(',', $query_parts);
                    if ($result = $connection -> query($query)) {
                        if ($result) {
                            echo 'Your Order is successfully placed. You can now check your orders.';
                            } else {
                            echo "Error occurred while placing order. Please, try again.";
                        }
                    }
                    $connection -> close();
                }
            }
        ?>
    </div>
</div>
</body>
</html>
