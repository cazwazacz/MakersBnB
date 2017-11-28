$(document).ready(function() {
  $(".book-button").click(function() {
    $(this).hide();
    var id = $(this).attr('id');
    $.post('/spaces/'+id+'/update_availability')
  })
})
