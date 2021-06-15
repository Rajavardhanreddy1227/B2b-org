public class AccountHandlerClass {
    public static void partnerMethod(List<Account> accList,Map<Id,Account> oldMap){
        Set<Id> accId = new Set<Id>();
        for(Account acc : accList){
           
            if(acc.IsPartner == true && oldMap.get(acc.id).IsPartner == false){
                accId.add(acc.id);
               
            }
           
        }
        map<string,string>accountMap = New map<string,string>();
        list<string>contactEmail = New list<string>();
        list<string>contactName = New list<string>();
        List<Account>aList=[SELECT Id, Name, IsPartner, (select id, Name, email from contacts) from Account where id=:accId];
        String conId ='';
        if(aList.size()>0){
            for(Account acc:aList){
               
                for(Contact con:acc.contacts){
                    conId = con.id;
                    contactEmail.add(con.email);
                    contactName.add(con.name);  
                }
            }
        }
      List<string>recipientsMail=new list<string>();
        if(contactEmail.size() > 0){
            recipientsMail.add(contactEmail[0]);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setTargetObjectId(conId);
            mail.setToAddresses(recipientsMail);
            mail.setSaveAsActivity(true);
            mail.setReplyTo('accountemailservice@2cqdzx59752688iw0xwv6wx3wvcgmb5m2oy8dqnq8u22otg53a.2f-8chteai.cs34.apex.sandbox.salesforce.com');
            mail.setSenderDisplayName('Terms And Conditions For Project Handling');
            mail.setSubject('Terms And Conditions of Project ');
            mail.setPlainTextBody('Reply us At Early.');
            String body = 'Dear ' +contactName[0] +',';
            body += '<br/>';
            body += '* Project Duration Will be 200 Working Days ';
            body += '<br/>';
            body += '* Office Location Will Be Ajit Singh Nagar/Mohali ';
            body += '<br/>';
            body += 'Reply us for Above Terms And Conditions From Below Reply Section';
            mail.setHtmlBody(body);
            Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});
        }
    }
    public static void partnerDisabeld1(List<Account> accList){
        for(account acc:accList){
            If(acc.IsPartner == false ){
                acc.Accepted_Terms_Conditions1__c ='';
                acc.Active__c =false;
            }
        }
    }


}