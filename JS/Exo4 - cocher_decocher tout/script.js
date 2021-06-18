function monDieu(){
    q=prompt('combien de checkbox voulez vous?');
    createCheckbox(q);
}

function createCheckbox(nb){
    let checkbox, checkLabel, br;
    let para=document.querySelector('p');
    let bouton=document.createElement('button');
    bouton.textContent='Check all';
    
    for(let i=0;i<nb;i++){
        checkbox=document.createElement('input')
        checkbox.type='checkbox';
        checkbox.id='ch'+(i+1);
        checkLabel=document.createElement('label');
        checkLabel.textContent='checkbox N°'+(i+1);
        checkLabel.setAttribute('for', 'ch'+(i+1));
        br=document.createElement('br');
        para.appendChild(br);
        para.appendChild(checkbox);
        para.appendChild(checkLabel);
        console.log(i);
    }
    bouton.addEventListener('click', checkAllBox);
    para.appendChild(bouton);
}

function checkAllBox(){
    console.log('dedans!');
    let allCheckbox=document.querySelectorAll('input');
    console.log(allCheckbox);
    for(let i=0;i<allCheckbox.length;i++){
        allCheckbox[i].checked=true;
    }
}