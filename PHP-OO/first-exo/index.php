<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        $user = new User('seb','sébastien','fouvet','toto');
        $article = new Article('bouée',2, 25.99, 'canard.jpg');
        echo($article->getClassName);

        var_dump($article);


    ?>
    
</body>
</html>