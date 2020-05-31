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
        <h4>Select pizza to order:</h4>
        <?php
        if ($result = $connection -> query("SELECT id_product, name, price, weight, describe_prod FROM `products`")) {
            if ($result->num_rows === 0) {
                echo "No rows found, nothing to print so am exiting";
            } else {
                ?>
                <form class="form-inline" style="width: 100%" action="place-order.php" method="post">
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
                                <th scope="row"><input class="form-check-input" type="checkbox" value="<?= $row['id_product'] ?>" name="pizza[]"></th>
                                <td><?= $row['name'] ?></td>
                                <td><?= $row['price'] ?></td>
                                <td><?= $row['weight'] ?></td>
                                <td><?= $row['describe_prod'] ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                    <div class="col-sm-10">
                        <input name="location" style="width: 100%" class="form-control input-lg" type="text" placeholder="Enter your location address">
                    </div>
                    <button type="submit" name="submit" class="btn btn-primary my-1">Place Order</button>
                </form>
                <?php
                    $result -> free_result();
            }
        }
        ?>
    </div>
</div>
</body>
</html>
