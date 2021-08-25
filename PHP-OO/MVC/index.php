
<?php
    session_start();
    require 'autoload.php';


    if(isset($_GET['p'])) {
        switch($_GET['p']) {
            case 'users':
                $control=new UserController;
                break;
            case 'product':
                $control=new UserController;
                break;
            case 'home':
                $control=new HomeController;
                break;
            case 'service':
                $control=new ServiceController;
                break;
            case 'advice':
                $control=new AdviceController;
                break;
            case 'basket':
                $control=new BasketController;
                break;

            default:
                $control=new ErrorController;
                $control->getBasicVue;
        }

        
    }elseif(isset($_GET)){
        $control=new ErrorController;
        $control->getBasicVue;

    }else{
        $control=new HomeController;
        $control->getBasicVue;
    }


?>
