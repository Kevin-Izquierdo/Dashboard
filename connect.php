<?php
 
	$servername='localhost';
	$database='id21261963_business';
	$username='id21261963_business';
	$password="Negocios@2023";

		// Create connection
	$conn = mysqli_connect($servername, $username, $password, $database);
	// Check connection
	if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
	}
	
	
?>