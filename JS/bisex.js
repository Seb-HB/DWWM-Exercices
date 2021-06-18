let annee=prompt('choisissez une année');
let bisex="ce n'est pas une année bissextile";
if ((annee%4==0 && annee%100!= 0)||annee%400==0){
  bisex="c'est une année bissectile";
}
alert(bisex);