<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php  include("global-stylesheets.php") ?>
    <title>Document</title>
</head>
<body>
    <?php
        $article=[
            'nom'=>'croquettes chien 2Kg',
            'img'=>'img/sweet_food.png',
            'description'=>'lorem ipsum dolor sit amet, consectet',
            'stock'=>5
        ]

    ?>

    <div id='visuelArticle'>
        <h2><?php echo($article['nom'])?></h2>
    <div>
        <img src="<?php echo($article['img'])?>" alt="">
        <p><?php echo($article['description'])?></p>
    </div>
    <p>Encore en stock: <?php echo($article['stock'])?></p>

    </div>
    <?php  include("global-scripts.php") ?>
</body>
</html>

