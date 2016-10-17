document.addEventListener("turbolinks:load", function () {

$(function(){

// $('.modal-body-step-1').attr("style", "display: block !important");
// $('.modal-body-step-1').addClass('is-showing');

$('.modal-body-step-1 button').click(function(){
  $('.modal-body-step-1').removeClass('is-showing').addClass('animation-out');
  $('.modal-body-step-2').addClass('is-showing animation-in');
})

$('.modal-body-step-2 button').click(function(){
  $('.modal-body-step-2').removeClass('is-showing').removeClass('animation-in').addClass('animation-out');
  $('.modal-body-step-3').addClass('is-showing animation-in');
})

$('.modal-body-step-3 button').click(function(){
  $('.modal-body-step-3').removeClass('is-showing').removeClass('animation-in').addClass('animation-out');
  $('.modal-body-step-4').addClass('is-showing animation-in');
})

});
});
