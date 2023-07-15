public class ExamPageController {
    Public String value1{set;get;}
    public String value2{set;get;}
    public String value3{set;get;}
    public String value4{set;get;}
    public String user{set;get;}
    public String pass{set;get;}
    public  static Integer count=0;
    Public Integer counter{set;get;}
    public List<SelectOption> getquestion1()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('A','A. 3.6')); 
        options.add(new SelectOption('B','B.7.2 ')); 
        options.add(new SelectOption('C','C.8.4')); 
        options.add(new SelectOption('D','D.10'));
        return  options; 
        
       

    }
    public List<SelectOption> getquestion2()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A','A. 300 KMPH')); 
        options.add(new SelectOption('B','B.360 KMPH ')); 
        options.add(new SelectOption('C','C.600 KMPH')); 
        options.add(new SelectOption('D','D.720 KMPH'));
        return options; 
    }
      public List<SelectOption> getquestion3()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A','A. 120 Mtrs')); 
        options.add(new SelectOption('B','B.180 Mtrs ')); 
        options.add(new SelectOption('C','C.150 Mtrs')); 
        options.add(new SelectOption('D','D.324 Mtrs'));
        return options; 
    }
      public List<SelectOption> getquestion4()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A','A. 10')); 
        options.add(new SelectOption('B','B.12 ')); 
        options.add(new SelectOption('C','C.15')); 
        options.add(new SelectOption('D','D.18'));
        return options; 
    }
    
    public PageReference Submit(){
    
    if(value1.equals('A')){
                   count=count+5;
    
    }else{
        
         count=count+0;
    
    }
        
         if(value2.equals('A')){
                   count=count+5;
    
    }else{
        
         count=count+0;
    
    }
         if(value3.equals('C')){
                   count=count+5;
    
    }else{
        
         count=count+0;
    
    }
         if(value3.equals('A')){
                   count=count+5;
    
    }else{
        
         count=count+0;
    
    }
       
          
         WelcomeExaminationScreenController en= new WelcomeExaminationScreenController();
        Examination__c  obj = new Examination__c ();
         user=ApexPages.currentPage().getParameters().get('userid');
         pass=ApexPages.currentPage().getParameters().get('password');
        obj.User_Name__c=user;
        obj.password__c=pass;
        obj.Score__c =count;
       
          insert obj;  
         PageReference pageRef= new PageReference('/apex/ResultPage?&Result='+count+'&nooverride');
        pageRef.setRedirect(true);
        return pageRef;
        
        
        
        
    }
    public   ExamPageController(){

    
    counter =5;
    
    }
    
     
    public void callMethod(){
        
            counter--;
            
        
        if(counter== 0){
            
  
        apexpages.addMessage(new ApexPages.message(Apexpages.Severity.INFO,'Time up Please Submit ur Exam'));
        }
        
    
    
    
    
    }
    
    
    
    
    
    
    
   
}