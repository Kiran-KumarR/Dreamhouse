trigger caseOrigin on Case (before insert,before update ) {
 for(Case co : Trigger.new){
     

        if(co.Origin == 'Phone'){
          
            co.Priority='High';
        }else{
            co.Priority='Low';
        }
    }
}