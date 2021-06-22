package faq.model.vo;

import java.sql.Date;

public class Faq {
	private int boardFaqNum;
	private String boardFaqTitle;
	private String boardFaqContent;
	private int admNum;
	private Date createDate;
	private int boardCount;
	
	public Faq() {}

	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent, int admNum, Date createDate,
			int boardCount) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
		this.admNum = admNum;
		this.createDate = createDate;
		this.boardCount = boardCount;
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

	public int getAdmNum() {
		return admNum;
	}

	public void setAdmNum(int admNum) {
		this.admNum = admNum;
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
				+ boardFaqContent + ", admNum=" + admNum + ", createDate=" + createDate + ", boardCount=" + boardCount
				+ "]";
	}

	
	
	
	
	
	
	
}
