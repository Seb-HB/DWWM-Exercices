function sortNumbers (tab){
    let arrayInf=[], arraySup=[];
    let i=j=0;
    tab.forEach(element => {
        (element <10)? arrayInf.push(element): arraySup.push(element);
    });
    return { inf:arrayInf, sup:arraySup};
}

argt=[40, 1 ,5, 20, 8, 83, 9];
let result=sortNumbers(argt);
console.log(result);
console.log(result.inf);
console.log(result.sup);