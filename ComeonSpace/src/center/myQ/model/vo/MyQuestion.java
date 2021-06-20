package center.myQ.model.vo;

import java.sql.Date;

public class MyQuestion {
	private int myQNum;
	private String myQTitle;
	private String myQContent;
	private String myQCategory;
	private String myQAnswer;
	private Date myQCreate;
	private int userNum;
	private int admNum;
	private String status;
	
	public MyQuestion() {}
	
	public MyQuestion(int myQNum, String myQTitle, String myQContent, String myQCategory, String myQAnswer, Date myQCreate,
			int userNum, int admNum, String status) {
		super();
		this.myQNum = myQNum;
		this.myQTitle = myQTitle;
		this.myQContent = myQContent;
		this.myQCategory = myQCategory;
		this.myQAnswer = myQAnswer;
		this.myQCreate = myQCreate;
		this.userNum = userNum;
		this.admNum = admNum;
		this.status = status;
	}


	public int getMyQNum() {
		return myQNum;
	}

	public void setMyQNum(int myQNum) {
		this.myQNum = myQNum;
	}

	public String getMyQTitle() {
		return myQTitle;
	}

	public void setMyQTitle(String myQTitle) {
		this.myQTitle = myQTitle;
	}

	public String getMyQContent() {
		return myQContent;
	}

	public void setMyQContent(String myQContent) {
		this.myQContent = myQContent;
	}

	public String getMyQCategory() {
		return myQCategory;
	}

	public void setMyQCategory(String myQCategory) {
		this.myQCategory = myQCategory;
	}

	public String getMyQAnswer() {
		return myQAnswer;
	}

	public void setMyQAnswer(String myQAnswer) {
		this.myQAnswer = myQAnswer;
	}

	public Date getMyQCreate() {
		return myQCreate;
	}

	public void setMyQCreate(Date myQCreate) {
		this.myQCreate = myQCreate;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getAdmNum() {
		return admNum;
	}

	public void setAdmNum(int admNum) {
		this.admNum = admNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
