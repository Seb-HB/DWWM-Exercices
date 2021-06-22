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

    $('img').click(function() {
        $(this).fadeOut();
    });
    $('#toto')
        .append('<p> paragraphe fantôme</p>')
        .append('<button>avec du texte</button>');
    $('button').click(function(){
        $('p').toggle();
    })

    $.ajax({
        headers: { 'X-Auth-Token': 'c359acb55b194557aa4b27e323822d10' },
        url: 'https://api.football-data.org/v2//competitions/FL1/standing',
        dataType: 'json',
        type: 'GET',
      }).done(function(response) {
        console.log(response);
        let results=response.standings[0].table;
        console.log(results);
        $(results).each(function(i, value){
            let texte=`<p>position N° `+ (i+1) +' : ' + value.team.name+'</p>';
            console.log(texte);
            $('#toto').append(texte);
        })
      }).fail(function(xhr, status, error){
        console.log(status);
      });
});
