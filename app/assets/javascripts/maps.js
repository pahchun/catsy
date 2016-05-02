// window.onload = init();

function initMap() {
  address = $('#address_field')[0].value;
  geocode(address,0);
}

function geocode(address, index)
{
  var request = $.ajax( {
    method: "GET",
    data: { "address": address },
    url: "https://maps.googleapis.com/maps/api/geocode/json"
  } );

  request.done(
    function( data ) {
      placeMap(data.results[0].geometry.location.lat,
        data.results[0].geometry.location.lng,
        index);
  });
}

function placeMap(lat, long ,index){
  var mapProp = {
    center:new google.maps.LatLng(lat, long),
    zoom:18,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas-0"),mapProp);
}

function createMarker(lat, long, map) {
  placeLoc = {};
  placeLoc.lat = lat;
  placeLoc.lng = long;
  marker = new google.maps.Marker({
    map: map,
    animation: google.maps.Animation.DROP,
    position: placeLoc
  });
}
