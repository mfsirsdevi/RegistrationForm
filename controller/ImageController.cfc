component {

      include "../include/include.cfm";

   /**
    * Function to create a record of new user uploaded image.
    * @author R S Devi Prasad
    * @param form
    * @return - Returns struct consisting of success and data.
    */
  remote struct function uploadImage() returnformat = "JSON" {
    LOCAL.imageUploader = CreateObject("component", "model.ImageModel");
    LOCAL.responseObj = {};
    LOCAL.baseUrl = "D:\Projects\RegistrationForm\assets\img\";
    LOCAL.imageName = fileUpload(LOCAL.baseUrl & "profileImage_" & "#dateFormat(now())#" & ".jpg", "image", "image/jpeg", "makeunique");
    try {
        LOCAL.isUploaded = LOCAL.imageUploader.uploadImage(LOCAL.baseUrl & LOCAL.imageName.serverfilename & "." & imageName.serverfileext);
        if(LOCAL.isUploaded EQ true) {
          LOCAL.responseObj.Success = true;
          LOCAL.responseObj.data = "Congrats, you have successfully submitted the form";
        }
        else{
          LOCAL.responseObj.Success = false;
          LOCAL.responseObj.data = "There are some errors in uploading the data";
        }
      return LOCAL.responseObj;  
    }
    catch (any exception) {
      error.errorLog(exception);
    }
  }
}