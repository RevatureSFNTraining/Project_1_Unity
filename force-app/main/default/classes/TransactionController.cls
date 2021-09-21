public class TransactionController {
    public Date issueDate{get;set;}
    public Date expectedReturnDate{get;set;}
    public decimal tp{get;set;}
    public string selectedId{get;set;}
    List<selectOption> vehicleOptions = new List<selectOption>();
    public List<selectOption> getCarNames() {
        for(Vehicle__c vn : [SELECT Name FROM Vehicle__c WHERE Status__c != 'Lost/Stolen' OR Status__c != 'Decomissioned']) {
            vehicleOptions.add(new selectOption(vn.Id, vn.Name));
        }
        return vehicleOptions;
    }
    public void totalPrice(){
        if(issueDate == null || expectedReturnDate == null){
            return;
        }
        else{
            List<Vehicle__c> vehicleRate = [SELECT Base_Rental_Rate__c FROM Vehicle__c WHERE id =: selectedId];
            tp = issueDate.daysBetween(expectedReturnDate) * vehicleRate[0].Base_Rental_Rate__c;
        }
    }
    public PageReference saveRecord() {
        Contact customer = new Contact(FirstName = UserInfo.getFirstName(), LastName=UserInfo.getLastName());
        insert customer;
        Rental_Contract__c newRental = new Rental_Contract__c();
        newRental.Issue_Date__c = issueDate;
        newRental.Expected_Return_Date__c = expectedReturnDate;
        newRental.Customer__c = customer.Id;
        newRental.Status__c = 'Active';
        newRental.Vehicle__c = selectedId;
        List<Vehicle__c> vehicleDepot = [SELECT id, stationed_Depot__c FROM Vehicle__c WHERE id =: selectedId]; 
        newRental.Issuing_Depot__c = vehicleDepot[0].stationed_Depot__c;
        List<Depot__c> depotList = [SELECT id, Owner__c FROM Depot__c WHERE id =: vehicleDepot[0].stationed_Depot__c];
        newRental.Company__c = depotList[0].Owner__c;
        insert newRental;
        return null;
    }
}