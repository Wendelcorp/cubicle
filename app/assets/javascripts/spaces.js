
document.addEventListener("turbolinks:load", function() {

$(function(){

  $.ajax({
    url: "/images.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){
    // console.log(data)
    // console.log(data.length)
    var imgArr = []
    keys = Object.keys(data)
    for (i=0; i < keys.length; i++){
      imgArr.push(data[keys[i]])
    }
    console.log(imgArr)
    // $('<img>').attr('src',data[keys[0]]).appendTo('.sort-tools')

    // console.log(Object.values(data))

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

      function populate(i) {
        $("<div>").attr('id', _allData[i]['id']).attr('class', 'space-box').appendTo('.space-info') // .html('_allData[i]['name']')
        $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).attr('id', 'link' + _allData[i]['id']).appendTo("#" + _allData[i]['id'])
        $('<img>').attr('class','front-page-img').attr('src',  imgArr[parseInt(_allData[i]['id'])-1]).appendTo('#link' + _allData[i]['id'])
      }


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
              populate(i)
            }
            else if( _allData[i]['city'] === city && desks != 1 ){

              if(_allData[i]['available_desks'] >= desks){
              populate(i)
              }
            }
          }
          else{
            // console.log('this is the else')
            if(_allData[i]['available_desks'] >= desks){
              // console.log('inside the if')
              populate(i)
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
            populate(i)
          }
          else{
            console.log('this is the final else')
            if(_allData[i]['available_desks'] >= desks){
            populate(i)
            }
          }
        }
      });


    }).fail(function(data){
      console.log('this failed')
    });

  });


 });

 $('form').on('cocoon:after-insert', function(e, newthing){

   newthing.find('input[type=file]').on('change', function(event){

     var files = event.target.files;
     var image = files[0]
     var reader = new FileReader();

     reader.onload = function(file){
       var img = new Image();
       console.log(file);
       img.src = file.target.result;
       var fileid = newthing.find('input[type=file]').attr('id');
       var picturediv = $('<div>').html(img).attr('id', fileid);
       picturediv.appendTo('#upload_pictures');
     }

     reader.readAsDataURL(image);
     console.log(files);

   });

 });

$('form').on('cocoon:after-remove', function(e,removething){

  var fileid = removething.find('input[type=file]').attr('id');
  $('div#'+fileid).remove();


});

});




// $( ".inner" ).wrap( "<div class='new'></div>" );
