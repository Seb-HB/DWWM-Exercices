let contenuUl=document.getElementsByTagName("ul");
let listeLi=document.querySelectorAll(" ul li");
console.log(contenuUl);
console.log("-----------------------");
console.log(listeLi);

for (let i=0; i<listeLi.length; i++) {
    listeLi[i].textContent=`Elément ${i+1}`;
}