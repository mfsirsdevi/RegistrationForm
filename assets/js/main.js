$(document).ready(function(){
	$('#success-modal').modal('hide');
	$("#register-user").validate({
		rules: {
			name: {
				required: true,
				minlength: 5
			},
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 5
			},
			cpassword: {
				equalTo: "#password"
			}
		}
	});

	$("#register-user").on("submit", function (event) {
		event.preventDefault();
		var name = $("#name");
		var email = $("#email");
		var password = $("#password");
		var cPassword = $("#passwordConfirm");
		if ($(this).valid()) {
			$.ajax({
		        type:'post',
		        url: "http://www.registrationform.com/controller/RegistrationController.cfc?method=registerUser" ,
		        data:{'name':$(name).val(), 'email':$(email).val(), 'password':$(password).val(), 'cPassword':$(cPassword).val()},
		        success:function(data){ 
		        	$('#success-modal').modal('show');
		        	console.log("success");
			    },
				error: function( xhr, errorType ){
				    console.log("failure");
				}
			})
		}
	});
});