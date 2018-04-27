<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include "database.php";
$datingSite = new superhero_dating_site();

$datingSite->connect();

// hent alle superhelte ud!
$superheroesQuery = "SELECT * FROM superheroes";
$superheroesData = $datingSite->query($superheroesQuery);

// array til opbevarig af superhelte profil
$superheroes = [];
foreach ($superheroesData  as $superhero) {
  // hent alle kommentarer på superhelten ud
  $commentsQuery = "SELECT * FROM comments WHERE commented_on = '" .$superhero['email'] ."'";
  $comments = $datingSite->query($commentsQuery);
  $superhero["comments"] = $comments;

  // hent alle superpowers pr. superhelt
  $superPowersQuery = "SELECT * FROM superhero_has_superpowers WHERE email = '" . $superhero['email'] . "'";
  $powers = $datingSite->query($superPowersQuery);
  $superhero["powers"] = $powers;

  //tilføj vor helt til det endelige array af superhelte profiler
  array_push($superheroes, $superhero);
}

?>
<!DOCTYPE html>
<html>
<head>
	<title>Superhero dating site</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<h1 class="headline">Superheroes Lonely Hearts</h1>
<h2 class="sub"> Look here who is new to the site </h2>

<?php foreach($superheroes as $superhero):?>
<div style="float: left">
<h3><?= $superhero["name"]?></h3>
	<ul style="float:left">
		<li>Email: <?= $superhero["email"]?></li>
		<li>Name: <?= $superhero["name"]?></li>
		<li>Gender: <?= $superhero["gender"]?></li>
		<li>Location: <?= $superhero["location"]?></li>
		<li>Liked: <?= $superhero["amount_of_likes"]?> times</li>
	</ul>

	<ul style="float:left">
	<li><b>Powers</b></li>
		<?php foreach($superhero["powers"] as $superpower):?>
			<li>: <?= $superpower["type"] ?></li>
		<?php endforeach; ?>
	<li><b>Comments</b></li>
		<?php foreach($superhero["comments"] as $comment):?>
			<li><?= $comment["comment"] ?></li>
		<?php endforeach; ?>
	</ul>
</div>
<?php endforeach; ?>


</body>
</html>
