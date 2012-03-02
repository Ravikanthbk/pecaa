$(document).ready(function() {
  $('a[rel*=facebox]').facebox({
  loadingImage : '/assets/loading.gif'
  //closeImage   : '/assets/closelabel.png'
  })

  $(".btnCancel").live('click', function(){
    $("#facebox").hide()
    $("#facebox_overlay").hide()      
  })
})

