<?php
    include "functions/menu-function.php";
    $menuItems=[
        [
            'nom'=>'Chiens',
            'url'=>'category.php?id=1'
        ],
        [
            'nom'=>'Chats',
            'url'=>'category.php?id=2'
        ],
        [
            'nom'=>'Contact',
            'url'=>'contact.php'
        ],
        [
            'nom'=>'connexion',
            'url'=>'login.php'
        ]
    ];

?>


<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.php">Home</a>
            </li>
            <?php displayMenu($menuItems)  ?>
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
</div>