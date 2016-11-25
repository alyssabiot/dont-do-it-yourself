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

$(document).ready(function() {
  $(".skill-category-image").on("click", function(event) {
    $(".skill-category-image").removeClass('red-border');
    $(this).addClass('red-border');
    var selected_category = $(this).attr('id');
    console.log(selected_category);
    $('#skill_category').val(selected_category);
  });
});

$(function(){
  $(".tab").on("click", function(e){
    $(".tab").removeClass('active');
    $(this).addClass('active'); // Change active tab

    // Hide all tab-content (use class="hidden")
    $(".tab-content").addClass('hidden');

    // Show target tab-content (use class="hidden")
    id = $(this).data("target");
    $(id).removeClass('hidden');
  });

});
