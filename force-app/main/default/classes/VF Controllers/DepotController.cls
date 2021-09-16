public class DepotController {

    static final Integer MAX_ENTRIES_PER_PAGE = 10;
    
    public List<Account> accounts {get; private set;}
    public List<Depot__c> depots {get; private set;}
    
    public String accountId {get; set;}
    public String pageNumber {get; set;}
    
    public DepotController() {
        accounts = [SELECT Id, Name FROM Account];
        depots = new List<Depot__c>(); //empty list for now
        accountId = null;
        pageNumber = '1';
    }
    
    public List<SelectOption> getAccountItems() {
        List<SelectOption> items = new List<SelectOption>();
        items.add(new SelectOption('', ''));
        for (Account acc : accounts) {
            items.add(new SelectOption(acc.Id, acc.Name));
        }
        accountId = items[0].getValue();
        return items;
    }
    
    public Integer getFirstIndex() {
        return (Integer.valueOf(pageNumber) - 1) * MAX_ENTRIES_PER_PAGE;
    }
    
    public Integer getNumEntriesPerPage() {
        return MAX_ENTRIES_PER_PAGE;
    }
    
    public List<SelectOption> getPageNumbers() {
        List<SelectOption> pages = new List<SelectOption>();
        Integer totalPages = (Integer) Math.ceil((Decimal) depots.size() / MAX_ENTRIES_PER_PAGE);
        for (Integer i = 1; i <= totalPages; i++) {
            pages.add(new SelectOption(String.valueOf(i), String.valueOf(i)));
        }
        return pages;
    }
    
    public PageReference filterByAccount() {
        depots = [SELECT Id, Name, Owner__r.Name, Depot_Manager__c, Address__c, Primary_Phone__c FROM Depot__c WHERE Owner__c = :accountId ORDER BY Name];
        pageNumber = '1'; //Reset page number after refreshing depot list with new data.
        return null;
    }
}