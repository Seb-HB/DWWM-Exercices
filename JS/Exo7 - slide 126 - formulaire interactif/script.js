window.addEventListener("DOMContentLoaded", (event) => {
    console.log("DOM entièrement chargé et analysé");


    // On fait disparaitre les tootips
    var tooltips = document.getElementsByClassName("tooltip");
    for (var i=0, l=tooltips.length; i<l; i++) {
        tooltips[i].style.display = "none";
    }

    //On s'occupe du champs lastName :
    var lastName = document.getElementsByName("lastName")[0];
    lastName.addEventListener('input', function() {
        if (lastName.value.length <= 2) {
            lastName.nextElementSibling.style.display = "inline-block";
            lastName.className = "incorrect";
        } else {
            lastName.nextElementSibling.style.display = "none";
            lastName.className = "correct";
        }
    });

});