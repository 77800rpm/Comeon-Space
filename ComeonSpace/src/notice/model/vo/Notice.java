package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNum;
	private String nTitle;
	private String nContent;
	private String nCategory;
	private int admNum;
	private String status;
	private Date date;
	
	
	public Notice(int nNum, String nTitle, String nContent, String nCategory, int admNum, String status, Date date) {
		super();
		this.nNum = nNum;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCategory = nCategory;
		this.admNum = admNum;
		this.status = status;
		this.date = date;
	}
	
	public Notice(int nNum, String nTitle, String nContent, String nCategory, int admNum, Date date) {
		super();
		this.nNum = nNum;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCategory = nCategory;
		this.admNum = admNum;
		this.date = date;
	}
	
	public Notice(String nTitle, String nContent, String nCategory) {
		super();
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCategory = nCategory;
	}
	
	public Notice(int nNum, String nTitle, String nContent, Date date) {
		super();
		this.nNum = nNum;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.date = date;
	}

	public Notice(int nNum, String nTitle, String nContent, String nCategory) {
		super();
		this.nNum = nNum;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nCategory = nCategory;
	}

	public int getnNum() {
		return nNum;
	}
	public void setnNum(int nNum) {
		this.nNum = nNum;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnCategory() {
		return nCategory;
	}
	public void setnCategory(String nCategory) {
		this.nCategory = nCategory;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}