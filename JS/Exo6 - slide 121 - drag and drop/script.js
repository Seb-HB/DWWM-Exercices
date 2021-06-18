let region=document.querySelector('body');
let divSelect=false;
let targetDiv;
let infos=[];

region.addEventListener('mousedown',dragStart);
region.addEventListener('mousemove',drag);
region.addEventListener('mouseup',dragEnd);

function dragStart(e){
     if (e.target.className=='draggableBox'){
        targetDiv=e.target;
        divSelect=true;
        infos[0]=e.clientX-targetDiv.offsetLeft;
        infos[1]=e.clientY-targetDiv.offsetTop;
        console.log(targetDiv);
        console.log(infos);
     }else{
         console.log('non dragable');
     }
}

function drag(e){
    if (divSelect){
        targetDiv.style.left=e.clientX -infos[0]+ 'px';
        targetDiv.style.top=e.clientY -infos[1]+'px';
        // console.log(e.clientX,e.clientY);
    }
}

function dragEnd(e){
    if (divSelect){
        targetDiv.style.left=e.clientX -infos[0]+'px';
        targetDiv.style.top=e.clientY -infos[1]+'px';
        divSelect=false;   
        console.log('fin de drag&drop'); 
    }
    targetDiv=null;
}

