component {

  /**
    * Function to create a record of new user.
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains password of the user.
    * @return - Returns boolean value based on whether record created or not.
    */
    
  public boolean function createUser(string name, string email, string password)
  {
    
    var pwd = Hash(password);
    newUser = new Query();
    newUser.setSQL("INSERT into dbo.users (name, email, password) VALUES (:name, :email, :password)");
    newUser.addParam( name = "name", value = "#arguments.name#", cfsqltype = "cf_sql_varchar" );
    newUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
    newUser.addParam( name = "password", value = "#LOCAL.pwd#", cfsqltype = "cf_sql_varchar" );
    result = newUser.execute();
    return "true";
  }
  
  /**
    * Function to search a user from database.
    * @param string email - contains email of the user.
    * @return - Returns string value based on whether record created or not.
    */
  
  public any function searchUser(string email)
  {
    checkUser = new Query();
    checkUser.setSQL("SELECT * FROM dbo.users WHERE email = :email");
    checkUser.addParam( name = "email", value = "#arguments.email#", cfsqltype = "cf_sql_varchar" );
    returnValue = checkUser.execute();
      return returnValue;
  }
}