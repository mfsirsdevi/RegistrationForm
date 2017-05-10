component {
  public boolean function createUser(string name, string email, string password)
  {
    newUser = new Query();
    newUser.setSQL("INSERT into dbo.users (name, email, password) VALUES ('name', 'email', 'password')");
    result = newUser.execute();
    writeDump(result.getResult());
    return "true";
  }
}