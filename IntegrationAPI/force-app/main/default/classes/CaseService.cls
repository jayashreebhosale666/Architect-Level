public with sharing class CaseService {
    public CaseService() {

    }
    public static void closeCases(Set<Id> casesIds,String reason){
        if(casesIds==null || casesIds.size()==0){
            throw new CaseServiceException('Cases not specified');
        }
        if(String.isEmpty(reason)){
            throw new CaseServiceException('Reason not specified');
        }
        List<case> cases = [SELECT caseNumber, Reason,Status FROM case WHERE Id IN :casesIds];
        for(case cc : cases){
                cc.reason = reason;
                cc.Status = 'Closed';
            }
            SavePoint sp = Database.setSavePoint();
            try{
                update cases;
            } catch (Exception e) {
                // Rollback
                Database.rollback(sp);
                // Throw exception on to caller
                throw e;
            }
    }
    public class CaseServiceException extends Exception {}

}