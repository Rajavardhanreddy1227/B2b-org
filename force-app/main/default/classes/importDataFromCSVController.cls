public class importDataFromCSVController {
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public List<account> acclist{get;set;}
    //public List<Contact> conlist{get;set;}
    public importDataFromCSVController(){
        csvFileLines = new String[]{};
            acclist = New List<Account>(); 
           // conlist=  New List<Contact>();
    }
    
    public void importCSVFile(){
        try{
            csvAsString = csvFileBody.toString();
            csvFileLines = csvAsString.split('\n'); 
            
            for(Integer i=1;i<csvFileLines.size();i++){
                Account acc = new Account();
                //Contact con= new Contact();
                string[] csvRecordData = csvFileLines[i].split(',');
                acc.name = csvRecordData[0] ;             
                acc.accountnumber = csvRecordData[1];
                acc.Phone=csvRecordData[2];
                acc.AccountSource = csvRecordData[3];   
                acc.Industry = csvRecordData[4];
                //con.LastName=csvRecordData[5];
                acclist.add(acc);
                //conlist.add(con);
            }
            insert acclist;
            //insert conlist;
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
    }
}