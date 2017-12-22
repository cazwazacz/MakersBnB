$(document).ready(function() {

  var pathname = window.location.pathname;
  var userId = pathname.split('/').pop();

  updateButton = function(id, button) {
    $.get('/api/spaces', function(spaces) {
      if(spaces.info[id-1].available === true) {
        button.text("Make Unavailable")
        $("#availability-status-div-" + id).text("Available")
      } else {
        button.text("Make Available")
        $("#availability-status-div-" + id).text("Unavailable")
      }
    })
  }

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
    data.requests[0].forEach(function(request) {
      if(request.length !== 0) {
        var request_id = request.space_id;
        var spaceTitle;
        for(i=0; i< data.spaces.length; i++) {
          if(data.spaces[i].id === request_id) {
            spaceTitle = data.spaces[i].title
          }
        }
        $('#requests').append('<div>'+spaceTitle+' '+request.booking_status+'</div>');
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
    var button = $(this);
    $.post('/spaces/'+id+'/toggle_availability', function() {
      updateButton(id, button)
    })
  });
})
