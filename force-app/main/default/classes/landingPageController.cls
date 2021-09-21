public class landingPageController {
    public Vehicle__c vehicle1 {get; set;}
    public Vehicle__c vehicle2 {get; set;}
    public Vehicle__c vehicle3 {get; set;}
    
    //public controller to grab top 3 rented cars currently
    public landingPageController() {
        String depot = System.currentPageReference().getParameters().get('depot_id');
        List<Vehicle__c> vehicleInfo = [SELECT Id, Vehicle_make__c, Vehicle_model__c, Vehicle_year__c, Description__c, Stationed_depot__c FROM Vehicle__c WHERE Stationed_depot__c = :depot];
        List<Rental_Contract__c> contracts = [SELECT Id, Vehicle__c, Issuing_depot__c FROM Rental_Contract__c WHERE Issuing_depot__c = :depot];
        Map<String, Integer> numOfContracts = new Map<String, Integer>();
        integer most = 0;
        integer most2 = 0;
        integer most3 = 0;
        for(Integer i = 0; i < contracts.size(); i++) {
            if (!numOfContracts.containsKey(contracts[i].Vehicle__c)) {
                numOfContracts.put(contracts[i].Vehicle__c, 1);
            } else if(numOfContracts.containsKey(contracts[i].Vehicle__c)) {
                numOfContracts.put(contracts[i].Vehicle__c, numOfContracts.get(contracts[i].Vehicle__c) + 1);
            }
        }
        for(Integer a = 0; a < vehicleInfo.size(); a++) {
            Integer num = numofContracts.get(vehicleInfo[a].Id);
            Vehicle__c v = vehicleInfo[a];
            if (num > most) {
                most3 = most2;
                most2 = most;
                most = num;
                vehicle3 = vehicle2;
                vehicle2 = vehicle1;
                vehicle1 = v;
            } else if (num > most2) {
                most3 = most2;
                most2 = num;
                vehicle3 = vehicle2;
                vehicle2 = v;
            } else if(num > most3) {
                most3 = num;
                vehicle3 = v;
            }
        }
    }
    
    // Check if location has been set or not
    public PageReference verifyLocation() {
        PageReference pr = new PageReference('/apex/locations');
        pr.setRedirect(true);
        if (System.currentPageReference().getParameters().get('depot_id') == null) {
            return pr;
        } else {
            return null;
        }
    }

    //redirect to Location page to change location
    public PageReference changeLoc() {
        PageReference pageRef = new PageReference('/apex/locations');
        pageRef.setRedirect(true);
        return pageRef;
    }
    
    //redirect to carList page for rental process
    public PageReference carList() {
        PageReference pageRef = new PageReference('/apex/carlist');
        pageRef.setRedirect(true);
        pageRef.getParameters().put('depot_id',System.currentPageReference().getParameters().get('depot_id'));
        return pageRef;
    }
    
    //redirect to faq page
    public PageReference faq() {
        PageReference pageRef = new PageReference('/apex/casepage');
        pageRef.setRedirect(true);
        pageRef.getParameters().put('depot_id',System.currentPageReference().getParameters().get('depot_id'));
        return pageRef;
    }
    
    //redirect to sell car page
    public PageReference sellCar() {
        PageReference pageRef = new PageReference('/apex/sellacar');
        pageRef.setRedirect(true);
        pageRef.getParameters().put('depot_id',System.currentPageReference().getParameters().get('depot_id'));
        return pageRef;
    }
}