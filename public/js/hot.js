$(document).ready(function() {
  setInterval(function() {
    $.get("/stations/hot")
      .done(function(response) {
        console.log("AJAX Reload");
        console.log(response);
        $("#stations").html(response);
      });
  }, 57000);
});