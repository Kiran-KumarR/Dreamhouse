trigger LeadTrigger1 on Lead (before update) {
     for(Lead co : trigger.new){
         if(Trigger.oldmap.get(co.ID).LeadSource == 'Web' && co.LeadSource == 'Phone Inquiry')
         {
              co.Rating='Hot';
         }
     }
}