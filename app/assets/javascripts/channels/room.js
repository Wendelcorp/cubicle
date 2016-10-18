$(document).on("turbolinks:load", function () {
  if (App[window.location.pathname.split("/")[2]] == undefined){
    App[window.location.pathname.split("/")[2]] = App.cable.subscriptions.create({
      channel: 'RoomChannel',
      room: window.location.pathname.split("/")[2]
    },{
      received: function(data){
        $('.messages').append(data.message);
        $('#newmessage').attr('class', 'active');
      }
    });
  }
});
