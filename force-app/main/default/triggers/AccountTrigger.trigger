trigger AccountTrigger on Account (before Update,after insert, after update) {
    
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
           
        }
        if (Trigger.isUpdate) {
            AccountHandlerClass.partnerDisabeld1(Trigger.new);
            
        }
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            
        } 
        if (Trigger.isUpdate) {
            AccountHandlerClass.partnerMethod(Trigger.new, Trigger.OldMap);
        }
        if (Trigger.isDelete) {
            
        }
    } 
    
}