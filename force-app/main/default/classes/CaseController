public class CaseController {
    public ApexPages.StandardController stdCntrlr {get; set;}
    
    public CaseController(ApexPages.StandardController controller) {
        
        stdCntrlr = controller;
    }
    
    public Case cs{get; set;}
    public CaseController(){
        cs = new Case();
    }
    
 	public PageReference save(){
       if(cs != null) {
            upsert cs;
        } else {
            stdCntrlr.save();
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Successfully inserted Case.'));
            PageReference pr = new PageReference('/apex/CasePage');
   			pr.setRedirect(true);
   			return pr;
        }
        return null;
    }
    
}

//comment
