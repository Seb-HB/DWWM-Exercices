<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panier</title>
    <?php  include("global-stylesheets.php") ?>
</head>
<body>
    <?php
        $panier=[
            [
                'nom'=>'croquettes chien 2Kg',
                'img'=>'img/sweet_food.png',
                'description'=>'lorem ipsum dolor sit amet, consectet',
                'quantite'=>5
            ],
            [
                'nom'=>'croquettes chien 2Kg',
                'img'=>'img/sweet_food.png',
                'description'=>'lorem ipsum dolor sit amet, consectet',
                'quantite'=>5
            ],
            [
                'nom'=>'croquettes chien 2Kg',
                'img'=>'img/sweet_food.png',
                'description'=>'lorem ipsum dolor sit amet, consectet',
                'quantite'=>5
            ]
            ];


        foreach ( $panier as $article ) {
            echo("<div class='lignearticle'>");
            echo("<img src=".$article['img']." alt='article'>");
            echo("<span >".$article['nom']."</span>");
            echo("<span >Quantité: ".$article['quantite']."</span>");
            echo("</div>");    
        }

    ?>
    <?php  include("global-scripts.php") ?>
</body>
</html>



