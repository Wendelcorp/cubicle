document.addEventListener("turbolinks:load", function () {

  $(function(){

    $('#new_message').on('submit', function(){
      event.preventDefault();

      if($('#message_content').val()===""){
        return false;
      }


      $.ajax({
        url: this.action,
        data: $(this).serialize(),
        method: "post"
      }).done(function(response){

        $('#message_content').val("");

      });
    });
  });
});
