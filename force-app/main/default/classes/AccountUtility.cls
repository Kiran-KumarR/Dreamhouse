public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList=[Select Name,AnnualRevenue from Account];
        String acctRev ;
		
        for(Account acc:accountsList){
            acctRev=acc.Name+':'+acc.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}