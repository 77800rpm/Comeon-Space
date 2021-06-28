package faq.model.vo;

import java.sql.Date;

public class Faq {
	private int boardFaqNum;
	private String boardFaqTitle;
	private String boardFaqContent;
	private Date createDate;
	private int boardCount;
	private String admName;
	
	public Faq() {}

	
	
	
	
	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent, Date createDate, int boardCount,
			String admName) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.admName = admName;
	}





	public Faq(String boardFaqTitle, String boardFaqContent) {
		super();
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
	}





	public Faq(int boardFaqNum, String boardFaqTitle, Date createDate, int boardCount) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.createDate = createDate;
		this.boardCount = boardCount;
	}


	public String getAdmName() {
		return admName;
	}


	public void setAdmName(String admName) {
		this.admName = admName;
	}


	public int getBoardFaqNum() {
		return boardFaqNum;
	}

	public void setBoardFaqNum(int boardFaqNum) {
		this.boardFaqNum = boardFaqNum;
	}

	public String getBoardFaqTitle() {
		return boardFaqTitle;
	}

	public void setBoardFaqTitle(String boardFaqTitle) {
		this.boardFaqTitle = boardFaqTitle;
	}

	public String getBoardFaqContent() {
		return boardFaqContent;
	}

	public void setBoardFaqContent(String boardFaqContent) {
		this.boardFaqContent = boardFaqContent;
	}


	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}





	@Override
	public String toString() {
		return "Faq [boardFaqNum=" + boardFaqNum + ", boardFaqTitle=" + boardFaqTitle + ", boardFaqContent="
				+ boardFaqContent + ", createDate=" + createDate + ", boardCount=" + boardCount + ", admName=" + admName
				+ "]";
	}





	


	

	
	
	
	
	
	
	
}
