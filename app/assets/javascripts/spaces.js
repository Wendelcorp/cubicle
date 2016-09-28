$(function(){

  $.ajax({
    url: "/spaces.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){
    var _allInfo = data
    console.log(_allInfo)

    $('#city').change(function(event){
      var city = this.value;
      console.log(city) // return value is 'Toronto' , 'Hamilton' ..

      // clears the html in the space-info class
      if (city != 'All'){
        $('.space-info').hide();
      }
      else{
        $('.space-info').show();
      }

      $('#search-results').html("")

      //loops through all data
      for(var i = 0, l = _allInfo.length; i < l; i++){

        console.log(_allInfo[i]['city']) //returns each city in the console

        // if the chosen city is equal to the city in the list..
        if(_allInfo[i]['city'] === city){
          console.log(_allInfo[i]['name'])
          //append the new information into cleared space info class
          $("<div>").html(_allInfo[i]['name']+ " ").attr('id', _allInfo[i]['id']).appendTo("#search-results")
          $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allInfo[i]['id']).html('spaces show page').appendTo("#" + _allInfo[i]['id'])
        }
      }
    });

    $('#number-of-desks').change(function(event){
      var desks = this.value;
      console.log(desks)
    });








  }).fail(function(data){
    console.log('this failed')
  });

});



// ment.style.visibility = 'hidden';      // Hide
// element.style.visibility = 'visible';     // Show
