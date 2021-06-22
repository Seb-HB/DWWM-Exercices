let mystring='Il est où le soleil ? le sol a froid !';
let stringDiv=document.querySelector('#stringsManip');

(/sol/.test(mystring)) ? alert('le mot sol est présent'): alert('le mot sol est absent');

console.log(mystring.match(/sol/gi)); // g fait le test sur toute la chaine et i ignore la casse

let posit= document.createElement('p');
posit.textContent="premiere position de 'sol': " + mystring.indexOf('sol',0)+ ' dernière position: '+mystring.lastIndexOf('sol');
stringDiv.appendChild(posit);

alert(mystring.substring(0,mystring.indexOf('?')+1));
alert(mystring.substring(mystring.indexOf('?')+1));



// - Avec les regex, chercher  dans la chaine « Il est où le soleil ? le sol a froid ! » , 
//     - si le mot sol est présent.
//     - un tableau avec les mots contenant sol
//     - la position de la première occurrence
// - Découper cette même string en deux chaines, juste avant le point d'interrogation, et juste après.
// - Faire une fonction :
//     - qui supprime les espaces avant et après les phrases
//     - Met la première lettre en majuscule si besoin.
// - Couper  "Robert Mitchum, Clarke Gayble, Jean Gabin" pour que chaque nom soit dans un tableau. 
// - Regrouper toutes ces instructions et les lancer au bout de deux secondes.