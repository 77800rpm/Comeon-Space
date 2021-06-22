package faq.model.vo;

import java.sql.Date;

public class Faq {
	private int boardFaqNum;
	private String boardFaqTitle;
	private String boardFaqContent;
	private int admNum;
	private String status;
	private Date date;
	
	public Faq() {}
	

	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent, int admNum, String status, Date date) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
		this.admNum = admNum;
		this.status = status;
		this.date = date;
	}



	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
	}



	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent, int admNum) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
		this.admNum = admNum;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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


	@Override
	public String toString() {
		return "Faq [boardFaqNum=" + boardFaqNum + ", boardFaqTitle=" + boardFaqTitle + ", boardFaqContent="
				+ boardFaqContent + ", admNum=" + admNum + ", status=" + status + ", date=" + date + "]";
	}

	
	
	
	
	
}
