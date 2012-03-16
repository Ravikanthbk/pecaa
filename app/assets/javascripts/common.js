//= require tinymce-jquery
$(document).ready(function() {
  $('a[rel*=facebox]').facebox({
  loadingImage : '/assets/loading.gif'
  //closeImage   : '/assets/closelabel.png'
  })

  $(".btnCancel").live('click', function(){
    $("#facebox").hide()
    $("#facebox_overlay").hide()      
  })
  
  $(".btnCancelForm").live('click', function(){
    $("#facebox").hide()
    $("#facebox_overlay").hide()
  })  
//  $(function() {
//    $('textarea').tinymce({
//      width: "98%",
//      height: "50%",
//      theme: 'advanced'
//    });
//  });
})

