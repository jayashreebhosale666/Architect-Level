public with sharing class CurrentApiService {
    public CurrentApiService() {
        
    }
    public static void getExchangeRates(){
        try{        
            /**For callouts only */
            /**Prepare http request */
            HttpRequest req = new HttpRequest();
            //set endpoint url
            req.setEndPoint('https://open.er-api.com/v6/latest/USD');
            //setmethod
            req.setMethod('GET');
            //set headers
            req.setHeader('Content-Type','application/json');
            req.setHeader('Accept','application/json');//json,html.xml.text
            Http http = new Http();
            Httpresponse resp = http.send(req);
            /** httpsresponse methods
* https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_classes_restful_http_httpresponse.htm
*/
            if(resp.getStatus() == 'ok' && resp.getStatusCode() ==200){
                String responsebody = '{"description":"An appliance","accessories":["powerCord",{"right":"door handle1","left":"door handle2"}],"dimensions":{"height":5.5,"width":3,"depth":2.2},"type":null,"inventory":2000,"price":1023.45,"isShipped":true,"modelNumber":"123"}';
                //Map<String, String> results = (Map<String, String>) JSON.deserializeUntyped(responsebody);
                // String rates = results.get('rates');
                //System.debug('Received the following animals:'+results);
                //for (Object rate: rates.values()) {
                //  System.debug(rates);
                // }
                //-------------------------
                String jsonInput = '{\n' +
                    ' "description" :"An appliance",\n' +
                    ' "accessories" : [ "powerCord", ' + 
                    '{ "right":"door handle1", ' + 
                    '"left":"door handle2" } ],\n' +
                    ' "dimensions" : ' + 
                    '{ "height" : 5.5 , ' + 
                    '"width" : 3.0 , ' + 
                    '"depth" : 2.2 },\n' +
                    ' "type" : null,\n' +
                    ' "inventory" : 2000,\n' +
                    ' "price" : 1023.45,\n' +
                    ' "isShipped" : true,\n' +
                    ' "modelNumber" : "123"\n' +
                    '}';
                
                Map<String, Object> m = 
                    (Map<String, Object>)
                    JSON.deserializeUntyped(jsonInput);
                //-------------------------
            }
        }catch(System.CalloutException cx){
            if(String.valueOf(cx).startswith('System.CalloutException:')){
                System.System.debug('callout exception:'+cx.getMessage());
            }
            
        }catch(System.Exception ex){
            System.System.debug('Exception:'+ex.getMessage());
        }
    }
}