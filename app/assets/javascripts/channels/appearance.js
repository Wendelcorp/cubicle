$(document).on("turbolinks:load", function () {
  App.appearance = App.cable.subscriptions.create({
    channel: 'AppearanceChannel'
  }, {
    disconnected: function(){},
    received: function(data){
      var userdata = JSON.parse(data);

      var id = userdata.id;
      var online = userdata.online;

      if(online == true){
        $(userImgIdConstructor(id)).attr('class','active');
      };
      if(online == false){
        $(userImgIdConstructor(id)).attr('class','inactive');
      };
    }
  });

  var userImgIdConstructor = function(id){
    return "#" + id + "-status";
  }
});
