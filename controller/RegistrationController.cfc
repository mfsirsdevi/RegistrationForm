component {

      include "../include/include.cfm";

   /**
    * Function to create a record of new user registered.
    * @author R S Devi Prasad
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains password of the user.
    * @param string cPassword - re-typed password
    * @return - Returns string value based on whether record created or not.
    */
  remote struct function registerUser(string name, string email, string password) returnformat = "JSON" {
    LOCAL.createUsers = CreateObject("component", "model.UserModel");
    LOCAL.responseObj = {};

    try {
      LOCAL.searchUser = LOCAL.createUsers.searchUser(ARGUMENTS.email);
      if(LOCAL.searchUser.getResult().recordCount EQ 0) {
        LOCAL.isRegistered = LOCAL.createUsers.createUser(ARGUMENTS.name, ARGUMENTS.email, ARGUMENTS.password);
        if(LOCAL.isRegistered EQ true) {
          LOCAL.responseObj.Success = true;
          LOCAL.responseObj.data = "Congrats, you have successfully submitted the form";
        }
        else{
          LOCAL.responseObj.Success = false;
          LOCAL.responseObj.data = "There are some errors in registering your details";
        }
      } else {
        LOCAL.responseObj.Success = false;
          LOCAL.responseObj.data = "Sorry but the email already Exists!";
      }
      return LOCAL.responseObj;  
    }
    catch (any exception) {
      error.errorLog(exception);
    }
  }
}