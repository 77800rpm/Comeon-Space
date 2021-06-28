package qna.model.vo;

import java.sql.Date;

public class Qna {
	private int qnaNum;
	private int userNum;
	private int hostNum;
	private int pNum;
	private String userProfile;
	private String userNick;
	private String qnaContent;
	private String qnaAnswer;
	private String pName;
	private Date qnaDate;
	private Date ansDate;
	
	public Qna() {}
	
	public Qna(int qnaNum, int userNum, int hostNum, int pNum, String userProfile, String userNick, String qnaContent,
			String qnaAnswer, String pName, Date qnaDate, Date ansDate) {
		super();
		this.qnaNum = qnaNum;
		this.userNum = userNum;
		this.hostNum = hostNum;
		this.pNum = pNum;
		this.userProfile = userProfile;
		this.userNick = userNick;
		this.qnaContent = qnaContent;
		this.qnaAnswer = qnaAnswer;
		this.pName = pName;
		this.qnaDate = qnaDate;
		this.ansDate = ansDate;
	}

	
	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserProfile() {
		return userProfile;
	}


	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}


	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getHostNum() {
		return hostNum;
	}

	public void setHostNum(int hostNum) {
		this.hostNum = hostNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

}
