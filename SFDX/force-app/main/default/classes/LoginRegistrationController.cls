public class LoginRegistrationController {
    
    public String usernamevalue{set;get;}
    public String passvalue{set;get;}
    public String Confirmpassvalue{set;get;}
    
    public void savemethod(){
        registration__c obj= new registration__c();
        obj.Username__c= usernamevalue;
        obj.password__c=passvalue;
        obj.confirm_password__c=Confirmpassvalue;
    

    
    if(usernamevalue==''||usernamevalue==null)
        {
            apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'Please enter User Name'));
        }
        else{
            
            if(passvalue!=Confirmpassvalue)
            {
                apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'password and confirm password should be same'));
            }
            else{
                
            
        insert obj;
        
         apexpages.addMessage(new ApexPages.message(Apexpages.Severity.INFO,'Successfully Inserted'));
                
        }
        }
    }
    public PageReference WelcomeExamination(){
         PageReference    pageRef = new PageReference('/apex/WelcomeExaminationScreen');    
        pageRef.setRedirect(true);
          return pageRef;
        

    
    }
    
    


}