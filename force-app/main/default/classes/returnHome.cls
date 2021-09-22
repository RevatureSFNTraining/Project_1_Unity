public class returnHome {
	public PageReference returnToHome() {
        PageReference p = new PageReference('/apex/LandingPage');
        p.setRedirect(true);
        return p;
    }
}