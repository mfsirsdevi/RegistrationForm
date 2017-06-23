<!DOCTYPE html>
<!-- 
  * File: index.cfm
  * Author: R S Devi Prasad
  * Purpose: registration page for new users
  * Date: 01-05-2017
-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Registration Form</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  </head>
  <body>
    <div class="container">
        <h1 class="text-center">Registration Form </h1>
        <!--- <cfset controllerObject = CreateObject("component", "controller.RegistrationController")/>
        <cfif StructKeyExists(form, "registerbtn")>
          <cfset message = controllerObject.registerUser(name = "#form.name#", email = "#form.email#", password = "#form.password#", cPassword = "#form.cpassword#")/>
        </cfif> --->
        <div id="error-msg" class="text-center">
            <!--- <cfif IsDefined("message")>
                <cfoutput> "#message#" </cfoutput>
            </cfif> --->
        </div>
        <div id="mainspace">
            <cfform class="form-horizontal" id="register-user">
            <div class="form-group">
                <label for="name" class="col-md-4 control-label">Name</label>
                <div class="col-md-6">
                    <cfinput id="name" type="text" class="form-control" name="name">
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="col-md-4 control-label">E-Mail Address</label>
                <div class="col-md-6">
                    <cfinput id="email" type="email" class="form-control" name="email">
                </div>
            </div>

            <div class="form-group">
                <label for="password" class="col-md-4 control-label">Password</label>

                <div class="col-md-6">
                    <cfinput id="password" type="password" class="form-control" name="password">
                </div>
            </div>

            <div class="form-group">
                <label for="passwordConfirm" class="col-md-4 control-label">Confirm Password</label>

                <div class="col-md-6">
                    <cfinput id="passwordConfirm" type="password" class="form-control" name="cpassword">
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-6 col-md-offset-4">
                    <button name="registerbtn" type="submit" class="btn btn-primary">
                        <i class="fa fa-btn fa-user"></i> Register
                    </button>
                </div>
            </div>
            </cfform>
        </div>
    </div>
    <div class="modal fade" id="success-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Success!</h4>
      </div>
      <div class="modal-body">
        <p>Congrats, you have successfully submitted the form</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
    <script src="http://code.jquery.com/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
    <script src="assets/jqueryvalidation/dist/jquery.validate.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>