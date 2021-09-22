@isTest
public class landingPageControllerTest {
    @isTest static void testChangeLoc() {
        PageReference pageRef = new PageReference('/apex/locations');
        PageReference testPageRef = changeLoc();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testSellCar() {
        PageReference pageRef = new PageReference('/apex/sellacar');
        PageReference testPageRef = sellCar();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testFAQ() {
        PageReference pageRef = new PageReference('/apex/casepage');
        PageReference testPageRef = faq();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testCarList() {
        PageReference pageRef = new PageReference('/apex/carlist');
        PageReference testPageRef = carList();
        system.assertEquals(pageRef, testPageRef);
    }
}