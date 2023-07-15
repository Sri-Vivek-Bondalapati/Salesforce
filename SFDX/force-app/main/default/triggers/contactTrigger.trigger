trigger contactTrigger on Contact (after insert) {
    set<id> accidset = new set<id>();                                                   
    for(Contact con : Trigger.new)
    {
        if(con.AccountID!=null)
        {
            accidset.add(con.AccountId);
        }
    }
    if(!accidset.isEmpty())
    {
       Map<Id,Account> accMap = new Map<id,Account>([select id,name,Type from Account where id in : accidset]);
        
        for(contact con : Trigger.new)
        {
            if(con.AccountId!=null)
            {
                con.Account_Type__c=accMap.get(con.AccountId).type;
            }
    }


 
    }
}