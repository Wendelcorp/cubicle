document.addEventListener("turbolinks:load", function() {

$(function(){

$('.modal-body-step-1 button').click(function(){
  $(this).removeClass("is-showing animation-out")
})

});
});
