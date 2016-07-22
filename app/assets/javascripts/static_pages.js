$(function() {
  $('#js-login').on("click", function() {
    $('#js-login').hide();
    $('#js-form').show();
  });

  $('#js-form_close').on('click', function() {
    $('#js-form').hide();
    $('#js-login').show();
  });

  $('#js-username_submit').on("click", function() {
    console.log($('#username').val());
  });
});
