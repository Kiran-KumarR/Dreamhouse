trigger AccountAddressTrigger on Account (before insert,before update) {
    for(account add:Trigger.New){		
    		if(add.Match_Billing_Address__c == True)
           	add.ShippingPostalCode = add.BillingPostalCode; 
		}
}