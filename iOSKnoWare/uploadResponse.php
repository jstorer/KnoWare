<?php
// Create connection
$con=mysqli_connect();

$survey_id = $_POST['id'];
$response = $_POST['response'];
$longitude = $_POST['longitude'];
$latitude = $_POST['latitude'];
$hexcolor = $_POST['hexcolor'];
$response_time = date("Y-m-d H:i:s");
$date = date("Y-m-d H:i:s");
$image = true;

$image_data = $_REQUEST['image'];

$sql1 = mysqli_query($con, "SELECT MAX(id) AS maxId FROM answers WHERE survey_id IN ('$survey_id')");

$row = mysqli_fetch_array($sql1);

$answer_id = ($row['maxId'] + 1);

$target_dir = $_SERVER['DOCUMENT_ROOT'];
$target_dir .= "/KnoWare/uploadFiles/";
$target_file = $target_dir . $survey_id . "_". $answer_id . "_" . "image.jpg";
//$target_file = "/home/jstorer/htdocs/Knoware/Dev/Mobile/uploadFiles/CZ5-DAR_9_image.jpg";
$name = $survey_id . "_". $answer_id . "_" ."image.jpg";

/* 
 * Here comes the image stuff
 */
if (file_exists($target_file)) {
  //echo "File already exists\n";
} else {
  /* Decoding image */
  $binary = base64_decode($image_data);

  /* Opening image */
  $file = fopen($target_file, 'wb');

  if(!$file){
    //echo "file open failed\n";
  }

  /* Writing to server */
  fwrite($file, $binary);

  /* Closing image file */
  fclose($file);
}   

$sql= "INSERT INTO answers (id, survey_id, response, 
 longitude, latitude, response_time, image, hexcolor,image_name,creation_date)   
VALUES ('$answer_id', '$survey_id', '$response', 
 '$longitude','$latitude', '$response_time', '$image', '$hexcolor','$name','$date')";

if (!mysqli_query($con,$sql)) {
	die('Error: ' . mysqli_error($con));
}
echo "Added";	

?>

