let imageMagique= document.querySelector('#magicImage img');
let bouton=document.querySelector('#magicImage button');

function setOpacity(objet, opacity){
    objet.style.opacity = opacity;
    console.log(objet.style.opacity);
}

bouton.addEventListener('click',function(e){
    bouton.enabled=false;
    for (let i = 0; i < 100; i++) {
        console.log(i);
        if(bouton.textContent=='Disparition'){
            setTimeout(setOpacity, i*10, imageMagique, 1-(i/100)); 
        }else{
            setTimeout(setOpacity, i*10, imageMagique, (i/100));
        }    
    }
    if(bouton.textContent=='Disparition'){
        bouton.textContent='Apparition';
    }else{
        bouton.textContent='Disparition';
    }
    bouton.enabled=true;

});