<?php
	$servername='localhost';
	$database='id17892702_purina';
	$username='id17892702_kevin';
	$password="Kelly060219@";

		// Create connection
	$conn = mysqli_connect($servername, $username, $password, $database);
	// Check connection
	if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
	}
	
	
?>