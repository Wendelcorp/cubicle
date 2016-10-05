document.addEventListener("turbolinks:load", function () {

$(function(){

  $('#new-lease-form').delegate("#lease_desks", "change", function(event){
    var desks = $(this).val();
    // console.log($(this).val());
    var price = $('span#pricenumber').text();
    // console.log($('span#pricenumber').text())
    $('span#total-price-value').text(desks * price + ".0");

   });

  });
});
