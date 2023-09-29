trigger MyTriggerBulk on Account (before insert,before update) {
 for(Account a : Trigger.new) {
        a.Description = 'New description';
    }
}