/*
*Name: SupplierTriggerTest.apxc
*Author: Julia Weakley
*DateCreated: 8/30/2021
*DateModified: 8/31/2021
*Description: 
*	Tests for carWizardController 
*/

@isTest
public class CarWizardControllerTest 
{
	 @testSetup
    static void setup()
    {
			Account testaccount = new Account(); 
			testaccount.Name = 'Test';  
        	insert testaccount; 
        
        	Depot__c testDepot = new Depot__c(); 
        	testDepot.Name ='TestD'; 
        	insert testDepot; 
    }
    
    // test that all accounts are retrieved for users to select an option
     @isTest
    private static void companyOptionsTest()
    {
        
        List<SelectOption> options = new List<SelectOption>(); 
       	List<Account> lis = [SELECT Name FROM Account];
       
        for(Account accs :lis )
        {
           options.add(new SelectOption(accs.id,accs.Name ));
        } // end of for
        
        System.assertEquals(options, CarWizardController.getcompanyOptions());
    } // end of test
    
    //test that depots are retrieved as OPtions correctly
    @isTest
    private static void getdepotOptionsTest()
    {
     	List<SelectOption> options = new List<SelectOption>(); 
       	List<Depot__c> lis = [SELECT Name FROM Depot__c];
       
        for(Depot__c dep :lis )
        {
           options.add(new SelectOption(dep.id,dep.Name ));
        }// end of for
        
        System.assertEquals(options, CarWizardController.getdepotOptions());
    }// end of test
    
     @isTest
    private static void  getManufacturerOptionsTest()
    {
        System.assertEquals(0, CarWizardController.getManufacturerOptions().size());
    }
    
     @isTest
    private static void  oneValueGetManufacturerOptionsTest()
    {
        Manufacturer__c testmanu = new Manufacturer__c();
        testmanu.Name = 'mantest';
        insert testmanu; 
        
        System.assertEquals(1, CarWizardController.getManufacturerOptions().size());
    }
    
    @isTest
    public static  void addAnotherVehicleTest()
    {
      
    }
    
} // end of test class