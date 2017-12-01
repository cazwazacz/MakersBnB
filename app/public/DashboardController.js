$(document).ready(function() {
  var pathname = window.location.pathname;
  var userId = pathname.split('/').pop();

  $.get('/api/users/' + userId, function(data) {
    data.spaces.forEach(function(space) {
      $('#spaces').append('<a href="/spaces/'+space.id+'">'+'<div>' + space.title + '</div></a>');
      var status;
      space.available ? status = "Available" : status = "Unavailable";
      $('#spaces').append('<div id="availability-status-div-' + space.id + '"> ' + status + '</div>')
      var statusButton;
      space.available ? statusButton = "Unavailable" : statusButton = "Available";
      $('#spaces').append('<button class="availability-button" id="availability-' + space.id +'"> Make ' + statusButton + '</button>')
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

  $(document).on('click', ".availability-button", function () {
    var id = ($(this).attr('id')).split("-").pop();
    $.post('/spaces/'+id+'/toggle_availability', function() {
    });
    if ($(this).text() === "Make Available") {
      $(this).text("Make Unavailable")
      $("#availability-status-div-" + id).text("Available")
    } else {
      $(this).text("Make Available")
      $("#availability-status-div-" + id).text("Unavailable")
    }
  })
})
