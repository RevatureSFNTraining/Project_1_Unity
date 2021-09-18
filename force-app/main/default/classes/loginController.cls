public class loginController {
    public String accessLevel = 'CUSTOMER';
    public String inputEmail {get; set;}
    public String inputPass {get; set;}
    public String err = '';
    
    public PageReference test() {
        return null;
    }
    
    //return radio select options
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('CUSTOMER','Customer')); 
        options.add(new SelectOption('EMPLOYEE','Employee')); 
        return options; 
    }
    
    //return accessLevel
    public String getAccessLevel() {
        return accessLevel;
    }

    //set accessLevel if it is a valid access level
    public void setAccessLevel(String accessLevel) {
        if (accessLevel.equals('Customer') || accessLevel.equals('Employee')){
            this.accessLevel = accessLevel;
        }
    }

    //return error
    public String getErr() {
        return err;
    }
    
    public void login() {
        boolean goodPass = false;
        if (accessLevel.equals('Customer')) {
            List<Contact> cust = [SELECT Email, Password__c FROM Contact WHERE Email = :inputEmail];
            if (cust.size() > 0 && inputPass.equals(cust[0].Password__c))
                goodPass = true;
            err = '';
        } else if (accessLevel.equals('Employee')) {
            List<Employee__c> emps = [SELECT Work_Email__c, Password__c FROM Employee__c WHERE Work_Email__c = :inputEmail];
            if (emps.size() > 0 && inputPass.equals(emps[0].Password__c))
                goodPass = true;
            err = '';
        } else {
            err = 'Incorrect username or password.';
        }
        //if (goodPass && err.equals(''))
        //append identifier to URL and redirect back to previous page
    }

}