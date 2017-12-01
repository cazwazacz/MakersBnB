$(document).ready(function() {

  displaySpaces = function(information, i) {
    $("#info").append('<div class="spaces-st" id=space-' + information.info[i].id + '>' + '<div class="space-title">'+information.info[i].title +'</div><div class="space-description">' + information.info[i].description+'</div><div class="space-price">¥' + information.info[i].price +'</div><div class="space-location">'+ information.info[i].location + '</div></div>')
    $("#space-" + information.info[i].id).append('<img class="img-st" src=' + information.info[i].image_url + '>');
    if(information.info[i].available) {
      $("#space-" + information.info[i].id).append('<button class="book-button" id=book-button-' + information.info[i].id + ' type="button"> book </button>')
    } else {
      $("#space-" + information.info[i].id).append(' Unavailable')
    }
  };

  getSpaces = function(filterPrice, filterLocation) {
    if((filterPrice === undefined && filterLocation === undefined) || (filterPrice === "" && filterLocation === "")){
      $("#info").empty();
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          displaySpaces(information, i);
        }
      })
    } else if(filterPrice === "" || filterPrice === undefined){
      $("#info").empty();
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          if(information.info[i].location === filterLocation) {
            displaySpaces(information, i);
          }
        }
      })
    } else if(filterLocation === "" || filterLocation === undefined ) {
      $("#info").empty();
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          if(information.info[i].price <= filterPrice){
            displaySpaces(information, i);
          }
        }
      })
    } else {
      $("#info").empty();
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          if(information.info[i].price <= filterPrice && information.info[i].location === filterLocation) {
            displaySpaces(information, i);
          }
        }
      })
    }
  };

  getSpaces();

  $(document).on('click', ".book-button", function () {
    $(this).hide();
    var id = ($(this).attr('id')).split("-").pop();
    $.post('/spaces/'+id+'/request_booking', function() {
      $("#space-"+id).append('Unavailable');
    });
  })

  $(".filter-button").click(function() {
    var maxPrice = $("#max-price").val();
    var location = $("#location").val();
    getSpaces(maxPrice, location);
  })
})
