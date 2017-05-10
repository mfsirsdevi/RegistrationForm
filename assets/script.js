$(document).ready(function(){
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
			passwordConfirm: {
				required: true,
				equalTo: password
			}
		}
	});
	
	$("#login-user").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 5
			}
		}
	});
});