component {

    this.name = "registrationform";
    this.sessionmanagement = "yes";
    this.applicationTimeout = CreateTimeSpan(0, 0, 20, 0); //10 days
    this.datasource = "registrationformdb";

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {
      var SESSION.isLogged = "false";
      var SESSION.email = "";
      var SESSION.name = "";
    }

    // the target page is passed in for reference, 
    // but you are not required to include it
    //function onRequestStart( string targetPage ) {}

    //function onRequest( string targetPage ) {
    //    include arguments.targetPage;
    //}

    //function onRequestEnd() {}

    //function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    //function onApplicationEnd( struct ApplicationScope ) {}

    //function onError( any Exception, string EventName ) {}

}