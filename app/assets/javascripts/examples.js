// Document ready!
$(function(){

  // change examples language system
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
