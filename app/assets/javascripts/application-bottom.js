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
//= require plugins/leaflet/leaflet
//= require plugins/leaflet/leaflet-sidebar

var map = L.map('map', {
    center: [41.902905, 12.425956],
    zoom: 18
});



var marker = L.marker([51.2, 7]).addTo(map);

var sidebar = L.control.sidebar('sidebar', {
    position: 'right',
    collapsed: false
}).addTo(map);