public class TransactionController {
    public Date issueDate{get;set;}
    public Date expectedReturnDate{get;set;}
    public decimal tp{get;set;}
    public string selectedId{get;set;}
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
        tp = issueDate.daysBetween(expectedReturnDate) * 25.77;
        }
    }
    public PageReference saveRecord() {
        Contact customer = new Contact(FirstName = UserInfo.getFirstName(), LastName=UserInfo.getLastName());
        insert customer;
        Rental_Contract__c newRental = new Rental_Contract__c();
        newRental.Issue_Date__c = issueDate;
        newRental.Expected_Return_Date__c = expectedReturnDate;
        newRental.Customer__c = customer;
        newRental.Status__c = 'Checked Out';
        List<Vehicle__c> vehicleDepot = [SELECT stationed_Depot__c FROM Vehicle__c WHERE id =: selectedId];
        newRental.Vehicle__c = selectedId;
        newRental.Issuing_Depot__c = vehicleDepot[0].stationed_Depot__c;
        List<Depot__c> depotList = [SELECT Company__c FROM Depot__c WHERE id =: vehicleDepot[0].stationed_Depot__c];
        newRental.Company__c = depotList[0].Company__c;
        insert newRental;
        return null;
    }
}