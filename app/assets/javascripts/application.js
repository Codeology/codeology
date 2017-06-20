// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(window).scroll(function(){

  var wScroll = $(this).scrollTop();

  // Animation for benefits icons
  if(wScroll > $('.benefits-icon').offset().top - $(window).height()){

      var offset = Math.min(0, wScroll - $('.benefits-icon').offset().top + $(window).height() - 200);

      $('.icon1').css({'transform': 'translate('+ offset +'px, '+ Math.abs(offset * 0.2) +'px)'});

      $('.icon3').css({'transform': 'translate('+ Math.abs(offset) +'px, '+ Math.abs(offset * 0.2) +'px)'});
  }

  // Animation for team members
  if(wScroll > $('.team-members').offset().top - ($(window).height() / 1.2)) {

    $('.team-members figure').each(function(i){

      setTimeout(function(){
        $('.team-members figure').eq(i).addClass('is-showing');
      }, 150 * (i+1));
    });
  }

});
