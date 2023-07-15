public class welcomeControllerr {
    public String selectedlanguage{set;get;}
    
        public List<SelectOption> getlanguages()
    {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('en','English')); 
        options.add(new SelectOption('fr','Français')); 
        options.add(new SelectOption('es','Español')); 
        return  options;  

    }
    public PageReference GoMethod()
    {
       System.debug('selectedLanguage---->'+selectedLanguage);
          PageReference    pageRef = new PageReference(Site.getBaseURL() +'/apex/CaseCreate?&selectlang='+selectedLanguage+'&nooverride=1');    
       pageRef.setRedirect(true);
        return pageRef;
        
        
    }
    
}