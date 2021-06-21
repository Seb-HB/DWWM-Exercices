let meteoRequest = new XMLHttpRequest();
let meteomap = L.map('meteomap').setView([45.439695, 4.3871779], 13);
let meteoUrl;



L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoiZnNlYiIsImEiOiJja3E2aGw0bnowMHNjMnZvNHlqNGp6NGpkIn0.S3wYLXEkMHn8Ep-IYQDF-Q'
}).addTo(meteomap);


// meteomap.onclick=function(e) {
//     latLong = e.latlng;
//     console.log(e);
//     console.log(latLong);
// }

function onMapClick(e) {
    latLong = e.latlng;
    // console.log(e);
    // console.log(latLong);
    meteoUrl=`https://www.prevision-meteo.ch/services/json/lat=${latLong.lat}lng=${latLong.lng}`;
    console.log(meteoUrl);

}

meteomap.on('click', onMapClick);



// document.querySelector('#meteoparam').submit=function(){

// }

// const getMeteo=function(url){
//     meteoRequest.onreadystate=meteoResult(){
//         if (this.readyState==4){
//             (this.status == 200) ? reqSucces(this.response) : reqError(this.status, this.statusText);
//         }else{
//             reqError(this.status, this.statusText);
//         }
//     }
    
//     meteoRequest.open("GET", url);


// }


// function reqSuccess(response){
//     const meteo=JSON.parse(response);
//     console.log(response);
// }