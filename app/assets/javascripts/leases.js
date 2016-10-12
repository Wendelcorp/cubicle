document.addEventListener("turbolinks:load", function () {

$(function(){

  $('#new-lease-form').delegate("#lease_desks", "change", function(event){
    var desks = $(this).val();
    console.log(desks);
    var price = $('span#pricenumber').text();
    // console.log($('span#pricenumber').text())
    var total = parseFloat(Math.round((desks * price) * 100) / 100).toFixed(2)
    $('span#total-price-value').text(total);
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
