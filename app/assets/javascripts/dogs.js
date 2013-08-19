$(document).ready(function() {
  $('#dog-form').delegate("form", "ajax:success", function(evt, data, status, xhr) {
    $('#dog-form').empty();
    $('#dog-show').html(xhr.responseText);
  })

  $('#new-dog-link').bind("ajax:success", function(evt, data, status, xhr) {
    $('#dog-form').append(xhr.responseText);
  })

  $('#dog-list').delegate(".edit-link", "ajax:success", function(evt, data, status, xhr) {
    $('#dog-form').html(xhr.responseText);
  })

  $('#dog-list').delegate(".delete-link", "ajax:success", function(evt, data, status, xhr) {
    $('#dog-list').html(xhr.responseText);
  })
});
