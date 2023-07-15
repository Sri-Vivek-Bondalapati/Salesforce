public class CaseCreateController {
    public String currentlang{set;get;}
    public Case caseobj{set;get;}
    
  public  CaseCreateController()
    {
        caseobj = new Case();
     
        currentlang=ApexPages.currentPage().getParameters().get('selectlang');
       
   
    }

}