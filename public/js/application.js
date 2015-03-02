$(document).ready(function() {
  function initialize() {
    var mapOptions = {
      center: { lat: 41.88935970000001, lng: -87.6369980},
      zoom: 15
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
  }
  google.maps.event.addDomListener(window, 'load', initialize);

  $("a#hot").click(function(e) {
    e.preventDefault();
    $.get("/stations/hot")
      .done(function(response) {
        console.log("AJAX Reload");
        $("#stations").html(response);
      });
  });

  $("a#all").click(function(e) {
    e.preventDefault();
    $.get("/stations")
      .done(function(response) {
        console.log("AJAX Reload");
        $("#stations").html(response);
      });
    });
});