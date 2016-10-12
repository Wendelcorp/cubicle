document.addEventListener("turbolinks:load", function() {

$(function(){

var querystring

  $.ajax({
    url: "/images.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){

    var imgHash = data


    $.ajax({
      url: "/spaces.json",
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(data){
      var _allData = data
      console.log(_allData)
      // globalish variables for all data and empty array for available data
      var _availableData = []
      var city = 'all';
      var desks = 1;
      // console.log(_allData[0])
      // console.log(_allData[0]['id'])

      function populate(i) {
        $("<div>").attr('id', _allData[i]['id']).attr('class', 'space-box').appendTo('.space-info') // .html('_allData[i]['name']')
        $('<p>').attr('class', 'space-price').html('$' + Number(_allData[i]['price']).toFixed(2)).appendTo("#" + _allData[i]['id'])
        $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).attr('id', 'link' + _allData[i]['id']).appendTo("#" + _allData[i]['id'])
        $('<img>').attr('class','front-page-img').attr('src',  imgHash[parseInt(_allData[i]['id'])]).appendTo('#link' + _allData[i]['id'])
        $('#link' + _allData[i]['id']).wrap( "<div class='front-page-img-container' id = '"+ _allData[i]['id'] + "' ></div>");
      }
      function hoverOnAndOff(){
        $('.front-page-img-container').mouseenter(function(event){
        value = parseInt(this.id); // starts at 1
          console.log(value)
          $(this).stop().animate({opacity:.5},200);
          $('<div>').html(_allData[value-1]['name']).attr('class','name').css("position", "absolute").css("top", "50px").css('font-weight', 'bold').appendTo('#'+value)
          $('<div>').html("Available Desks: " + _allData[value-1]['available_desks']).attr("class",'available_desks').css("position", "absolute")
          .css("top", "65px").css('font-weight', 'bold').appendTo('#'+value)
      });
        $('.front-page-img-container').mouseleave(function(event){
          $('.available_desks').remove()
          $('.name').remove()
          $(this).stop().animate({opacity:1},200);
      });
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
            // console.log(desks)
            // console.log(city)
            // console.log(dataCity)

            if(dataCity === city && desks === 1 ) {

              populate(i)
            }
            else if( dataCity === city && desks != 1 ){

              console.log(city)
              if(_allData[i]['available_desks'] >= desks){
                populate(i)
              }
            }
          }
          else{

            if(_allData[i]['available_desks'] >= desks){

              populate(i)
            }
          }
        }
        hoverOnAndOff()

      });

      $('#number-of-desks').change(function(event){

        desks = parseInt(this.value);

        $('.space-info').html("")

        for(var i = 0, l = _allData.length; i < l; i++){

          if (city != 'all'){

            if(_allData[i]['city'].toLowerCase() === city && _allData[i]['available_desks'] >= desks){

              populate(i);
            }
          }
          else{

            if(_allData[i]['available_desks'] >= desks){
              populate(i)
            }
          }
        }

        hoverOnAndOff();

       localStorage.setItem('desks', desks);
      });

      hoverOnAndOff();

      }).fail(function(data){
      console.log('this failed');

    });

      if($('div').is('.index-page')){
        localStorage.setItem('desks', 1);
      };//parseFloat(Math.round((loadDesks * price) * 100) / 100).toFixed(2);

      if($('span').is('#total-price-value')){
        var loadDesks = localStorage.desks
        console.log(loadDesks)
        var price = $('span#pricenumber').text();
        console.log(price)
        var total = parseFloat(Math.round((loadDesks * price) * 100) / 100).toFixed(2)
        $('span#total-price-value').text(total);
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
