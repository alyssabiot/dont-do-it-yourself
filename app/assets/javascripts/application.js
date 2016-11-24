//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .
//= require underscore
//= require gmaps/google

// alert('Sadly ...');

$(function () {
  $('input.datetimepicker').data({behaviour: "datetimepicker"}).datetimepicker();
});
