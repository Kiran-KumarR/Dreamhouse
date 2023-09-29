public class newContactRelation_Handler {
    public static void createChildContact(List<Contact> conList){
        List<Child_Contact__c> con1  = new List<Child_Contact__c>();
        
        for(Contact con :conList){
            if(con.Child_Contacts__c==True){
                
                Child_Contact__c childContact = new Child_Contact__c();
                childContact.Contact__c = con.Id;
                //   childContact.Contact__c = con.LastName;
                con1.add(childContact);
                
            }
        }
        
        if(!con1.IsEmpty()){
            insert con1;
        }
    }
}