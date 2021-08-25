<?php 
spl_autoload_register(function($class){
    $folders=[
        'controllers/',
        'models/',
        'models/managers/'
    ];

    foreach($folders as $folder){
        if (file_exists($folder.$class.'php')){
            require $folder.$class.'php';
            break;
        }
    }
});

?>