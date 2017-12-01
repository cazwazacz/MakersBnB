$(document).ready(function() {
  var pathname = window.location.pathname;
  var userId = pathname.split('/').pop();

  $.get('/api/users/' + userId, function(data) {
    data.spaces.forEach(function(space) {
      $('#spaces').append('<a href="/spaces/'+space.id+'">'+'<div>' + space.title + '</div></a>');
    })
    data.requests.forEach(function(request) {
      request_id = request[0].space_id;
      spaceTitle = data.spaces[request_id - 1].title;
      $('#requests').append('<div>'+spaceTitle+' '+request[0].booking_status+'</div>');
    })
  })

  $.get('/api/spaces', function(spaces) {
    $.get('/api/users/' + userId, function(data) {
      data.bookings.forEach(function(booking) {
        spaceId = booking.space_id;
        spaceTitle = spaces.info[spaceId - 1].title;
        $('#bookings').append('<div>'+spaceTitle+' '+booking.booking_status+'</div>');
      })
    })
  })
})
