
@restResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    global CaseCloseResource() {

    }
    @httpPost
    global static void closeCase (String reason){
    // Parse context
    RestRequest req = RestContext.request;
    String[] uriParts = req.requestURI.split('/');
    Id caseId = uriParts[2];
    // Call the service
    CaseService.closeCases(
        new Set<Id> { caseId }, reason);
}
}