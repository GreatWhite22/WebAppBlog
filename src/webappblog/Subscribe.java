package webappblog;

public class Subscribe {
	String firstName;
	String lastName;
	String emailAddress;
	
	public Subscribe() {}
	
	public Subscribe (String firstName, String lastName, String emailAddress){
		this.firstName = firstName;
		this.lastName = lastName;
		this.emailAddress = emailAddress;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
}
