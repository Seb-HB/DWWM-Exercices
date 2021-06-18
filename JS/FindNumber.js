function numberGame(){
let reussi=false;
let proposition;
let compteur=0;
let max=prompt('selectionnez la borne haute de la plage pour le chiffre à trouver')
targetNum=getRandomInt(max);


while (!reussi){
    proposition=parseInt(prompt('Votre proposition'));
    compteur++;
    if (proposition==targetNum){
        reussi=true;
    }else if (proposition> targetNum){
        alert('plus petit');
    }else{
        alert('plus grand');
    }
}
alert(`vous avez reussi en ${compteur} coups`)
}




function getRandomInt ( max) {
    return Math . floor ( Math . random () * Math . floor ( max));
}