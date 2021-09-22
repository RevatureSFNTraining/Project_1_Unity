@isTest
public class landingPageControllerTest {
    @isTest static void testChangeLoc() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/locations');
        PageReference testPageRef = test.changeLoc();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testSellCar() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/sellacar');
        PageReference testPageRef = test.sellCar();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testFAQ() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/casepage');
        PageReference testPageRef = test.faq();
        system.assertEquals(pageRef, testPageRef);
    }

    @isTest static void testCarList() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/carlist');
        PageReference testPageRef = test.carList();
        system.assertEquals(pageRef, testPageRef);
    }
}