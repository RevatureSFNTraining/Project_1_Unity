public class CarListController {
	public List<Vehicle__c> vehicleList{get;set;} 
    public CarListController(){
        vehicleList = new List<Vehicle__c>();
        vehicleList = [SELECT Id, Name, Vehicle_Type__c, Vehicle_Year__c, Vehicle_Make__c, Vehicle_Model__c, Status__c, Description__c FROM Vehicle__c Where Status__c != 'Lost/Stolen' OR Status__c != 'Decomissioned' ORDER BY Status__c];  
    }
    public PageReference redirect() {
        PageReference p = new PageReference('/apex/Transaction');
        p.setRedirect(true);
        return p;
    } 
}