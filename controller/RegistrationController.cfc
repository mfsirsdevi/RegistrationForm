component {

   /**
    * Function to create a record of new user registered.
    * @author R S Devi Prasad
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains passwoed of the user.
    * @return - Returns string value based on whether record created or not.
    */
  remote string function registerUser(string name, string email, string password, string cPassword)
  {
    LOCAL.createUsers = CreateObject("component", "model.UserModel");
    LOCAL.searchUser = LOCAL.createUsers.searchUser(ARGUMENTS.email);
    if(LOCAL.searchUser.getResult().recordCount EQ 0) {
      LOCAL.isRegistered = LOCAL.createUsers.createUser(ARGUMENTS.name, ARGUMENTS.email, ARGUMENTS.password);
      if(LOCAL.isRegistered EQ "true")
        return "Congrats, you have successfully submitted the form";
      else
        return "There are some errors in registration details";
    }
    return "Email Already Exists!";
  }
}