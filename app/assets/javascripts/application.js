// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require graphql
//= require_tree .

(function(){
  var csrf = document.getElementsByName("csrf-token")[0].content;
  window.graph = graphql("/graphql", {
    headers: {
      "X-CSRF-Token": csrf
    },
  })
})();

function initMap() {
  const getPins = graph(`
    query {
      schools(minGsRating: 10, elementary: true) {
        name
        lat
        lng
        gsRating
      }
      companies {
        name
        lat
        lng
      }
    }
    `)

  var myLatLng = {lat: 37.4256448, lng: -122.1703692};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: myLatLng
  });

  getPins().then((data) => {
    _.each(_.take(data.schools, 500), (s) => {
      console.log(s.lat)
      var marker = new google.maps.Marker({
        position: {lat: s.lat, lng: s.lng},
        map: map,
        title: s.name,
        icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
      });
    })
    _.each(data.companies, (c) => {
      console.log(c.lat)
      var marker = new google.maps.Marker({
        position: {lat: c.lat, lng: c.lng},
        map: map,
        title: c.name,
        icon: "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
      });
    });
  })
}
