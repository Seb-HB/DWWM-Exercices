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
        $adressesMail = [
            'aureliendelorme1@gmail.com',
            'smithcrank@gmail.com',
            '148547@supinfo.com',
            'aurelien.delorme@orange.fr',
            'test@yahoo.com',
            'bonjour@msn.com',
            'adelorme@humanbooster.com',
        ];


        function triMails($mails){
            $mailsTries=[];
            $totalMails=0;
            foreach($mails as $mail){
                $temp=substr(stristr($mail, '@'), 1);
                if (array_key_exists($temp, $mailsTries)){
                    $mailsTries[$temp]++;
                }else{
                    $mailsTries[$temp]=1;
                }
                $totalMails++;
            }
            return [$mailsTries, $totalMails];

        }

        function affichageStatsMails($tabMails, $nbMails){
            foreach($tabMails as $fournisseur=>$occurence){
                //echo('il y a <b>'.$occurence.'</b> mail du fournisseur <b>'.$fournisseur.'</b> soit <b>'.round((($occurence/$nbMails)*100),2).'%</b> du total des mails <br>');
                echo('<h2><u>'.$fournisseur.'</u>:</h2>');
                echo('<p><b>'.$occurence.'</b> mails trouvé'.(($occurence>1)?'s.':'.').' Soit <b>'.round((($occurence/$nbMails)*100),2).'%</b> des mails.</p>');
            }
        }

        $tri=triMails($adressesMail);
        affichageStatsMails($tri[0], $tri[1]);

    ?>
    
</body>
</html>