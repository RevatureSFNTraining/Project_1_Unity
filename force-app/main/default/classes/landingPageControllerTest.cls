@isTest
public class landingPageControllerTest {
    @isTest static void testChangeLoc() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/locations');
        PageReference testPageRef = test.changeLoc();
        system.assertEquals(pageRef.getURL(), testPageRef.getURL());
    }

    @isTest static void testSellCar() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/sellacar');
        PageReference testPageRef = test.sellCar();
        system.assertEquals(pageRef.getURL(), testPageRef.getURL());
    }

    @isTest static void testFAQ() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/casepage');
        PageReference testPageRef = test.faq();
        system.assertEquals(pageRef.getURL(), testPageRef.getURL());
    }

    @isTest static void testCarList() {
        landingPageController test = new landingPageController();
        PageReference pageRef = new PageReference('/apex/carlist');
        PageReference testPageRef = test.carList();
        system.assertEquals(pageRef.getURL(), testPageRef.getURL());
    }
}