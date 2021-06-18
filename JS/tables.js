let tables='';
for(let i=1; i<10; i++){
    for(let j=1; j<10; j++){
        tables+= (`${i} X ${j} = ${i*j}   `);
    } 
    console.log(tables);
    tables='';
}
