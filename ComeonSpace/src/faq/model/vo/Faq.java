package faq.model.vo;

public class Faq {
	private int boardFaqNum;
	private String boardFaqTitle;
	private String boardFaqContent;
	private int admNum;
	
	public Faq() {}

	public Faq(int boardFaqNum, String boardFaqTitle, String boardFaqContent, int admNum) {
		super();
		this.boardFaqNum = boardFaqNum;
		this.boardFaqTitle = boardFaqTitle;
		this.boardFaqContent = boardFaqContent;
		this.admNum = admNum;
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
				+ boardFaqContent + ", admNum=" + admNum + "]";
	}
	
	
	
	
	
}
