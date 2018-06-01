//= require jquery
//= require jquery_ujs

(function () {
  'use strict';

  $(function () {
    var fadeSpeed = 200;
    var $navButtons = $('nav').find('a');

    $navButtons.click(function (e) {
      e.preventDefault();
      $navButtons.not(this).removeClass('active');
      var lang = $(this).addClass('active').data('lang');

      $('pre:visible').fadeOut(fadeSpeed, function () {
        $('pre.' + lang).fadeIn(fadeSpeed);
      });
    });
  });
}());
