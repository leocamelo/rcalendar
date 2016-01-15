//= require jquery
//= require jquery_ujs

$(function(){
  var navButtons = $('nav').find('a');
  navButtons.click(function(e){
    e.preventDefault();
    navButtons.not(this).removeClass('active');
    var lang = $(this).addClass('active').data('lang');
    $('pre:visible').fadeOut('fast', function(){
      $('pre.' + lang).fadeIn('fast');
    });
  });
});
