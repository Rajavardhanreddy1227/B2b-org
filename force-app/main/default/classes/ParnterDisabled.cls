public class ParnterDisabled {
    public static void partnerDisabeld1(List<Account> accList){
        for(account acc:accList){
            If(acc.IsPartner == false ){
                acc.Accepted_Terms_Conditions1__c ='';
                acc.Active__c =false;
            }
        }
    }

}