$(function(){
    let contenu='<table><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr><tr><td></td><td></td><td></td></tr></table>';
    // let colors=['grey','blue'];
    // let i=0;
    $('body').append(contenu);
    $('td').css({'border':'1px solid', 'width':'50px','height':'50px'});
    $('tr').each(function(i){
        (i%2===0)? $(this).css('background-color', 'grey'):$(this).css('background-color', 'blue')
        // $(this).css('background-color', colors[i]);
        // (i==0)? i=1 : i=0;
    });

    $('td').click(function(){
        $.ajax({
            type:'GET',
            url: 'https://prevision-meteo.ch/services/json/saint-Etienne-42',
            timeout: 2500,
            success: function(data){
                console.log(data);
            }, 
            error: function(){
                alert('requête KO');
            }
        });
    });
});

// - Créer une image dans votre html. Au clic sur cette image, faire un fadeOut afin qu’elle disparaisse (la méthode fadeOut existe en Jquery)

// - Créer une div avec un id. 
// - En jQuery, insérer un paragraphe dans cette div
// - Puis insérer, un bouton après cette div, lui mettre du texte
// - Au clic
// -  sur le bouton, faire un toggle qui supprime ou affiche le paragraphe à l’intérieur de la div 
// - La methode toggle() existe en jQuery