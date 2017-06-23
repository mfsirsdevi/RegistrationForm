component {

    this.name = "registrationform";
    this.sessionmanagement = "yes";
    this.applicationTimeout = CreateTimeSpan(0, 0, 20, 0); //10 days
    this.datasource = "registrationformdb";

    function onApplicationStart() {
        return true;
    }

    function onSessionStart() {
    }

    function onRequestStart( string template ) {

      LOCAL.path = {};
      LOCAL.path.basePath = getDirectoryFromPath(getCurrentTemplatePath());

      LOCAL.path.targetPath = getDirectoryFromPath(expandPath( ARGUMENTS.template ));

      LOCAL.path.requestDepth = (listLen( LOCAL.path.targetPath, "\/" ) - listLen( LOCAL.path.basePath, "\/" ));
      REQUEST.webRoot = repeatString("../", LOCAL.path.requestDepth);

      REQUEST.siteUrl = ("http://" & cgi.server_name & reReplace(getDirectoryFromPath( ARGUMENTS.template ), "([^\\/]+[\\/]){#LOCAL.path.requestDepth#}$", "", "one"));

      return true;
    }

    function onRequest( string targetPage ) {
        include ARGUMENTS.targetPage;
        return;
    }

    //function onError( any Exception, string EventName ) {}

}