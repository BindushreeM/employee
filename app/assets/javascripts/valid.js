function ValidateUser() {
    $("#user_new").validate({
			
	
		rules: 
		{
			"user[email]": {required: true, email: true},
			"user[password]":{required:true },
			"user[password_confirmation]":{	required:true, equalTo: "#user_password" },
			"user[phone_number]":{required:true},
			"user[address]":{required:true},

		},
		errorElement: "span",
        errorClass: "help-block",
        highlight: function(element) {
        $(element).parent().addClass("has-error");
        },
        unhighlight: function(element) {
        $(element).parent().removeClass("has-error");
        },
	    messages: 
		{
        	"user[email]" : {required : "Please enter email"},
        	"user[password]" : {required : "Please enter password"},
        	"user[password_confirmation]" : {required : "Please enter password"},
        	"user[phone_number]" : {required: "Please enter phone number"},
        	"user[address]" : {required : "Please enter address"},
        	
        },
          submitHandler: function(form) {
			form.submit();
		}


	});
}
$(document).ready(function()
{
	
	ValidateUser();

});

// $(function() {
//  	$("#gmail").click(function(){
//     $("#gmail").hide();});

// });