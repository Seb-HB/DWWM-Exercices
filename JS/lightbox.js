let usedClass;
for (let i = 1; i < 6; i++) { 
   document.querySelector(`#lightBox a:nth-child(${i})`).addEventListener('click',function(e) {
       e.preventDefault();
    console.log (document.querySelector(`#lightBox a:nth-child(${i})`));
    document.querySelector('#overlay').style.display='block';
    document.querySelector('#overlay').style.top=window.scrollY;
    usedClass=document.querySelector(`#lightBox img:nth-child(${i})`).className;
    console.log(usedClass);
    document.querySelector(`#overlay img.${usedClass}`).style.display='inline-block';
    setTimeout(function(){
        document.querySelector('#overlay').style.display='none';
        document.querySelector(`#overlay img.${usedClass}`).style.display='none';
    }, 3000);
    console.log(e);
   })
   
}