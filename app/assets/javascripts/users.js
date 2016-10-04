document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('button.status').click(function(e){
      if(confirm('Are you sure you want to ' + $(this).attr('name') + ' this lease?')){
        $.ajax({
          url:'/spaces/' + $(this).attr('data-spaceid') + '/leases/' + $(this).attr('id'),
          method: 'put',
          data:{ status :$(this).attr('name') },
          dataType: 'json'
        }).done(function(response){
          $('span#' + response.id).text('Current Status: ' + response.name);
          console.log('button#' + response.id);
          $('button#' + response.id + '.status').remove();
        });
      } else {};
    });
  });
});
