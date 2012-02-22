$(function(){

				
				
				// Slider
				$('#slider').slider({
					range: true,
					values: [17, 67]
				});
				
							
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});