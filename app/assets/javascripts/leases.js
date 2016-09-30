document.addEventListener("turbolinks:load", function () {

$(function(){

  $('#new-lease-form').delegate("#lease_desks", "change", function(event){
    var desks = $(this).val();

    var price = $('span#price').text();

    $('.total-price').text(desks * price)
   });


 });
});
