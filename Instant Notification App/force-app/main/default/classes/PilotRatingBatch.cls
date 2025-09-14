global class PilotRatingBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        //Intentionally skip Pilot__r.Pilot_Rating__c field from the SOQL query to force the error: SObject row was retrieved via SOQL without querying the requested field: Mission__c.Pilot__r. 
        //Do not update the SOQL query for the solution.
        return Database.getQueryLocator('SELECT Id, Completion_Rating__c, Overall_Rating__c, Safety_Incidents__c, Pilot__c FROM Mission__c WHERE Status__c = \'Complete\'');
        
    }
    
    global void execute(Database.BatchableContext bc, List<Mission__c> scope) {
        try {
            // Your batch processing logic        
            List<Contact> contactList = new List<Contact>();
            for(Mission__c mission : scope){
                
                Double weightedCompletionRate = 0.3 * mission.Completion_Rating__c;
                Double weightedSafetyIncidents = -0.5 * mission.Safety_Incidents__c;
                
                Double newOverallRating;
                newOverallRating = mission.Pilot__r.Pilot_Rating__c + mission.Overall_Rating__c;
                mission.Pilot__r.Pilot_Rating__c = newOverallRating;
                contactList.add(mission.Pilot__r);
            }
            
            update contactList;
        }
        catch (Exception e) {
            publishErrorEvent(e.getMessage(), BC);
        }
    }
    
    global void finish(Database.BatchableContext bc) {
    }
    
    private void publishErrorEvent(String errorMessage, Database.BatchableContext BC) {
        try {
            // Create and publish the error event
            Pilot_Rating_Error_Event__e errorEvent = new Pilot_Rating_Error_Event__e(
               // MissionId__c = mission.Id,
                Error_Message__c = errorMessage,
                Async_Apex_Job_Id__c = BC.getJobId(),
                CreatedDate__c = System.now()
            );
            // Publish the event
            EventBus.publish(new List<Pilot_Rating_Error_Event__e>{errorEvent});
        } catch (Exception e) {
            System.debug('Error while publishing event: ' + e.getMessage());
        }
    }
}