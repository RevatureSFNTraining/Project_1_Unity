@isTest
public class TransactionControllerTest {
    @isTest public static void testVehicleOptions() {
        List<SelectOption> vehicleOptions = new List<SelectOption>();
        List<Vehicle__c> veh = [SELECT Name FROM Vehicle__c WHERE Status__c != 'Lost/Stolen' OR Status__c != 'Decomissioned'];
        for(Vehicle__c vehicles: veh) {
            vehicleOptions.add(new SelectOption(vehicles.id, vehicles.Name));
        }
        System.assertEquals(vehicleOptions, whattododo.getCarNames());
    }
    @isTest public static void testAddRentalContract(){
        Contact testContact = new Contact(lastName='test');
        insert testContact;
        Account testAcc = new Account(Name = 'test');
        insert testAcc;
        Depot__c testDep = new Depot__c(Name = 'test', Address__c = '123 st', Owner__c = testAcc.Id);
        insert testDep;
        Vehicle__c testVeh = new Vehicle__c(Name = 'test', Vehicle_Identification_Number__c = 'test', Vehicle_Year__c = 2021, Vehicle_Make__c = 'Acura', Vehicle_Model__c = 'test', Condition__c = 'Brand New', Status__c = 'Checked In', Odometer_Mileage__c = 0, Base_Rental_Rate__c = 1, Stationed_Depot__c = testDep.Id);
        insert testVeh;
        Rental_Contract__c testCon = new Rental_Contract__c();
        testCon.Company__c = testAcc.Id;
        testCon.Vehicle__c = testVeh.Id;
        testCon.Customer__c = testContact.Id;
        testCon.Name = 'test';
        testCon.Issue_Date__c = System.today();
        testCon.Expected_Return_Date__c = System.today();
        testCon.Issuing_Depot__c = testDep.Id;
        insert testCon;
        Test.startTest();
        whattododo cc = new whattododo();
        cc.saveRecord();
        List<Rental_Contract__c> testRentList = [SELECT id FROM Rental_Contract__c];
        Test.stopTest();
        System.assertEquals(1, testRentList.size());
        
    }
    @isTest public static void testPageRef() {
       
        whattododo controller = new whattododo();
        PageReference carList = controller.saveRecord();
        String param = System.currentPageReference().getParameters().get('depot_id');
        System.assertEquals(null, param);
}
    @isTest public static void testPrice() {
        Date testDate1 = date.newInstance(2021, 09, 22);
        Date testDate2 = date.newInstance(2021, 09, 23);
        Contact testContact = new Contact(lastName='test');
        insert testContact;
        Account testAcc = new Account(Name = 'test');
        insert testAcc;
        Depot__c testDep = new Depot__c(Name = 'test', Address__c = '123 st', Owner__c = testAcc.Id);
        insert testDep;
        Vehicle__c testVeh = new Vehicle__c(Name = 'test', Vehicle_Identification_Number__c = 'test', Vehicle_Year__c = 2021, Vehicle_Make__c = 'Acura', Vehicle_Model__c = 'test', Condition__c = 'Brand New', Status__c = 'Checked In', Odometer_Mileage__c = 0, Base_Rental_Rate__c = 1, Stationed_Depot__c = testDep.Id);
        insert testVeh;
        Rental_Contract__c testCon = new Rental_Contract__c();
        testCon.Company__c = testAcc.Id;
        testCon.Vehicle__c = testVeh.Id;
        testCon.Customer__c = testContact.Id;
        testCon.Name = 'test';
        testCon.Issue_Date__c = testDate1;
        testCon.Expected_Return_Date__c = testDate2;
        testCon.Issuing_Depot__c = testDep.Id;
        insert testCon;
        whattododo cc = new whattododo();
        cc.totalPrice();
        System.assertEquals(1, testCon.totalPrice__c);
    }
}