trigger IndustryTrigger on Account (after insert,after update) {
    List<Contact> c=new List<Contact>();
    for(Account ac:Trigger.new){
        if(ac.Industry=='Banking'){
            Contact cc=new Contact();
            cc.AccountId=ac.Id	;
         	cc.LastName=ac.Name;
            cc.Phone=ac.Phone;
            //System.debug(cc);
       
            c.add(cc);
            
        }
 
    }
    if(c.size()>0){
         insert c;
    }
       
}