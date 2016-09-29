$(function(){

  $.ajax({
    url: "/images.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){
    console.log(data)
    var imgHash = {}
    for(i = 0, l = data.length; i < l; i++){
      // console.log(data[i]['location_picture_file_name'])
      imgHash[data[i]['space_id']] = data[i]['location_picture_file_name']
    }
    console.log(imgHash)

    $.ajax({
      url: "/spaces.json",
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(data){
      var _allData = data
      // globalish variables for all data and empty array for available data
      var _availableData = []
      var city = 'All';
      var desks = 1;
      // console.log(_allData)

      $('#city').change(function(event){
        _availableData = []
        city = this.value;
        // console.log(city) // return value is 'Toronto' , 'Hamilton' ..

        //clears the search results
        $('.space-info').html("")



        //loops through all data
        for(var i = 0, l = _allData.length; i < l; i++){





          // console.log(desks)
          if (city != 'All'){


            // if the chosen city is equal to the city selected in the list and desks is not changed
            if(_allData[i]['city'] === city && desks === 1 ) {
              $("<div>").attr('id', _allData[i]['id']).attr('class', 'space-box').appendTo('.space-info') // .html('_allData[i]['name']')
              $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).attr('id', 'link' + _allData[i]['id']).appendTo("#" + _allData[i]['id'])
              // if(_allData[i]['id'] in imgHash){ console.log('This worked')}
              $('<img>').attr('class','front-page-img').attr('src', imgHash[_allData[i]['id']]).appendTo('#link' + _allData[i]['id'])
              // $("<img>").attr('class', "front-page-img").src("NEED PHOTO LINK HERE")
              // $( ".front-page-img" ).wrap( "<a href = 'space/"+ _allData[i]['id'] + "</a>" );
            }
            else if( _allData[i]['city'] === city && desks != 1 ){

              if(_allData[i]['available_desks'] >= desks){
                $("<div>").html(_allData[i]['name']+ " ").attr('class', 'space-box').attr('id', _allData[i]['id']).appendTo(".space-info")
                $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
              }
            }
          }
          else{
            // console.log('this is the else')
            if(_allData[i]['available_desks'] >= desks){
              // console.log('inside the if')
              $("<div>").html(_allData[i]['name']+ " ").attr('class', 'space-box').attr('id', _allData[i]['id']).appendTo(".space-info")
              $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
            }
          }
        }
      });

      $('#number-of-desks').change(function(event){
        desks = this.value;
        console.log(desks)
        $('.space-info').html("")

        for(var i = 0, l = _allData.length; i < l; i++){
          //console.log(_allData[i]['available_desks'])
          if (city != 'All'){
            console.log(city)
            if(_allData[i]['available_desks'] >= desks && _allData[i]['city'] === city ) {
              $("<div>").html(_allData[i]['name']+ " ").attr('class', 'space-box').attr('id', _allData[i]['id']).appendTo(".space-info")
              $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
            }
          }
          else{
            console.log('this is the final else')
            if(_allData[i]['available_desks'] >= desks){
              $("<div>").html(_allData[i]['name']+ " ").attr('class', 'space-box').attr('id', _allData[i]['id']).appendTo(".space-info")
              $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).html('spaces show page').appendTo("#" + _allData[i]['id'])
            }
          }
        }
      });


    }).fail(function(data){
      console.log('this failed')
    });

  });


});







// $( ".inner" ).wrap( "<div class='new'></div>" );
