public with sharing class OpenCageGeoService {
        public static void getExchangeRates(String addressId){
            try{    
                //get lattitude & longitude
                BJG__Address__c add = [SELECT id,Name, BJG__Location__latitude__s, BJG__Location__longitude__s 
                from BJG__Address__c 
                where id  =:addressId 
                and BJG__Location__latitude__s !=null
                and BJG__Location__longitude__s !=null
                LIMIT 1];    
                String queryParams = '&q='+add.BJG__Location__latitude__s+','+add.BJG__Location__longitude__s;
                /**For callouts only */
                /**Prepare http request */
                HttpRequest req = new HttpRequest();
                //set endpoint url
                String prepareUrl = System.label.OpenCageAPI_Url+'?key='+System.label.OpenCageAPI_Key+''+queryParams;
                System.debug('url-->'+prepareUrl);
                req.setEndPoint(System.label.OpenCageAPI_Url+'?key='+System.label.OpenCageAPI_Key+''+queryParams);
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
                    String responsebody = resp.getBody();                    
                    OpenCageResponseWrapper wrapper = (OpenCageResponseWrapper)System.JSON.deserialize(responsebody,OpenCageResponseWrapper.class);
                    if(wrapper?.results?.size()>0){
                        OpenCageResponseWrapper.results reslt = wrapper.results.get(0);
                       //System.debug('road-->'+reslt?.components?.road);
                       //System.debug('category-->'+reslt?.components?.category);
                        //System.debug('distance_from_q.meters-->'+reslt?.distance_from_q?.meters);
                        System.debug('geometry.latitude-->'+reslt?.geometry?.lat);
                        System.debug('geometry.langitude-->'+reslt?.geometry?.lng);
                        add.BJG__city__c= reslt?.components?.city;
                        add.BJG__city_district__c= reslt?.components?.city_district;
                        add.BJG__continent__c= reslt?.components?.continent;
                        add.BJG__country__c= reslt?.components?.country;
                        add.BJG__country_code__c= reslt?.components?.country_code;
                        add.BJG__county__c= reslt?.components?.county;
                        add.BJG__formatted__c= reslt?.formatted;
                        add.BJG__house_number__c= reslt?.components?.house_number;
                        add.BJG__office__c= reslt?.components?.office;
                        add.BJG__political_union__c= reslt?.components?.political_union;
                        add.BJG__postcode__c= Integer.valueOf(reslt?.components?.postcode);
                        add.BJG__road__c= reslt?.components?.road;
                        add.BJG__state__c= reslt?.components?.state;
                        add.BJG__state_code__c= reslt?.components?.state_code;
                        add.BJG__suburb__c= reslt?.components?.suburb;
                        update as System add;                    
                    }                    
                   }else{
                    //error handling code goes here...
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