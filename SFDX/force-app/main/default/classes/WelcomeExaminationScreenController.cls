public class WelcomeExaminationScreenController {
       public String  userid{set;get;}
    public String password{set;get;}   
    
   
    

    
    public PageReference submit(){
        
       /* if(userid !=null && password !=null &&userid !='' && password !=''){*/
            List<registration__c> accLst = new List<registration__c>();
            accLst = [select Username__c,password__c from registration__c where Username__c =:userid];
               
            if(accLst !=null && accLst.size()>0){
                
                
       
            }else{
                 apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'No Username found please register first'));
                	
               
           
            }

            
         /*else{
            
                 apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'Please enter User Name'));
             
           
           

        }*/
        PageReference pr= Page.ExamPage;
        pr.getParameters().put('userid',userid);
        pr.getParameters().put('password',password);
        pr.setRedirect(true);
         return pr;
        
        
        
         
                
    }
   
    public PageReference RegisterMethod(){
         PageReference    pageRef = new PageReference('/apex/LoginRegistration');    
        pageRef.setRedirect(true);
          return pageRef;
       

    
    }       
  public PageReference SubmitMethod(){
      	 PageReference	 pageRef =new PageReference(Site.getBaseURL() +'/apex/ExamPage?&Username='+userid+'&password='+password+'&nooverride=1');  
        
        pageRef.setRedirect(true);
   /*        WelcomeExaminationScreenController en= new WelcomeExaminationScreenController();
        Examination__c  obj = new Examination__c ();
        obj.User_Name__c=userid;
        obj.password__c=password;
          insert obj;    */
                      
                    return pageRef;
        
        
        
    }

    

               

    
    
    
}