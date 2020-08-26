var map; 

function initMap() { 
var seoul = { lat: 37.5642135 ,lng: 127.0016985 }; 
map = new google.maps.Map( document.getElementById('map'), { 
zoom: 12, center: seoul }); 
google.maps.event.addListener(map, 'click', function(event) {
    placeMarker(event.latLng);
});
new google.maps.Marker({ 
position: seoul, map: map, label: "서울 중심 좌표" }); 
} 

  
function placeMarker(location) {
  var marker = new google.maps.Marker({
      position: location, 
      map: map
  });
  map.setCenter(location);
}   
    
