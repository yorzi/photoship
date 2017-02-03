$(document).ready(function() {
  $(window).scroll(function() {
    if($(window).scrollTop() == $(document).height() - $(window).height()) {
      console.log("scrolled... loading data from: " + $("#photos").data('links'));
      $.get($("#photos").data('links'));
    }
  });
});
