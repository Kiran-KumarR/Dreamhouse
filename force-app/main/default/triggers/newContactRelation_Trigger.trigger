/*Create a field called "Child Contacts" checkbox on the contact object and 
create the object called "Child Contact " which is related list to the Contacts (Lookup Relationship).
Now build a logic when we create contact by checking Child Contact checkbox, 
then child contact will be created automatically for that contact.

Sobject:Contact

custom object:Child Contacts of type Checkbox //Child_Contacts Child_Contacts__c

custom object:Child Contact of type lookup relation to contact//Child_Contact //object api Child_Contact__c

Child_Contact__c childContact = new Child_Contact__c();
childContact.Contact__c = contact.Id;

Contact__c //relationship
*/
trigger newContactRelation_Trigger on Contact (after insert,after update) {
   newContactRelation_Handler.createChildContact(Trigger.new);
}