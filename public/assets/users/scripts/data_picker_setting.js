$(function() {
	$( ".datepicker" ).datepicker({
		showOn: "button",
		buttonImage: "../../../images/calendar.gif",
		buttonImageOnly: true,
		dateFormat: "mm-dd-yy"
	});
});

$('#date_added').click(function(){
  if ($('#date_added').data('checked') == false){
    $('#date_added').data('checked', true)
    $('#date_range').hide();
  }else{
    $('#date_added').data('checked', false)
    $('#date_range').show();
  }
});