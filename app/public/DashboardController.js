$(document).ready(function() {
  var pathname = window.location.pathname;
  var userId = pathname.split('/').pop();

  $.get('/api/users/' + userId, function(data) {
    data.spaces.forEach(function(space) {
      $('#spaces').append('<a href="/spaces/'+space.id+'">'+'<div>' + space.title + '</div></a>');
      var status;
      space.available ? status = "Available" : status = "Unavailable";
      $('#spaces').append(status)
      var statusButton;
      space.available ? statusButton = "Unavailable" : statusButton = "Available";
      $('#spaces').append('<form action="/spaces/'+ space.id + '/toggle_availability" method="post"> <input type="submit" value="Make ' + statusButton +'"></form>')
    })
    data.requests.forEach(function(request) {
      if(request.length !== 0) {
        request_id = request[0].space_id;
        spaceTitle = data.spaces[request_id - 1].title;
        $('#requests').append('<div>'+spaceTitle+' '+request[0].booking_status+'</div>');
      }
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
