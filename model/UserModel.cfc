component {

  include "../include/include.cfm";

  /**
    * Function to create a record of new user.
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains password of the user.
    * @return - Returns boolean value based on whether record created or not.
    */
    
  public boolean function createUser(required string name, required string email, required string password)
  {
    try{
      LOCAL.pwd = Hash(password);
      LOCAL.newUser = new Query();
      LOCAL.newUser.setSQL("INSERT into dbo.users (name, email, password) VALUES (:name, :email, :password)");
      LOCAL.newUser.addParam( name = "name", value = "#ARGUMENTS.name#", cfsqltype = "cf_sql_varchar" );
      LOCAL.newUser.addParam( name = "email", value = "#ARGUMENTS.email#", cfsqltype = "cf_sql_varchar" );
      LOCAL.newUser.addParam( name = "password", value = "#LOCAL.pwd#", cfsqltype = "cf_sql_varchar" );
      LOCAL.result = LOCAL.newUser.execute();
      if(LOCAL.result.getPrefix().recordcount EQ 1)
        return true;
      return false;
    }
    catch(any exception) {
      error.errorLog(exception);
      return false;
    }
  }
  
  /**
    * Function to search a user from database.
    * @param string email - contains email of the user.
    * @return - Returns string value based on whether record created or not.
    */
  
  public struct function searchUser(string email)
  {
    LOCAL.checkUser = new Query();
    LOCAL.checkUser.setSQL("SELECT * FROM dbo.users WHERE email = :email");
    LOCAL.checkUser.addParam( name = "email", value = "#ARGUMENTS.email#", cfsqltype = "cf_sql_varchar" );
    LOCAL.returnValue = LOCAL.checkUser.execute();
    return LOCAL.returnValue;
  }
}