public class TransactionController {
    public Date issueDate{get;set;}
    public Date expectedReturnDate{get;set;}
    public decimal tp{get;set;}
    List<selectOption> vehicleOptions = new List<selectOption>();
    public List<selectOption> getCarNames() {
        for(Vehicle__c vn : [SELECT Name FROM Vehicle__c WHERE Status__c != 'Lost/Stolen' OR Status__c != 'Decomissioned']) {
            vehicleOptions.add(new selectOption(vn.Name, vn.Name));
        }
        return vehicleOptions;
    }
    public void totalPrice(){
        if(issueDate == null || expectedReturnDate == null){
            return;
        }
        else{
        tp = issueDate.daysBetween(expectedReturnDate) * Vehicle__c.Base_Rental_Rate__c;
        }
    }
}