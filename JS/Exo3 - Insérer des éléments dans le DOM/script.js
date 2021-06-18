// Mon code Javascript
console.log("OK : script lié");


/*###########################################################

EXERCICE : TOGGLE IMG

Ajouter en pur js :
- un 4eme paragraphe avec la class « okPourLePrem » et un contenu Lorem ipsum
- Ajouter une div a la suite de la premiere avec id=‘myDiv2’ qui contient elle-même 
    - un titre h2 : Quelle belle image !
    - un bouton avec un attribut onclick qui lancera une fonction : toggleImg(); avec comme contenu «  Clique pour supprimer l'image »
    - l’image qui se trouve dans le dossier.
- Créer la fonction toogleImg :
    - qui supprime l’image puis change le bouton en « remettre l’image »
    - puis fait l’inverse


###########################################################*/
let d=document;

let newP=d.createElement('p');
newP.setAttribute('class','okPourLePrem');
newP.textContent='Lorem';
d.querySelector('#myDiv').appendChild(newP);

let h2=d.createElement('h2');
h2.textContent='Quelle belle image!';
let bouton=d.createElement('button');
bouton.setAttribute('onclick', 'toggleImg()');
bouton.textContent='Clique pour supprimer l\'image'
let img=d.createElement('img');
img.setAttribute('src', 'img.jpg');
let myDiv2=document.createElement('div');
myDiv2.appendChild(h2);
myDiv2.appendChild(bouton);
myDiv2.appendChild(img);


let contenu=document.querySelector('main');
contenu.appendChild(myDiv2);


function toggleImg(){
    if (bouton.textContent=='Clique pour supprimer l\'image'){
        bouton.textContent='Remettre l\'image';
        img.parentNode.removeChild(img);
    }else{
        bouton.textContent='Clique pour supprimer l\'image';
        myDiv2.appendChild(img);
    }
}
