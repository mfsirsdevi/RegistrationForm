<!DOCTYPE html>
<!-- 
  * File: home.cfm
  * Author: R S Devi Prasad
  * Purpose: homepage of the logged in user
  * Date: 01-05-2017
-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Home Page</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  </head>
  <body>
    <cfif SESSION.isLogged EQ "false">
      <cflocation url="../views/login.cfm" addToken="false"></cflocation>
    </cfif>
    <cfset controllerObject = CreateObject("component", "controller.RegistrationController") />
    <cfif structKeyExists(form, "logoutbtn")>
      <cfset VARIABLES.logout = controllerObject.logoutUser() />
    </cfif>
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.cfm">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Name <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li>
              <cfform>
                <button class="btn btn-block" type= "submit" name= "logoutbtn">
                  <i class="fa fa-btn fa-sign-out"></i>Logout
                </button>
              </cfform>
            </li>            
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
    <div class="container">
        <h1 class="text-center">Home Page </h1>
        <div class="row">
        <div class="col-md-10 col-md-offset-1">
            
            <h3>Hi, This is your home page</h3>
            <table class="table table-striped table-hover table-bordered">
              <tr class="row">
                <th class="col-md-6">Name</th>
                <td class="col-md-6">
                  <cfoutput> #SESSION.name# </cfoutput>
                </td>
              </tr>
              <tr class="row">
                <th class="col-md-6">Email</th>
                <td class="col-md-6">
                  <cfoutput> #SESSION.email# </cfoutput>
                </td>
              </tr>
            </table>
        </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.js"></script>
  </body>
</html>