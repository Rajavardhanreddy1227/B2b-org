trigger CloseParentCaseTrigger on Case (After insert,After update) {
    list<id>idList=new list<id>();
    if(Trigger.IsAfter && Trigger.IsUpdate){
        
        for(case c:Trigger.New){
            idList.add(c.parentId);
        }
        system.debug('idList====>'+idList);
        
        TriggerHandler.acclist(idList);
        //system.debug('TriggerHandler.acclist(idList)====>'+TriggerHandler.acclist(idList));
        
    }
    
    if(Trigger.IsAfter && Trigger.IsInsert){
        
        for(case c:Trigger.New){
            idList.add(c.parentId);
        }
        TriggerHandler.acclist(idList);
        
    }
}