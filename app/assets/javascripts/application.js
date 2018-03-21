//= require jquery
//= require jquery_ujs

(function () {
  'use strict';

  $(function () {
    var $navButtons = $('nav').find('a');

    $navButtons.click(function (e) {
      e.preventDefault();
      $navButtons.not(this).removeClass('active');
      var lang = $(this).addClass('active').data('lang');
      $('pre:visible').fadeOut(200, function () {
        $('pre.' + lang).fadeIn(200);
      });
    });
  });
}());
