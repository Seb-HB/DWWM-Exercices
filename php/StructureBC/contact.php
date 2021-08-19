<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BC php</title>
    <?php  include "app/global-css.php"?>
    <link rel="stylesheet" href="public/css/contact.css">
</head>
<body>
    <header>
        <?php  include "app/header.php"?>
    </header>
    <main>
        <div class="container d-flex justify-content-center">
            <div class="row my-2 mx-2">
                <div class="col-md-6"> <img src="https://png.pngtree.com/png-vector/20190725/ourlarge/pngtree-message-icon-design-vector-png-image_1587713.jpg" alt="IMG"> </div>
                <!--col-->
                <div class="col-md-6">
                    <h2 class="form-title">Contact us</h2>
                    <p class="justify text-muted">Have an enquiry or would like to give us feedback?<br>Fill out the form below to contact our team.</p>
                    <form>
                        <div class="form-group pt-2 pl-1"> <label for="exampleInputName">Your name</label> <input type="text" class="form-control" id="exampleInputName"> </div>
                        <div class="form-group pl-1"> <label for="exampleInputEmail1">Your email address</label> <input type="email" class="form-control" id="exampleInputEmail1"> </div>
                        <div class="form-group pl-1"> <label for="exampleFormControlTextarea1">Your message</label> <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea> </div>
                        <div class="row">
                            <div class="col-md-3 offset-md-9"><button type="submit" class="btn btn-primary">Send</button></div>
                        </div>
                    </form>
                </div>
                <!--col-->
            </div>
            <!--row-->
        </div>
    </main>
    <footer>
        <?php  include "app/footer.php"?>
    </footer>
    <?php  include "app/global-scripts.php"?>  
</body>
</html>