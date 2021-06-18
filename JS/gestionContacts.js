let amis=[];
let nouveau, inscrit;
const regMail=new RegExp('^[a-z]+[a-z0-9]*\.*[a-z0-9]*@[a-z]+\.[a-z.]{2,5}$');
class Ami{
    constructor(nom, prenom,mail){
        this.lastName=nom;
        this.firstName=prenom;
        this.mail=mail;
    }
}

document.querySelector('#addcontact').addEventListener('submit', function(e) {
    e.preventDefault();
    if(regMail.test(document.getElementById('email').value.toLowerCase())){
        nouveau= new Ami(document.getElementById('lastname').value, document.getElementById('firstname').value,document.getElementById('email').value);
        amis.push(nouveau);
        this.reset();
        inscrit=document.createElement('p');
        inscrit.textContent=nouveau.lastName +' '+ nouveau.firstName+' '+ nouveau.mail;
        document.getElementById('listContacts').appendChild(inscrit);
    }else{
        alert('mail invalide');
    }

})
