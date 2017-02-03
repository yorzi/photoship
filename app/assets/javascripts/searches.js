$(document).ready(function() {
  $(window).scroll(function() {
    if($(window).scrollTop() == $(document).height() - $(window).height()) {
      console.log("scrolled....");
      $.get('/fetch_more?page=2&id=2');
    }
  });
});
