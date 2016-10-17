document.addEventListener("turbolinks:load", function() {

$(function(){

var querystring

  $.ajax({
    // ajax get of all the first inamges from each space
    url: "/images.json",
    method: 'GET',
    data: {},
    dataType: 'json'
  }).done(function(data){
    // image hash has the space id as the key and image location as the value
    var imgHash = data


    $.ajax({
      //ajax get for all the space information 
      url: "/spaces.json",
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(data){
      var _allData = data
      // variables for all data that will need to be used outside of functions
      var city = 'all';
      var desks = 1;

      function populate(i) {
        // mimics the original html that gets cleared to repopulate the page with the correct information
        $("<div>").attr('id', i).attr('class', 'space-box').appendTo('.space-info')
        $('<p>').attr('class', 'space-price').html('$' + Number(_allData[i]['price']).toFixed(2)).appendTo("#" + i)
        $('<a>').attr('class', 'show-btn').attr('href', '/spaces/' + _allData[i]['id']).attr('id', 'link' + _allData[i]['id']).appendTo("#" + i)
        $('<img>').attr('class','front-page-img').attr('src',  imgHash[parseInt(_allData[i]['id'])]).appendTo('#link' + _allData[i]['id'])
        $('#link' + _allData[i]['id']).wrap( "<div class='front-page-img-container' id = '" + (i) + "container' ></div>");
      }
      function hoverOnAndOff(){
        // function used for hovering over the images on the first page, 
        // this function only takes in the incrementing index of that image to populate it with the 
        $('.front-page-img-container').mouseenter(function(event){
        value = parseInt(this.id);
          $(this).stop().animate({opacity:.5},200);
          $('<div>').html(_allData[value]['name']).attr('class','name').css("position", "absolute").css("top", "50px").css('font-weight', 'bold').appendTo('#'+(value))
          $('<div>').html("Available Desks: " + _allData[value]['available_desks']).attr("class",'available_desks').css("position", "absolute")
          .css("top", "65px").css('font-weight', 'bold').appendTo('#'+(value))
      });
        // when the mouse leaves the image, remove all the appended information and return opacity to normal
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

        //clears the search results
        $('.space-info').html("")



        //loops through all data
        for(var i = 0, l = _allData.length; i < l; i++){


          var dataCity = _allData[i]['city'].toLowerCase();

          // if the cities are not all 
          if (city != 'all'){


            // if the chosen city is equal to the city selected in the list and desks is not changed

            if(dataCity === city && desks === 1 ) {
              populate(i)
            }
            else if( dataCity === city && desks != 1 ){
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
      };
      if($('span').is('#total-price-value')){
        var loadDesks = localStorage.desks
        var price = $('span#pricenumber').text();
        var totalPrice = parseFloat(Math.round((loadDesks * price) * 100) / 100).toFixed(2)
        $('span#total-price-value').text(totalPrice);
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
<<<<<<< HEAD
=======

>>>>>>> bugs
