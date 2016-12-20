$(function() {
  $(document.body).off('click', 'nav.pagination a');
  $(document.body).on('click', 'nav.pagination a', function(e) {
    e.preventDefault();

    $("#boxes_container").load($(this).attr("href"));
    return false;
  });
});
