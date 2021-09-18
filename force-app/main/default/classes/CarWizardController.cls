/*
*Name: CarWizardController
*Author: Julia Weakley
*DateCreated: 9/13/2021
*DateModified: 9/17/2021
*Description: 
*	
*/


public class CarWizardController 
{
    public vehicle__c vec {get;set;}
    public Purchase_Transaction__c tran{get;set;}
    
    public CarWizardController()
    {
        vec = new vehicle__c(); 
        tran = new Purchase_Transaction__c(); 
     } // end of CarWizardController
    
    // first page of wizard
    public PageReference start()
    {
        Vehicle__c anewv = new Vehicle__c(); 
        Purchase_Transaction__c aNewTran = new Purchase_Transaction__c();
        tran.id = aNewTran.Id; 
        vec.id = anewv.id; 
        
        return page.SellACar; 
    } // end of start()
    
    // send user to page for filling out Company Information
    public PageReference sellerInfo()
    {
        return page.SellerInformation; 
    }// end of sellerInfo
    
    // send user back to page for filling out company information
    public PageReference backToYourInfo()
    {
        return page.SellerInformation; 
    }// end of backToYourInfo()
   
    // send user to page for after vehicle gets saved
    public PageReference saveVehicle()
    {
         
       // insert purchase transaction if it does not exist already
        List<Purchase_Transaction__c> tranList = [SELECT ID FROM Purchase_Transaction__c where id =: tran.id];
      	if(tranList.size() == 0)
        {
        	tran.Purchase_Date__c = System.today();
       		insert tran;
        }
      
        vec.Purchase_Transaction__c = tran.Id; 
        
        insert vec;
        
         return Page.CompletedPage; 
    } // end of saveVehicle()
    
    
   
    public PageReference saveAnother()
    {
       
       List<Purchase_Transaction__c> tranList = [SELECT ID FROM Purchase_Transaction__c where id =: tran.id];
      	if(tranList.size() == 0)
        {
        	tran.Purchase_Date__c = System.today();
       		insert tran;
        }
         vec.Purchase_Transaction__c = tran.Id; 
        
        insert vec;
        
         return Page.CompletedPage; 
    }
    
    public PageReference addAnotherVehicle()
    {
      
       List<Purchase_Transaction__c> tranList = [SELECT ID FROM Purchase_Transaction__c where id =: tran.id];
      	if(tranList.size() == 0)
        {
        	tran.Purchase_Date__c = System.today();
       		insert tran;
        }
        
      
        vec.Purchase_Transaction__c = tran.Id; 
        
        insert vec;
        
        Vehicle__c anotherv = new Vehicle__c(); 
        vec.id = anotherv.id; 
        
        return page.AdditionalVehicle; 
    }
     //creates option list for companies 
    public static List<SelectOption> getcompanyOptions()
    {
        List<SelectOption> options = new List<SelectOption>(); 
       	List<Account> lis = [SELECT Name FROM Account];
       
        for(Account accs :lis )
        {
           options.add(new SelectOption(accs.id,accs.Name ));
        }// end of for
        
        return  options;
    } // getcompanyOptions
    
     //creates option list for Depot
    public static List<SelectOption> getdepotOptions()
    {
        List<SelectOption> options = new List<SelectOption>(); 
       	List<Depot__c> lis = [SELECT Name FROM Depot__c];
       
        for(Depot__c dep :lis )
        {
           options.add(new SelectOption(dep.id,dep.Name ));
        }// end of for
        
        return  options;
    } // getcompanyOptions
    
     public static List<SelectOption> getManufacturerOptions()
    {
        List<SelectOption> options = new List<SelectOption>(); 
       	List<Manufacturer__c> lis = [SELECT Name FROM Manufacturer__c];
       
        for(Manufacturer__c man :lis )
        {
           options.add(new SelectOption(man.id,man.Name ));
        }// end of for
        
        return  options;
    } // getcompanyOptions
    
    // returns options for transactions
   
    
    // creates option list for users
 /**    public List<SelectOption> getauthUsers()
     {
         List<SelectOption> options = new List<SelectOption>(); 
         List<User> users = [SELECT Name FROM User ]; 
         
         for(User us :users)
        {
           options.add(new SelectOption(us.id,us.Name ));
        } // end of for
        
         return  options;
         
     } // end of getauthUsers
    */
   
    
    
    
}