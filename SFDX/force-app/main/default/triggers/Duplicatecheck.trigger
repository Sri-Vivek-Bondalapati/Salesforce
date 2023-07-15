trigger Duplicatecheck on Account (before insert)
{
    Set<String> accset = new Set<String>();
    
    for(Account acc: Trigger.new)
    {
        accset.add(acc.name);
        
    }
    
    Map<String,id> mapacc =new Map<String,id>();
    for(Account acc : [select id,name from Account where name = :accset])
    {
        mapacc.put(acc.name,acc.id);
    }
    
    for(Account acc: trigger.new)
    {
       id accountid= mapacc.get(acc.name);
        
        if(accountid!=null)
        {
            acc.name.addError('duplicate account');
        }
    }
   
}