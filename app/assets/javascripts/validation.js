/***************************/
//@Author: Adrian "yEnS" Mato Gondelle & Ivan Guardado Castro
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

$(document).ready(function(){
	//global vars
	var form = $("#new_user");
	var name = $("#user_username");
	var nameInfo = $("#nameInfo");
	var email = $("#user_email");	
	var emailInfo = $("#emailInfo");
	var pass1 = $("#user_password");
	var pass1Info = $("#passInfo");
	var pass2 = $("#pass2");
	var pass2Info = $("#pass2Info");
	var message = $("#message");
	
	//On blur
	name.blur(validateName);
	email.blur(validateEmail);
	pass1.blur(validatePass1);
	pass2.blur(validatePass2);
	//On key press
	name.keyup(validateName);
	pass1.keyup(validatePass1);
	pass2.keyup(validatePass2);
	message.keyup(validateMessage);
	//On Submitting
	form.submit(function(){
		if(validateName() & validateEmail() & validatePass1())
			return true
		else
			return false;
	});
	
	//validation functions
	function validateEmail(){
		//testing regular expression
		var a = $("#user_email").val();
		var filter = /^[a-zA-Z0-9]+[a-zA-Z0-9_.-]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{2,4}$/;
		//if it's valid email
		if(filter.test(a)){
			email.removeClass("error");
			emailInfo.removeClass("error");
			email.addClass("correctField");
			emailInfo.text("");
			return true;
		}
		//if it's NOT valid
		else{
			email.addClass("error");
			emailInfo.text(" Type a valid e-mail please");
			emailInfo.addClass("error");
			email.removeClass("correctField");
			return false;
		}
	}
	function validateName(){
		//if it's NOT valid
		if(name.val().length < 4){
			name.addClass("error");
			nameInfo.text("We want names with more than 3 letters!");
			nameInfo.addClass("error");
			name.removeClass("correctField");
			return false;
		}
		//if it's valid
		else{
			name.removeClass("error");
			name.addClass("correctField");
			nameInfo.text("");
			nameInfo.removeClass("error");
			return true;
		}
	}
	function validatePass1(){
		var a = $("#password1");
		var b = $("#password2");
		$.ajax({
		  url: "/validate_users",
		  context: document.body,
		  success: function(data){
		  	if(data.test(/error/)){
		    pass1.addClass("error");
			pass1Info.text("At least 5 characters: letters, numbers and '_'");
			pass1Info.addClass("error");
			pass1.removeClass("correctField");
			return false;
            }
			else{			
			pass1.removeClass("error");
			pass1Info.text("");
			pass1Info.removeClass("error");
			pass1.addClass("correctField");
			//validatePass2();
			return true;
		}
		  }
		});
		//it's NOT valid
		if(pass1.val().length <5){
			pass1.addClass("error");
			pass1Info.text("At least 5 characters: letters, numbers and '_'");
			pass1Info.addClass("error");
			pass1.removeClass("correctField");
			return false;
		}
		//it's valid
		else{			
			pass1.removeClass("error");
			pass1Info.text("");
			pass1Info.removeClass("error");
			pass1.addClass("correctField");
			//validatePass2();
			return true;
		}
	}
	
});
