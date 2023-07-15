public class WelcomeExaminationScreenCont {
     public String  userid{set;get;}
    public String password{set;get;}   
    public String value{set;get;}
   
    

    
    public PageReference	submit(){
                 if(userid !=null && password !=null &&userid !='' && password !=''){
            List<registration__c> accLst = new List<registration__c>();
            accLst = [select Username__c,password__c from registration__c where Username__c =:userid];
               
            if(accLst !=null && accLst.size()>0){
                value= 'ExamPage';
                  
                
       
            }else{
                 apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'No Username found please register first'));
                	
               value= 'WelcomeExaminationScreen';
           
            }

            
        } else{
            
                 apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'Please enter User Name'));
             value= 'WelcomeExaminationScreen';
        }
         PageReference	 pageRef =new PageReference(Site.getBaseURL() +'/apex/'+value+'?&Username='+userid+'&password='+password+'&nooverride=1');  
        
        pageRef.setRedirect(true);                   
                    return pageRef;
       
                
    }
   
    public PageReference RegisterMethod(){
         PageReference    pageRef = new PageReference('/apex/LoginRegistration');    
        pageRef.setRedirect(true);
          return pageRef;
       

    
    }       
   
        
        
        
    }