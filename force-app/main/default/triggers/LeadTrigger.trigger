trigger LeadTrigger on Lead (before insert,before update) {
    for(Lead lo : Trigger.new){
          if(lo.LeadSource == 'PhoneInquiry'){
          
            lo.Rating='Hot';
        }else{
            lo.Rating='Cold';
        }
    }
}