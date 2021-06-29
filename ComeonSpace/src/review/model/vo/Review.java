package review.model.vo;

import java.sql.Date;

/*
 * 리뷰에 대한 vo
 */

public class Review {
	private int revNum;			// 리뷰 번호
	private int pNum;			// 공간 번호
	private int userNum;		// 회원 번호
	private String userProfile;	// 회원 프로필
	private String userNick;	// 회원 닉네임
	private String revContent;	// 리뷰 내용
	private String pName;		// 공간 명
	private Date revDate;		// 리뷰 날짜
	
	public Review() {}

	public Review(int revNum, int pNum, int userNum, String userProfile, String userNick, String revContent,
			String pName, Date revDate) {
		super();
		this.revNum = revNum;
		this.pNum = pNum;
		this.userNum = userNum;
		this.userProfile = userProfile;
		this.userNick = userNick;
		this.revContent = revContent;
		this.pName = pName;
		this.revDate = revDate;
	}

	public int getRevNum() {
		return revNum;
	}

	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	@Override
	public String toString() {
		return "Review [revNum=" + revNum + ", pNum=" + pNum + ", userNum=" + userNum + ", userProfile=" + userProfile
				+ ", userNick=" + userNick + ", revContent=" + revContent + ", pName=" + pName + ", revDate=" + revDate
				+ "]";
	}
	
	
	
}
