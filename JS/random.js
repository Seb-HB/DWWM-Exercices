const randomNumber= function(min,max, isdecimal){

    let randomN=Math.random();
    randomN=randomN*(max-min)+min;
    if(isdecimal)  randomN=Math.round(randomN);

    alert(`voici un nombre aléatoire entre ${min} et ${max} : ${randomN}`);
}

setInterval(randomNumber, 5000, 15, 100, true);

