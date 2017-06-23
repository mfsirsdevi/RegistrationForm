$(document).ready(function(){
	var mainspace = $("#mainspace");
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

	$(mainspace).on("click", "#form-btn", function() {
		var addHTML = '<form class="form-horizontal" id="register-user"><div class="form-group"><label for="name" class="col-md-4 control-label">Name</label><div class="col-md-6"><input id="name" type="text" class="form-control" name="name"></div></div><div class="form-group"><label for="email" class="col-md-4 control-label">E-Mail Address</label><div class="col-md-6"><input id="email" type="email" class="form-control" name="email"></div></div><div class="form-group"><label for="password" class="col-md-4 control-label">Password</label><div class="col-md-6"><input id="password" type="password" class="form-control" name="password"></div></div><div class="form-group"><label for="passwordConfirm" class="col-md-4 control-label">Confirm Password</label><div class="col-md-6"><input id="passwordConfirm" type="password" class="form-control" name="cpassword"></div></div><div class="form-group"><div class="col-md-6 col-md-offset-4"><button name="registerbtn" type="submit" class="btn btn-primary"><i class="fa fa-btn fa-user"></i> Register</button></div></div></form>';
		$(mainspace).empty();
		$("#error-msg").empty();
		$(mainspace).append(addHTML);
	});

	$(mainspace).on("submit", "#register-user", function (event) {
		event.preventDefault();
		var name = $("#name");
		var email = $("#email");
		var password = $("#password");
		var cPassword = $("#passwordConfirm");
		if ($(this).valid()) {
			$.ajax({
		        type:'post',
		        url: "../../controller/RegistrationController.cfc?method=registerUser" ,
		        data:{'name':$(name).val(), 'email':$(email).val(), 'password':$(password).val(), 'cPassword':$(cPassword).val()},
		        success:function(data){
		        	var responseObj = $.parseJSON(data);
		        	//$('#success-modal').modal('show');
		        	if(responseObj.SUCCESS) {
		        		var addHTML = '<button id="form-btn" class="btn btn-primary pull-left">Register Again</button><h3 class="text-center">Congrats, you have successfully submitted the form</h3>';
		        		$(mainspace).empty();
		        		$("#error-msg").empty();
		        		$(mainspace).append(addHTML);
		        	}
		        	else {
		        		var addHTML = '<p>' + responseObj.DATA + '</p>';
		        		$("#error-msg").empty();
		        		$("#error-msg").append(addHTML);
		        	}
			    }
			})
		}
	});
});