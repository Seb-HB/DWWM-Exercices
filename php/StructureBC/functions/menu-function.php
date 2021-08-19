<?php
    function displayMenu($menuItems){
        foreach($menuItems as $item){
            echo('
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="'.$item["url"].'">'.$item['nom'].'</a>
                </li>
            ');
        }
    }
?>