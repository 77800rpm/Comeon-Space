package member.model.vo;

import java.sql.Date;

public class Member {
	private int userNum;
	private String userEmail;
	private String userPwd;
	private String userName;
	private String userNic;
	private String userPhone;
	private Date userCreate;
	private String userDiv;
	private String userStatus;
	
	public Member() {}
	
	

	public Member(int userNum, String userEmail, String userPwd, String userName, String userNic, String userPhone,
			Date userCreate, String userDiv, String userStatus) {
		super();
		this.userNum = userNum;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNic = userNic;
		this.userPhone = userPhone;
		this.userCreate = userCreate;
		this.userDiv = userDiv;
		this.userStatus = userStatus;
	}

	public Member(String userEmail, String userPwd, String userName, String userNic, String userPhone, Date userCreate,
			String userDiv, String userStatus) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNic = userNic;
		this.userPhone = userPhone;
		this.userCreate = userCreate;
		this.userDiv = userDiv;
		this.userStatus = userStatus;
	}
	
	public Member(String userEmail, String userPwd, String userName, String userNic, String userPhone, String userDiv) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNic = userNic;
		this.userPhone = userPhone;
		this.userDiv = userDiv;
	}


	
	public Member(String userEmail, String userName, String userNic, String userPhone) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
		this.userNic = userNic;
		this.userPhone = userPhone;
	}


	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	

	public Member(String userEmail, String userPwd) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNic() {
		return userNic;
	}

	public void setUserNic(String userNic) {
		this.userNic = userNic;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Date getUserCreate() {
		return userCreate;
	}

	public void setUserCreate(Date userCreate) {
		this.userCreate = userCreate;
	}

	public String getUserDiv() {
		return userDiv;
	}

	public void setUserDiv(String userDiv) {
		this.userDiv = userDiv;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "Member [userNum=" + userNum + ", userEmail=" + userEmail + ", userPwd=" + userPwd + ", userName="
				+ userName + ", userNic=" + userNic + ", userPhone=" + userPhone + ", userCreate=" + userCreate
				+ ", userDiv=" + userDiv + ", userStatus=" + userStatus + "]";
	}
	
	
}
