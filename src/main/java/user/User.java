package user;
 
public class User {
    private String userID;
    private String userPassword;
    private String userNumber;
    private String userEmail;
    private String userAge;
    
    public String getUserID() {
        return userID;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }
    public String getUserPassword() {
        return userPassword;
    }
    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
	public String getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(String user_Number) {
		this.userNumber = user_Number;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
 
}