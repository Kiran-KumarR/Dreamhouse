trigger CreateContactsOnAccount_Trigger on Account (after insert,after update) {
  List<Contact> con  = new List<Contact>();
    
    for (Account acc : Trigger.new) {
        if (acc.NumberofLocations__c != null) {
            Integer numLocations = Integer.valueOf(acc.NumberofLocations__c);
            
            for (Integer i = 0; i < numLocations; i++) {
                Contact newContact = new Contact();
                newContact.LastName = acc.Name+ (i + 1);
                newContact.AccountId = acc.Id;
                con.add(newContact);
            }
        }
    }

    if (!con.isEmpty()) {
        insert con;
    }
}