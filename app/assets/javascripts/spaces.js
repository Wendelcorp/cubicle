$(function(){

  $.ajax({
    url: "/spaces.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){
    var _allData = data
    // globalish variables for all data and empty array for available data
    var _availableData = []
    var city;
    var desks;
    // console.log(_allData)

    $('#city').change(function(event){
      _availableData = []
      city = this.value;
      // console.log(city) // return value is 'Toronto' , 'Hamilton' ..

      //clears the search results
      $('#search-results').html("")

      //loops through all data
      for(var i = 0, l = _allData.length; i < l; i++){

        console.log(desks)
        if (city != 'All'){
          // hides the space info
          $('.space-info').hide();
          // if the chosen city is equal to the city in the list and desks is not changed 
          if(_allData[i]['city'] === city && desks === undefined ) { 
            $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
            $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
          }
          else if( _allData[i]['city'] === city && desks != 0 ){
            if(_allData[i]['available_desks'] >= desks){
              $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
              $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
            }
          }
        }
        else{
          if(_allData[i]['available_desks'] >= desks){
            $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
            $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
          }
        }
      }
    });

    $('#number-of-desks').change(function(event){
      desks = this.value;
      // console.log(desks)
      $('#search-results').html("")

      for(var i = 0, l = _allData.length; i < l; i++){
        if (city != 'All'){
          $('.space-info').hide();
          if(_allData[i]['available_desks'] >= desks) { 
            $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
            $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
          }
        }
        else{
          if(_allData[i]['available_desks'] >= desks){
            $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
            $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
          }
        }
      }
    });


  }).fail(function(data){
    console.log('this failed')
  });



});

// if ($.inArray('example', myArray) != -1)
          // $("<div>").html(_allData[i]['name']+ " ").attr('id', _allData[i]['id']).appendTo("#search-results")
          // $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
// ment.style.visibility = 'hidden';      // Hide
// element.style.visibility = 'visible';     // Show
