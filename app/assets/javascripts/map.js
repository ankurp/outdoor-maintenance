//= require_self
//= require google-maps

function initMap() {
  var configurationNode = document.getElementById('map_configuration');
  var markerNode = document.getElementById('map_markers');

  if (!configurationNode || !markerNode) {
    return;
  }

  var configuration = JSON.parse(configurationNode.innerHTML);  
  var markers = JSON.parse(markerNode.innerHTML);
  var infoWindow = new google.maps.InfoWindow()
  var map = new google.maps.Map(document.getElementById('map'), {center:{lat:40.329400,lng:-74.549762},zoom:8,styles:[{"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#C5E3BF"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#D1D1B8"}]},{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#C6E2FF"}]}]});

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      map.panTo(pos);
      map.setZoom(11);
    }, function() {
    });
  }

  for (var i = 0; i < markers.length; i++) {
      var position = new google.maps.LatLng(markers[i].location_coordinates.latitude, markers[i].location_coordinates.longitude);
      var marker = new google.maps.Marker({
          position: position,
          animation: google.maps.Animation.DROP,
          map: map,
          icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|4ECDC4',
          title: "<div class='job-posting-description'>" + markers[i].description + "</div>" + (configuration.showRequestButton ? markers[i].request_job_link : '')
      });
      
      // Allow each marker to have an info window    
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
              infoWindow.setContent("<strong>" + marker.title.split("\n").join("<br/>") + "</strong>");
              infoWindow.open(map, marker);
          }
      })(marker, i));
  }
}

$(document).on('turbolinks:load', function() {
  initMap();
})
