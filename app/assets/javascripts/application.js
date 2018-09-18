//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$( document ).ready(function() {

  // hide spinner
  $(".spinner").hide();


  // show spinner on AJAX start
  $(document).ajaxStart(function(){
    $(".spinner").show();
  });
//   $(window).on('load', function(){
//     $(".spinner").show();
// })

  hide spinner on AJAX stop
  $(document).ajaxStop(function(){
    $(".spinner").hide();
  });
  // $(document).ajaxStop(function(){
  //   $(".spinner").delay(3000).hide(0);
  // });

});
