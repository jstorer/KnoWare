<?php
// Create connection
$con=mysqli_connect();

// Check connection
if (mysqli_connect_errno()) {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
else
{
	$id = getUniqueId();
	$question = $_POST['questionInput'];
	$responseType = $_POST['responseType'];
	$units = $_POST['unitsInput'];
	$min = $_POST['minInput'];
	$max = $_POST['maxInput'];
	$stepSize = $_POST['stepInput'];
	$location = $_POST['zipInput'];
	
	$choiceOneInput = $_POST['choiceOneInput'];
	$choiceTwoInput = $_POST['choiceTwoInput'];
	$choiceThreeInput = $_POST['choiceThreeInput'];
	$choiceFourInput = $_POST['choiceFourInput'];
	$choiceFiveInput = $_POST['choiceFiveInput'];
	$choiceSixInput = $_POST['choiceSixInput'];
	
	$choiceOneHex = $_POST['choiceOneHex'];
	$choiceTwoHex = $_POST['choiceTwoHex'];
	$choiceThreeHex = $_POST['choiceThreeHex'];
	$choiceFourHex = $_POST['choiceFourHex'];
	$choiceFiveHex = $_POST['choiceFiveHex'];
	$choiceSixHex = $_POST['choiceSixHex'];

	$linearHexOne = $_POST['linearHexOne'];
	$linearHexTwo = $_POST['linearHexTwo'];
    	
	$date = date("Y-m-d H:i:s");
	
	if($_POST['privateInput']=='on') {
		$private = true;
	}
	else {
		$private = false;
	}
	
	if($_POST['imageInput']=='on') {
		$imageInput = true;
	}
	else {
		$imageInput = false;
	}
    

	$sql= "INSERT INTO surveys (id, question, response_type, 
		units, response_range_start, response_range_end, 
		response_step, creation_date, image, choice_one, choice_two, choice_three, choice_four, choice_five, choice_six,
		choice_one_hex,choice_two_hex,choice_three_hex,choice_four_hex,choice_five_hex,choice_six_hex,linear_hex_1,linear_hex_2)   
VALUES ('$id', '$question', '$responseType',
	'$units', '$min', '$max',  
	'$stepSize', '$date', 
	'$imageInput',  '$choiceOneInput', '$choiceTwoInput', '$choiceThreeInput', '$choiceFourInput','$choiceFiveInput','$choiceSixInput',
	'$choiceOneHex','$choiceTwoHex','$choiceThreeHex','$choiceFourHex','$choiceFiveHex','$choiceSixHex','$linearHexOne','$linearHexTwo')";

if (!mysqli_query($con,$sql)) {
	echo "error";
	die('Error: ' . mysqli_error($con));
}
echo "\n1 record added";
}

  #Create unique ID
function getUniqueId(){
	$alphaList = array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
	do{
		for($i=0; $i<=6; $i++){
			$num = mt_rand(0,35);
			echo $alphaList[$num];
			if($i==3){
				$key .= "-";
			}
			else{
				$key .= $alphaList[$num];
			}
		}
		$check = "SELECT COUNT(id) FROM surveys WHERE id = '$key'";
	}while(mysqli_query($con,$check)>0);
	return $key;
}
?>


