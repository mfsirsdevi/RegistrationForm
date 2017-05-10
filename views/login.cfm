<!DOCTYPE html>
<!-- 
  * File: login.cfm
  * Author: R S Devi Prasad
  * Purpose: login page for existing users
  * Date: 01-05-2017
-->

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Login Page</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  </head>
  <body>
    <cfif SESSION.isLogged EQ "true">
      <cflocation url="home.cfm" addToken="false"></cflocation>
    </cfif>
    <div class="container">
        <h1 class="text-center">Login Page </h1>
        <cfset controllerObject = CreateObject("component", "controller.RegistrationController")/>
        <cfif StructKeyExists(form, "loginbtn")>
          <cfset message = controllerObject.loginUser(email = "#form.email#", password = "#form.password#")/>
        </cfif>
        <cfif IsDefined("message")>
        <div class="text-center">
            <cfoutput> #message# </cfoutput>
        </div>
        </cfif>
        <cfform class="form-horizontal" id="login-user">
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
                <div class="col-md-6 col-md-offset-4">
                    <button name="loginbtn" type="submit" class="btn btn-primary">
                        <i class="fa fa-btn fa-user"></i> Login
                    </button>
                    <a class="btn btn-link" href="../index.cfm">New User</a>
                </div>
                
            </div>
        </cfform>
    </div>
    <script src="http://code.jquery.com/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
    <script src="../assets/jqueryvalidation/dist/jquery.validate.js"></script>
    <script src="../assets/script.js"></script>
  </body>
</html>