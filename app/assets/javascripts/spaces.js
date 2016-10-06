document.addEventListener("turbolinks:load", function() {

$(function(){

var querystring

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
    // console.log(imgArr)
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
      var city = 'all';
      var desks = 1;
      console.log(_allData)

      function populate(i) {
        $("<div>").attr('id', _allData[i]['id']).attr('class', 'space-box').appendTo('.space-info') // .html('_allData[i]['name']')
        $('<p>').attr('class', 'space-price').html('$' + _allData[i]['price']).appendTo("#" + _allData[i]['id'])
        $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).attr('id', 'link' + _allData[i]['id']).appendTo("#" + _allData[i]['id'])
        $('<img>').attr('class','front-page-img').attr('src',  imgArr[parseInt(_allData[i]['id'])-1]).appendTo('#link' + _allData[i]['id'])
        $('#link' + _allData[i]['id']).wrap( "<div class='front-page-img-container'></div>");
      }
      // .toLowerCase();

      $('#city').change(function(event){
        _availableData = []
        city = this.value.toLowerCase();
        // console.log(city) // return value is 'Toronto' , 'Hamilton' ..

        //clears the search results
        $('.space-info').html("")



        //loops through all data
        for(var i = 0, l = _allData.length; i < l; i++){


          var dataCity = _allData[i]['city'].toLowerCase();


          // console.log(desks)
          if (city != 'all'){


            // if the chosen city is equal to the city selected in the list and desks is not changed


            if(dataCity === city && desks === 1 ) {
              console.log(_allData[i]['id'])
              populate(i)
            }
            else if( dataCity === city && desks != 1 ){
              // console.log(dataCity);
              // console.log(city)
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
        // console.log(desks)
        $('.space-info').html("")

        for(var i = 0, l = _allData.length; i < l; i++){

          if (city != 'all'){

            if(_allData[i]['city'].toLowerCase() === city && _allData[i]['available_desks'] >= desks)

            populate(i)
          }
          else{
            // console.log('this is the final else')
            if(_allData[i]['available_desks'] >= desks){
              populate(i)
            }
          }
        }
        //places desk value in query string to be used on following page in
        //request form desk value
        querystring = EncodeQueryData(desks);
        // event.preventDefault();
        function EncodeQueryData(desks) {
        var ret = [];
        for (var d in desks)
          ret.push(encodeURIComponent(desks[d]));
          return ret.join("");
       }
      //  console.log(querystring)
       localStorage.setItem('desks', querystring);
      });

      }).fail(function(data){
      console.log('this failed')
    });

      if($('div').is('.index-page')){
        localStorage.setItem('desks', 1);
      };

      if($('span').is('#total-price-value')){
        var loadDesks = String(localStorage.desks)
        console.log(loadDesks)
        var price = $('span#pricenumber').text();
        console.log(price)
        $('span#total-price-value').text(loadDesks * price + ".0");
      }
  });

 });


   function previewpic(env, tagid, selecttag, old=false){
     var files = event.target.files;
     var image = files[0]
     var reader = new FileReader();

     reader.onload = function(file){
       var img = new Image();
       console.log(file);
       img.src = file.target.result;
       if(!old){
         selecttag.html(img).attr('id', tagid).appendTo('#upload_pictures');
       }else{
         selecttag.html(img).attr('id', tagid);
       }
     }

     reader.readAsDataURL(image);
     console.log(files);
   };

 $('input[type=file]').on('change', function(event){
   number = parseInt($(this).attr('id').split('_')[3]);
   console.log(number);
   previewpic(event, $(this).attr('id'), $('div.imagetags').eq(number), true);
 });

 $('form').on('cocoon:after-insert', function(e, newthing){

   newthing.find('input[type=file]').on('change', function(event){

     previewpic(event, newthing.find('input[type=file]').attr('id'), $('<div>'));

   });

 });

$('form').on('cocoon:after-remove', function(e,removething){

  var fileid = removething.find('input[type=file]').attr('id');
  $('div#'+fileid).remove();


});

});








// $( ".inner" ).wrap( "<div class='new'></div>" );
