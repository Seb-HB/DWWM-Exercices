let i=0;
let total=0;
let note;

while(i<3){
    note=prompt(`entrez la note numéro ${i+1}`);
    if (!isNaN(note)){
        i++;
        total+=parseInt(note);
    }
}
total=total/i;
alert(`la moyenne des notes est ${total} `);
