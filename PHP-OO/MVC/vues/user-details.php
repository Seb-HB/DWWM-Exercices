<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Genre</th>
            <th scope="col">Nom</th>
            <th scope="col">Prenom</th>
            <th scope="col">Date de naissance</th>
            <th scope="col">Mail</th>
            <th scope="col">Tel</th>
            <th scope="col">Mot de passe</th>
            <th scope="col">Date inscription</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($users as $user){
            echo(' <tr>
            <th scope="row">'.$user->getId().'</th>
            <td>'.($user->getEstFemme())? 'Mme':'M'.'</td>
            <td>'.$user->getNom().'</td>
            <td>'.$user->getPrenom().'</td>
            <td>'.$user->getDateNaissance().'</td>
            <td>'.$user->getEmail().'</td>
            <td>'.$user->getTel().'</td>
            <td>'.$user->getMdp().'</td>
            <td>'.$user->getDateInscription().'</td>
            <td><a href="index.php?p=users&del='.$user->getId().'">
            Supprimer</a></td>
        </tr>');
        }
        ?>

        </tbody>
    </table>

    
</body>
</html>