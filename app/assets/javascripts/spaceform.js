document.addEventListener("turbolinks:load", function () {

$(function(){

// $('.modal-body-step-1').attr("style", "display: block !important");
// $('.modal-body-step-1').addClass('is-showing');

$('.modal-body-step-1 button').click(function(){
  $('.modal-body-step-1').removeClass('is-showing animation-in').addClass('animation-out');
  $('.modal-body-step-2').addClass('is-showing animation-in');
  $('.modal-body-step-2').append($('<button>').html('Back').attr('class','back'));
  backButton();
})

$('.modal-body-step-2 button').click(function(){
  $('.modal-body-step-2').removeClass('is-showing animation-in').removeClass('animation-in').addClass('animation-out');
  $('.modal-body-step-3').addClass('is-showing animation-in');
  $('.modal-body-step-3').append($('<button>').html('Back').attr('class','back'));
  backButton();
})

$('.modal-body-step-3 button').click(function(){
  $('.modal-body-step-3').removeClass('is-showing animation-in').removeClass('animation-in').addClass('animation-out');
  $('.modal-body-step-4').addClass('is-showing animation-in');
  $('.modal-body-step-4').append($('<button>').html('Back').attr('class','back'));
  backButton();
})

function backButton () {
  $('.back').click(function(event){
    event.preventDefault();
    // alert("back was clinked");
    if ( $('.modal-body-step-2').hasClass('is-showing') === true ) {
    // console.log($('.modal-body-step-2').hasClass('is-showing'));
        $('.modal-body-step-2').removeClass('is-showing animation-in');
        $('.modal-body-step-1').addClass('is-showing animation-in');
      } else if ($('.modal-body-step-3').hasClass('is-showing') === true ) {
            $('.modal-body-step-3').removeClass('is-showing animation-in');
            $('.modal-body-step-2').addClass('is-showing animation-in');
      } else if ($('.modal-body-step-4').hasClass('is-showing') === true ) {
            $('.modal-body-step-4').removeClass('is-showing animation-in');
            $('.modal-body-step-3').addClass('is-showing animation-in');
      }
  })
}

});
});
