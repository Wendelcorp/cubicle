document.addEventListener("turbolinks:load", function () {

$(function(){

  $('#new-lease-form').delegate("#lease_desks", "change", function(event){
    var desks = $(this).val();
    // console.log($(this).val());
    var price = $('span#pricenumber').val();
    // console.log($('span#pricenumber').text())
    $('span#total-price-value').text(desks * price + ".0");

   });

  });

  // this listens for the load of a div on the spaces show
  // containing all the description information which
  // gets toggled off on the click of the lease
  if($('div').is('.space-details-container')){
    $('.new-lease').click(function(){
      $('.new-lease').toggle()
      $('.toggle-info').toggle()
    });
  }
});
