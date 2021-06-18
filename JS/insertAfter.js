function insertAfter(afterElement, newElement){
    afterElement.parentNode.insertBefore(afterElement.cloneNode(true), afterElement);
    afterElement.parentNode.insertBefore(newElement, afterElement);
    afterElement.parentNode.removeChild(afterElement);
}


let newE=document.createElement('p');
newE.textContent='inséré apres l\'Id test';
insertAfter(document.querySelector('.test'),newE);