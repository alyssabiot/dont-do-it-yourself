$(document).ready(function() {
  var skill_location = $('#skill_location').get(0);
  if (skill_location) {
    var autocomplete = new google.maps.places.Autocomplete(skill_location, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(skill_location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);
  $('#skill_location').trigger('blur').val(components.location);
  $('#skill_zip_code').val(components.zip_code);
  $('#skill_city').val(components.city);
  if (components.country_code) {
    $('#skill_country').val(components.country_code);
  }
}


function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()
  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
    {e.preventDefault();}
  }
  return {
    location: street_number == null ? route : (street_number + ' ' + route),
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}
