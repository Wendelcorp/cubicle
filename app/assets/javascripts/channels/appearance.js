$(document).on("turbolinks:load", function () {
  App.appearance = App.cable.subscriptions.create({
    channel: 'AppearanceChannel'
  }, {
    received: function(data){
      var user = JSON.parse(data)
      if(user.online == true){
        $(userImgIdConstructor(user)).attr('class','active');
      };
      if(user.online == false){
        $(userImgIdConstructor(user)).attr('class','inactive');
      };
    }
  });

  var userImgIdConstructor = function(user){
    return "#" + user.id + "-status";
  }
});
