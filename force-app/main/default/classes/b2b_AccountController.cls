global with sharing class b2b_AccountController
{
    global Boolean eligibleAccount {get;private set;}
    global b2b_AccountController()
    {
        ccrz.ccLog.log(System.LoggingLevel.INFO, 'M:E',
                       'b2b_AccountController' );
        List<Object> acctRes = (List<Object>)ccrz.ccApiAccount.fetch(new
                                                                     Map<String,Object>
                                                                     {
                                                                         ccrz.ccApi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
                                                                             ccrz.ccApiAccount.ID => ccrz.cc_CallContext.currAccountId,
                                                                             ccrz.ccApi.SIZING=>new Map<String, Object>{
                                                                                 ccrz.ccApiAccount.ENTITYNAME => new Map<String, Object>
                                                                                 { ccrz.ccAPI.SZ_SKIPTRZ=> true }
                                                                             }
                                                                     }).get(ccrz.ccApiAccount.ACCOUNTS);
        Account account = null;
        if(acctRes.get(0) != null)
        {
            account = (Account)acctRes.get(0);
            eligibleAccount = account.EligibleAccount__c == null ? false: account.EligibleAccount__c;
        }
        ccrz.ccLog.log(System.LoggingLevel.DEBUG,
                       'D:b2b_AccountController:eligibleAccount', eligibleAccount ); }
}