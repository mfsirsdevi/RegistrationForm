component {

  include "../include/include.cfm";

  /**
    * Function to create a record of new user.
    * @param string name - contains name of the user.
    * @param string email - contains email of the user.
    * @param string password - contains password of the user.
    * @return - Returns boolean value based on whether record created or not.
    */
    
  public boolean function uploadImage(required string name)
  {
    try{
      LOCAL.newUser = new Query();
      LOCAL.newUser.setSQL("INSERT into dbo.media (mediaName) VALUES (:name)");
      LOCAL.newUser.addParam( name = "name", value = "#ARGUMENTS.name#", cfsqltype = "cf_sql_varchar" );
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
  
}