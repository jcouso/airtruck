// $(document).ready(function() {
//   var departure_address = $('#trip_departure_address').get(0);
//   var arrival_address = $('#trip_arrival_address').get(0);

//   if (departure_address) {
//     var autocomplete = new google.maps.places.Autocomplete(departure_address, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onDepartureChanged);
//     google.maps.event.addDomListener(departure_address, 'keydown', function(e) {
//       if (e.keyCode == 13) {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }

//   if (arrival_address) {
//     var autocomplete = new google.maps.places.Autocomplete(arrival_address, { types: ['geocode'] });
//     google.maps.event.addListener(autocomplete, 'place_changed', onArrivalChanged);
//     google.maps.event.addDomListener(arrival_address, 'keydown', function(e) {
//       if (e.keyCode == 13) {
//         e.preventDefault(); // Do not submit the form on Enter.
//       }
//     });
//   }
// });

// function onArrivalChanged() {
//   var place = this.getPlace();
//   var components = getAddressComponents(place);

//   $('#trip_arrival_address').trigger('blur').val(components.city);
// }

// function onDepartureChanged() {
//   var place = this.getPlace();
//   var components = getAddressComponents(place);

//   $('#trip_departure_address').trigger('blur').val(components.city);
// }

// function getAddressComponents(place) {
//   // If you want lat/lng, you can look at:
//   // - place.geometry.location.lat()
//   // - place.geometry.location.lng()

//   var street_number = null;
//   var route = null;
//   var zip_code = null;
//   var city = null;
//   var country_code = null;
//   for (var i in place.address_components) {
//     var component = place.address_components[i];
//     for (var j in component.types) {
//       var type = component.types[j];
//       if (type == 'street_number') {
//         street_number = component.long_name;
//       } else if (type == 'route') {
//         route = component.long_name;
//       } else if (type == 'postal_code') {
//         zip_code = component.long_name;
//       } else if (type == 'locality' || type == "administrative_area_level_2") {
//         city = component.long_name;
//       } else if (type == 'country') {
//         country_code = component.short_name;
//       }
//     }
//   }

//   return {
//     address: street_number == null ? route : (street_number + ' ' + route),
//     zip_code: zip_code,
//     city: city,
//     country_code: country_code
//   };
// }
