public class welcomeController {
   
    public String selectedlanguage{set;get;}
    
      public List<SelectOption> getlanguages()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('en','English')); 
        options.add(new SelectOption('fr','Français')); 
        options.add(new SelectOption('es','Español')); 
        return  options;  

    }

    public PageReference GOMethod()
    {
        
        System.debug('Selected Language '+selectedlanguage);
        
        PageReference    pageRef = new PageReference(Site.getBaseURL() +'/apex/createcase?&sellang='+selectedLanguage+'&nooverride=1');    
        pageRef.setRedirect(true);
        return pageRef;
    }


}