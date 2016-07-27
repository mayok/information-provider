$(function() {
  $('#js-article-good').on('click', function() {
    console.log( $('#js-article-good').attr('data-tags') );
    console.log( $('#js-article-good').attr('data-userid') );

    $.ajax({
      url: "/update",
      type: "POST",
      data: {
        id: $('#js-article-good').attr('data-userid'),
        tags: $('#js-article-good').attr('data-tags'),
        op: true
      },
      dataType: "html",
      success: function(data) {
        //alert('success');
      },
      error: function(data) {
        //alert('error');
      }
    });

    $('#js-article-good').attr('disabled', true);
    $('#js-article-bad').attr('disabled', true);
  });

  $('#js-article-bad').on('click', function() {
    console.log( $('#js-article-bad').attr('data-tags') );
    console.log( $('#js-article-bad').attr('data-userid') );

    $.ajax({
      url: "/update",
      type: "POST",
      data: {
        id: $('#js-article-bad').attr('data-userid'),
        tags: $('#js-article-bad').attr('data-tags'),
        op: false
      },
      dataType: "html",
      success: function(data) {
        //alert('success');
      },
      error: function(data) {
        //alert('error');
      }
    });

    $('#js-article-good').attr('disabled', true);
    $('#js-article-bad').attr('disabled', true);
  });
});
