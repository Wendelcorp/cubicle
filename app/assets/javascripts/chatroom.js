document.addEventListener("turbolinks:load", function () {
  $(function(){
  $('.messages').scrollTop( function() { return this.scrollHeight; } );  
  $('.messages').bind("DOMNodeInserted", function(){

    $('.messages').scrollTop( function() { return this.scrollHeight; } );
  });
});
});
