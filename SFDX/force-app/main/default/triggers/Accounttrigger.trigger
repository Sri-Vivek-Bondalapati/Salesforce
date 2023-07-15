trigger Accounttrigger on Account (after insert,after update) {
    list<Opportunity> oppcpyh =new list<Opportunity>();
    
    
    for(Account a :[select id,name from Account where id in : trigger.new and id not in (select accountid from opportunity)])
    {
        
        Opportunity obj =new Opportunity();
        			obj.Name = a.Name +'opputunity';
        			obj.CloseDate = System.today().addmonths(1);
        			obj.StageName ='prospecting';
      				  obj.AccountId=a.id;
    				oppcpyh.add(obj);
    
    }
    insert oppcpyh;
    
}