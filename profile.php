<?php
include_once 'db_connection.php';
include 'session.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title>Your Home Page</title>
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
            <a class="btn btn-success" href="order.php" role="button">Order Pizza</a>
        </div>
    </div>
    <hr>
    <div class="row">
        <h4>Your last orders:</h4>
        <?php
        // SQL Query To Fetch User Orders Info
        if ($result = $connection -> query("select * from orders inner join products p on orders.id_order_product = p.id_product where username='$login_session'")) {
            if ($result->num_rows === 0) {
                echo "No rows found, nothing to print so am exiting";
            } else {
                $counter = 1;
                ?>
                <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Pizza Name</th>
                    <th scope="col">Weight</th>
                    <th scope="col">Price</th>
                    <th scope="col">Location</th>
                </tr>
                </thead>
                <tbody>
                <?php
                while ($row = $result->fetch_assoc()) {
                    ?>
                    <tr>
                        <th scope="row"><?= $counter ?></th>
                        <td><?= $row['name'] ?></td>
                        <td><?= $row['weight'] ?></td>
                        <td><?= $row['price'] ?></td>
                        <td><?= $row['location'] ?></td>
                    </tr>
                    <?php
                    ++$counter;
                }
                ?>
                </tbody>
                </table>
                <?php
                $result -> free_result();
            }
        }
        ?>
    </div>
</div>
</body>
</html>
