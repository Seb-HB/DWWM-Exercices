function conversion( montant, monnaie){
    let converti;
    (monnaie=='e')? converti=montant*1.2189845 : converti=montant/1.2189845;
    (monnaie=='e')? alert(`la conversion de ${montant} € donne ${converti.toFixed(2)} $`) :alert(`la conversion de ${montant} $ donne ${converti.toFixed(2)} €`)
}