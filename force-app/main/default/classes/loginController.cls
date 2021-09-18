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
        if (accessLevel.equals('Customer')) {
            List<Contact> cust = [SELECT Email, Password FROM Contact WHERE Email = :inputEmail AND Password = :inputPass];
            err = '';
        } else if (accessLevel.equals('Employee')) {
            List<Employee> emps = [SELECT Email, Password FROM Employee WHERE Email = :inputEmail AND Password = :inputPass];
            err = '';
        } else {
            err = 'Incorrect username or password.';
        }
        //append identifier to URL and redirect back to previous page
    }

}