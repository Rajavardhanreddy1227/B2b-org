global class CreateAccountEmailServiceExample implements Messaging.InboundEmailHandler {
    global messaging.InboundEmailresult handleInboundEmail(messaging.InboundEmail email, messaging.InboundEnvelope envelope) {
        string description='';
        system.debug('email========>' + email);
        system.debug('envelope====>' + envelope);
        messaging.InboundEmailresult result = new messaging.InboundEmailresult();
        string Activityname = email.fromname;
        system.debug('Activityname======>' + Activityname);
        String fromemailaddresss = email.fromAddress;
        system.debug('fromemailaddresss======>' + fromemailaddresss);
         description = email.plaintextbody;
        system.debug('description=====> '+description);
        string tasksubject = email.subject;
        List<Contact> conList = [select id,AccountId from contact where Account.isPartner=true and email=:fromemailaddresss];
        if(conList.size() > 0){
            Account acc = new Account();
            acc.id = conList[0].AccountId;
            
            
            if((description.contains('yes')) || (description.contains('Yes'))){
                acc.Accepted_Terms_Conditions1__c = 'Yes';
                acc.Active__c=true;
            }
            else if((description.contains('no')) || (description.contains('No'))){
                acc.Accepted_Terms_Conditions1__c = 'No';
                acc.Active__c=false;
            }
            update acc;
        }
        return null; 
    }
}