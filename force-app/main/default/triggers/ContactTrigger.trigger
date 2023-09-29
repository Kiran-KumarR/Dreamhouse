trigger ContactTrigger on Contact (before insert, before update) {
    Map<Id, Integer> accountContactCountMap = new Map<Id, Integer>();
    for (Contact newContact : Trigger.new) {
        if (newContact.AccountId != null) {
            accountContactCountMap.put(newContact.AccountId, 0);
        }
    }
    for (AggregateResult aggregateResult : [SELECT AccountId, COUNT(Id) contactCount FROM Contact WHERE AccountId IN :accountContactCountMap.keySet() GROUP BY AccountId]) {
        Id accountId = (Id) aggregateResult.get('AccountId');
        Integer contactCount = Integer.valueOf(aggregateResult.get('contactCount'));
        accountContactCountMap.put(accountId, contactCount);
    }
    for (Contact newContact : Trigger.new) {
        if (newContact.AccountId != null) {
            Integer contactCount = accountContactCountMap.get(newContact.AccountId);
            if (contactCount >= 5) {
                newContact.addError('The account with Id ' + newContact.AccountId + ' already has the maximum allowed contacts (5).');
            }
        }
    }
}