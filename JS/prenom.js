let fratrie;
let prenom=prompt('votre prenom');
while (prenom){
    prenom=prompt('saisissez le prenom dun frère ou d\'une soeur'); 
    (fratrie) ? fratrie+=" "+prenom : fratrie=prenom;
}
console.log(fratrie);