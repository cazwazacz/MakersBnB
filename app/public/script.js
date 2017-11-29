$(document).ready(function() {

  getSpaces = function(filterPrice) {
    if(filterPrice===undefined) {
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          $("#info").append('<div id=space-' + information.info[i].id + '>' + information.info[i].title + information.info[i].description + information.info[i].price + '</div>')
        }
      })
    } else {
      $("#info").empty();
      $.get('/api/spaces', function(information) {
        for(var i=0; i< information.info.length; i++) {
          if(information.info[i].price <= filterPrice){
            $("#info").append('<div id=space-' + information.info[i].id + '>' + information.info[i].title + information.info[i].description + information.info[i].price + '</div>')
          }
        }
      })
    }
  };

  getSpaces();

  $(".book-button").click(function() {
    $(this).hide();
    var id = $(this).attr('id');
    $.post('/spaces/'+id+'/update_availability', function() {
      $("#span-"+id).append('Unavailable');
    });
  })

  $(".filter-button").click(function() {
    var maxPrice = $("#max-price").val();
    // $("#info").hide();
    getSpaces(maxPrice);
    // $.get('/api/spaces', function(information) {
    //   for(var i=0; i< information.info.length; i++) {
    //     if(information.info[i].price <= maxPrice){
    //       $("#info-filtered-price").append('<div id=space-filtered-price' + i + '/>')
    //       $("#space-filtered-price" + i).html(information.info[i].title + information.info[i].description + information.info[i].price)
    //     }
    //   }
    // })
  })
})
