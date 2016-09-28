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
      $('.space-info').html("")
      for(var i = 0, l = _allInfo.length; i < l; i++){
        if(_allInfo[i]['city'] === city){
          $('<div>').html("name:" + _allInfo[i]['name']).attr('id', _allInfo[i]['id']).appendTo(".space-info")
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