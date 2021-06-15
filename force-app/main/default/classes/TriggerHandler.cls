public class TriggerHandler {
    public static Boolean isFirstTime = true;
    public static void acclist(list<id>idList){
        system.debug('idList=====>'+idList);
        list<case>csList=new list<case>();
        List<case>caseList=[select id,status,parent.status from case where parentid=:idList and status='closed'];//3
        List<case>caseList2=[select id,status from case where parentid=:idList];
        system.debug('caseList=======> '+caseList.size());
        system.debug('casList========>'+caseList2.size());
        map<string,case>caseMapList=new map<string,case>();
        if(caseList.size()==caseList2.size()){
            for(case c:caseList){	
                c.parent.status='Closed';
                caseMapList.put(c.parent.status,c.parent);
                system.debug('c.parent.status=========> '+c.parent.status +c.parentid);
            }
        }    
        update caseMapList.values();
    }
    
}