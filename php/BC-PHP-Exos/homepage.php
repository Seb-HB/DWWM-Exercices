<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php  include("global-stylesheets.php") ?>
    <title>Accueil</title>
</head>
<body>
    <?php
    $urls=[
        'img/toutous.png',
        'img/toutous.jpg',
        'img/toutouduo.jpg'
    ]
    ?>

    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
            <img src="<?php echo("$urls[0]")?>" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
            <img src="<?php echo("$urls[1]")?>" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
            <img src="<?php echo("$urls[2]")?>" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
    <?php  include("global-scripts.php") ?>
</body>
</html>