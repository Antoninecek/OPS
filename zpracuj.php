<!DOCTYPE HTML><html><head>  <meta charset=utf8>  <title>temperature log</title></head><body>

<?php

error_reporting(E_ALL);
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);

//$user = $_POST['user'];
//$passwd = $_POST['passwd'];
$temperature = @$_POST['temperature'];

//echo $user;
//echo $passwd;
//echo $temperature;

$servername = "localhost";
$username = "temperatureuser";
$password = "temperature";
$dbname = "temperature";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully<br>";
if($temperature != 0){
echo "actual temperature = ".$temperature." <br>";
    $sql = "INSERT INTO records (temperature) VALUES(".$temperature.")";
    $ret = $conn->exec($sql);
//    print_r($ret);
}
	$ret=$conn->prepare("select * from records order by id desc");
	$ret->execute();
	$result = $ret->fetchAll();
	echo "<br>";
	foreach($result as $a){
		echo "id: ";
		echo($a['id']);
		echo " teplota: ";
		echo($a['temperature']);
		echo " datum: ";
		echo($a['date']);
		echo "<br>";
	}
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }

?>

</body>
</html>
