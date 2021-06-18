let total=i=0;
let note;

while(true){
    note=prompt(`entrez la note numéro ${i+1}`);
    if(note == ''){
        break;
     }else{
        note=parseInt(note);
     } 
    (note<0 || note>20||isNaN(note))? alert('la saisie n\'est pas une note non valide'):( i++, total+=note);   
}
total=total/i;
(i>0) ? alert(`la moyenne des ${i} notes est ${total} `) : alert('Aucune note saisie');