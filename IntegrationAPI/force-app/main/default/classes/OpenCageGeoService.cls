public with sharing class OpenCageGeoService {
        public static void getReverseGeocoding(String addressId){
            try{    
                //get lattitude & longitude
                BJG__Address__c add = [SELECT id,Name, BJG__Location__latitude__s, BJG__Location__longitude__s,BJG__suburb__c 
                from BJG__Address__c 
                where id  =:addressId 
                and BJG__Location__latitude__s !=null
                and BJG__Location__longitude__s !=null
                with SYSTEM_MODE
                LIMIT 1];   
                String queryParams; 
                if(add.BJG__Location__latitude__s != null && add.BJG__Location__longitude__s !=null){
                    // Reverse Geocoding query
                queryParams = '&q='+add.BJG__Location__latitude__s+','+add.BJG__Location__longitude__s;
                }
                /**For callouts only */
                /**Prepare http request */
                HttpRequest req = new HttpRequest();
                //set endpoint url
                String prepareUrl = System.label.OpenCageAPI_Url+'?key='+System.label.OpenCageAPI_Key+''+queryParams;
                System.debug('url-->'+prepareUrl);
                //url encoding
                String encoded = EncodingUtil.urlEncode(prepareUrl, 'UTF-8');
                req.setEndPoint(prepareUrl);
                //setmethod
                req.setMethod('GET');
                //set headers
                req.setHeader('Content-Type','application/json');
                req.setHeader('Accept','application/json');//json,html.xml.text
                Http http = new Http();
                Httpresponse resp = http.send(req);
               
                if(resp.getStatus() == 'ok' && resp.getStatusCode() ==200){
                    String responsebody = resp.getBody();                    
                    OpenCageResponseWrapper wrapper = (OpenCageResponseWrapper)System.JSON.deserialize(responsebody,OpenCageResponseWrapper.class);
                    if(wrapper?.results?.size()>0){
                        OpenCageResponseWrapper.results reslt = wrapper.results.get(0);
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
                    if(resp.getStatus() == 'Bad request' && resp.getStatusCode() ==400){
                        System.debug('response-->'+resp);
                   }
                }
            }catch(System.CalloutException cx){
                if(String.valueOf(cx).startswith('System.CalloutException:')){
                    System.System.debug('callout exception:'+cx.getMessage());
                }
                
            }catch(System.Exception ex){
                System.System.debug('Exception:'+ex.getMessage());
            }
        }
        public static void getForwardGeocoding(String addressId){
            try{    
                //get lattitude & longitude
                BJG__Address__c add = [SELECT id,Name, BJG__Location__latitude__s, BJG__Location__longitude__s,BJG__suburb__c,BJG__city__c,BJG__state__c,BJG__country__c,BJG__postcode__c 
                from BJG__Address__c 
                where id  =:addressId 
                and BJG__Location__latitude__s !=null
                and BJG__Location__longitude__s !=null
                with SYSTEM_MODE
                LIMIT 1];  
                System.debug('addd-->'+add); 
                String queryParams =  '&q='; 
                    //forward geocoding query
                    if(add.BJG__suburb__c !=null){
                        queryParams +=',+'+add.BJG__suburb__c;
                    }
                    if(add.BJG__city__c !=null){
                        queryParams +=',+'+add.BJG__city__c;
                    }
                    if(add.BJG__state__c !=null){
                        queryParams +=',+'+add.BJG__state__c;
                    }
                    if(add.BJG__country__c !=null){
                        queryParams +=',+'+add.BJG__country__c;
                    }
                    if(add.BJG__postcode__c !=null){
                       queryParams +=',+'+add.BJG__postcode__c;
                    }
                /**For callouts only */
                /**Prepare http request */
                HttpRequest req = new HttpRequest();
                //set endpoint url
                String prepareUrl = System.label.OpenCageAPI_Url+'?key='+System.label.OpenCageAPI_Key+''+queryParams;
                
                if(prepareUrl.contains('&q=,')){
                    prepareUrl = prepareUrl.replaceFirst(',+','');

                }
                System.debug('url-->'+prepareUrl);
                //String encoded = EncodingUtil.urlEncode(prepareUrl, 'UTF-8');
                req.setEndPoint(prepareUrl);
                //setmethod
                req.setMethod('GET');
                //set headers
                req.setHeader('Content-Type','application/json');
                req.setHeader('Accept','application/json');//json,html.xml.text
                Http http = new Http();
                Httpresponse resp = http.send(req);
               
                if(resp.getStatus() == 'ok' && resp.getStatusCode() ==200){
                    String responsebody = resp.getBody();                    
                    OpenCageResponseWrapper wrapper = (OpenCageResponseWrapper)System.JSON.deserialize(responsebody,OpenCageResponseWrapper.class);
                    if(wrapper?.results?.size()>0){
                        OpenCageResponseWrapper.results reslt = wrapper.results.get(0);
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
                      
                       if(reslt.components.postcode == null){
                        add.BJG__postcode__c=add.BJG__postcode__c;      
                        }else{
                            add.BJG__postcode__c= Integer.valueOf(reslt.components.postcode);
                       }
                        
                        add.BJG__road__c= reslt?.components?.road;
                        add.BJG__state__c= reslt?.components?.state;
                        add.BJG__state_code__c= reslt?.components?.state_code;
                        add.BJG__suburb__c= reslt?.components?.suburb;
                        update as System add;                    
                    }                    
                   }else{
                    if(resp.getStatus() == 'Bad request' && resp.getStatusCode() ==400){
                System.debug('response-->'+resp);

                    }
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