<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $price = $_POST["price"];

    // Handle image upload
    $target_dir = "uploads/";
    if (!is_dir($target_dir)) {
        mkdir($target_dir);
    }

    $file_name = basename($_FILES["image"]["name"]);
    $target_file = $target_dir . $file_name;

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        echo "<h2>Upload Successful!</h2>";
        echo "<p>Product: $name</p>";
        echo "<p>Price: Ksh $price</p>";
        echo "<img src='$target_file' width='200' />";
    } else {
        echo "<h2>Upload failed!</h2>";
    }
} else {
    echo "No data received.";
}
?>
