let joueur='X';
let board=document.querySelector('.box');
let squares=document.querySelectorAll('.square');


squares.forEach(element => {
    element.defineProperty('remplie', false);
    element.addEventListener('click',playing)
    console.log(element);
});

function playing(e) {
    if (this.remplie==false){
        this.remplie=true;
        this.innerHTML=`<p>${joueur} </p>`;
        (joueur=='X')? joueur='O': joueur='X';
    }
}


